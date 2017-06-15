class BillsController < ApplicationController

  get '/bills' do
    if logged_in?
      @user = current_user
      erb :'/bills/index'
    else
      redirect '/'
    end
  end

  get '/bills/new' do
    if logged_in?
      erb :'/bills/new'
    else
      redirect '/'
    end
  end

  post '/bills' do
    @bill = Bill.create(params)
    if @bill.valid?
      user = current_user
      user.bills << @bill
      redirect :"/bills/#{@bill.id}"
    else
      redirect '/bills/new'
    end
  end

  get '/bills/:id' do
    if logged_in?
      @bill = Bill.find(params[:id])
      erb :'/bills/show'
    else
      redirect '/'
    end
  end

  get '/bills/:id/edit' do
    if logged_in?
      @bill = Bill.find(params[:id])
      erb :'bills/edit'
    else
      redirect '/login'
    end
  end

end

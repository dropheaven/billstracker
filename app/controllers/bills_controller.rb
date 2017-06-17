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
    @bill = Bill.find(params[:id])

    if logged_in? && current_user.id == @bill.user.id
      erb :'/bills/show'
    elsif logged_in?
      redirect '/bills'
    else
      redirect '/'
    end
  end

  get '/bills/:id/edit' do
    @bill = Bill.find(params[:id])

    if logged_in? && current_user.id == @bill.user.id
      erb :'bills/edit'
    else
      redirect '/login'
    end
  end

  patch '/bills/:id' do
    if params[:name] == "" || params[:amount] == ""
      redirect "/bills/#{params[:id]}/edit"
    else
      @bill = Bill.find(params[:id])
      @bill.name = params[:name]
      @bill.amount = params[:amount]
      @bill.due_date = params[:due_date]
      @bill.save
      redirect '/bills'
    end
  end


  delete '/bills/:id/delete' do
    if logged_in?
      @bill = Bill.find(params[:id])
      @bill.delete
      redirect '/bills'
    else
      redirect '/login'
    end
  end

end

require "rack-flash"

class UsersController < ApplicationController

  use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect '/bills'
    else
      erb :'/users/create_user'
    end
  end

  post '/signup' do
    if params[:full_name] == "" || params[:email] == "" || params[:password] == "" || params[:due_date]
      flash[:message] = "Error, please fill in all fields"
      redirect '/signup'
    else
      user = User.create(params)
      session[:user_id] = user.id
      redirect '/bills'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/bills'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/bills"
    else
      flash[:message] = "Please enter valid email and password"
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end

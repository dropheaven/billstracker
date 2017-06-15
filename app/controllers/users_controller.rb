class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      redirect '/bills'
    else
      erb :'/users/create_user'
    end
  end

  post '/signup' do
    @user = User.create(params)
    if !@user.valid?
      redirect '/signup'
    else
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

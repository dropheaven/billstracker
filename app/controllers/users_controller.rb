class UsersController < ApplicationController

  get '/signup' do
    if !logged_in?
      redirect '/bills'
    else
      erb :'/users/create_user'
    end
  end

  post '/signup' do
    
  end


end

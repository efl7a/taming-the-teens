class ChoresController < ApplicationController
  get '/chores' do
    redirect '/chores/new'
  end

  get '/chores/new' do
    if logged_in?
      erb :'chores/new'
    else
      redirect '/'
    end
  end

  get '/chores/:id' do
    if logged_in?
      @chore = Chore.find(params[:id])
      @user = session[:user_type]
      erb :'chores/show'
    else
      redirect '/'
    end
  end
end

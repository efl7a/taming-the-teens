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

  get '/chores/:id/edit' do
    if logged_in? && parent?
      @chore = Chore.find(params[:id])
      erb :'chores/edit'
    else
      redirect '/'
    end
  end

  patch '/chores/:id' do
    if logged_in?
      chore = Chore.find(params[:id])
      if parent?
      else
        chore.completed = true        
      end
    end
    redirect '/'
  end

  delete '/chores/:id/delete' do
    if logged_in? && parent?
      chore = Chore.find(params[:id])
      if chore.child.family.id == current_user.family.id
        chore.destroy
      end
    end
      redirect '/'
  end

end

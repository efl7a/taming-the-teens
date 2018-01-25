class ChoresController < ApplicationController
  get '/chores' do
    redirect '/chores/new'
  end

  post '/chores' do
    if logged_in? && parent?
      chore = Chore.new(params[:chore])
      chore.parent = current_user
      chore.completed = false
      if chore.save
        redirect "/chores/#{chore.id}"
      else
        redirect '/'
      end
    end
  end

  get '/chores/new' do
    if logged_in? && parent?
      @parent = current_user
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
        chore.save
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

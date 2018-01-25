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
    chore = Chore.find(params[:id])
    if logged_in? && parent?
      if chore.child.family.id == current_user.family.id
        chore.name = params[:chore][:name]
        chore.parent_id = params[:chore][:parent_id]
        chore.time_to_complete = params[:chore][:time_to_complete]
        chore.completed = params[:chore][:completed]
        chore.save
      end
    elsif logged_in && chore.child == current_user
        chore.completed = true
        chore.save
    else
      redirect '/'
    end
    redirect "/chores/#{chore.id}"
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

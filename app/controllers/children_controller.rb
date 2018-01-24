class ChildrenController < ApplicationController
  get '/children/signup' do
    if logged_in? && parent?
      @parent = current_user
      erb :'children/signup'
    else
      redirect '/signup'
    end
  end

  post '/children' do
    if logged_in? && parent?
      if Child.find_by(username: params[:child][:username])
        @message = "Username already in use. Please select a different one."
        erb :'children/signup'
      else
        child = Child.new(params[:child])
        child.family = current_user.family
        if child.save
          @message = "Sign Up another child or proceed to your home page"
          erb :'children/signup'
        else
          @message = "Looks like something went wrong. Please fill in all boxes."
          erb :'children/signup'
        end
      end
    else
      redirect '/'
    end
  end

  get '/children/:id' do
    if logged_in?
      @child = Child.find(params[:id])
      erb :'children/show'
    else
      redirect '/'
    end
  end

end

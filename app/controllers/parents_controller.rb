class ParentsController < ApplicationController
  get '/parents/signup' do
    if logged_in?
      redirect "/#{session[:type]}/#{current_user.id}"
    else
      erb :'parents/signup'
    end
  end

  post '/parents' do
    if logged_in?
      redirect "/#{session[:type]}/#{current_user.id}"
    end
    if Parent.find_by(username: params[:parent][:username])
      @message = "Username already in use. Please select a different one."
      erb :'parents/signup'
    else
      parent = Parent.new(params[:parent])
      parent.family = Family.create(params[:family])
      binding.pry
      if parent.save
        session[:user_id] = parent.id
        session[:type] = "parents"
        redirect '/children/signup'
      else
        @message = "Looks like something went wrong. Please fill in all boxes."
        erb :'parents/signup'
      end
    end
  end

  get '/parents/:id' do
    if logged_in?
      erb :'parents/show'
    else
      erb :login
    end
  end

end #end of class

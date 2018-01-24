class ParentsController < ApplicationController
  get '/parents/signup' do
    erb :'parents/signup'
  end

  post '/parents' do
    if Parent.find_by(username: params[:parent][:username])
      @message = "Username already in use. Please select a different one."
      erb :'parents/signup'
    else
      parent = Parent.new(params[:parent])
      parent.family = Family.create(params[:family])
      if parent.save
        session[:user_id] = parent.id
        session[:type] = "parent"
        redirect '/children/signup'
      else
        @message = "Looks like something went wrong. Please fill in all boxes."
        erb :'parents/signup'
      end
    end
  end

end #end of class

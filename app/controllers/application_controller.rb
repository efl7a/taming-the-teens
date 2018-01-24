class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  get '/signup' do
    redirect '/parents/signup'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      if session[:type] == 'parent'
        Parent.find(session[:user_id])
      else
        Child.find(session[:user_id])
      end
    end

  end
end

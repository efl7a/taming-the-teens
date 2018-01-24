class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    if logged_in?
      redirect "/#{session[:type]}/#{current_user.id}"
    else
      erb :index
    end
  end

  get '/login' do
    if logged_in?
      redirect "/#{session[:type]}/#{current_user.id}"
    else
      erb :login
    end
  end

  get '/signup' do
    if logged_in?
      redirect "/#{session[:type]}/#{current_user.id}"
    else
      redirect '/parents/signup'
    end
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
      if parent?
        Parent.find(session[:user_id])
      else
        Child.find(session[:user_id])
      end
    end

    def parent?
      session[:type] == 'parents'
    end

  end
end

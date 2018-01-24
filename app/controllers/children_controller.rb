class ChildrenController < ApplicationController
  get '/children/signup' do
    if logged_in?
      redirect "/#{session[:type]}/#{current_user.id}"
    else
      erb :'children/signup'
    end
  end

  get '/chidren/:id' do
    if logged_in?
      erb :'children/show'
    else
      redirect '/'
    end
  end

end

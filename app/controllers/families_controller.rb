class FamiliesController < ApplicationController
  get '/families' do
    redirect '/'
  end

  get '/families/edit' do
    if logged_in? && parent?
      @parent = current_user
      erb :'families/show'
    else
      redirect '/'
    end
  end

end

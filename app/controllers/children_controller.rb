class ChildrenController < ApplicationController
  get '/children/signup' do
    erb :'children/signup'
  end
end

require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/chitter' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peep: params[:peep], username: params[:username])
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    Peep.delete(id: params[:id])
    redirect '/peeps'
  end

  # establish server if file run directly
  run! if app_file == $0
end

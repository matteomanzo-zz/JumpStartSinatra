require 'sass'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'
require './song'

set :views, Proc.new { File.join(root, "/views") }

configure do
  enable :sessions
  set :username, 'frank'
  set :password, 'sinatra'
end

  set :session_secret, 'session persists'

get '/styles.css' do
  scss :styles
end

get '/login' do
  slim :login
end

post '/login' do
  if params][:username] == settings.username && params[:password] == settings.password
    session[:admin] = true
    redirect to('/songs')
  else
    slim :login
  end
end

get '/logout' do
  session.clear
  redirect to('/login')
end

get '/set/:name' do
  session[:name] = params[:name]
end

get '/get/hello' do
  "hello #{session[:name]}"
end

get '/' do
  slim :home
end

get '/about' do
  @title = "All About This Website"
  slim :about
end

get '/contact' do
  slim :contact
end

not_found do
  slim :not_found
end

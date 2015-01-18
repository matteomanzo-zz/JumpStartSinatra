require 'sass'
require 'sinatra'
require 'slim'
require './song'

set :views, Proc.new { File.join(root, "/views") }

get '/styles.css' do
  scss :styles
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

get '/songs' do
  @songs = Song.all
  slim :songs
end

not_found do
  slim :not_found
end
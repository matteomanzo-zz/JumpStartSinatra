require 'sass'
require 'sinatra'
require 'slim'

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

not_found do
  slim :not_found
end
# Sample app for Kona OAuth2 Strategy
# Make sure to setup the ENV variables CLIENT_ID and CLIENT_SECRET
# Run with "bundle exec rackup"
# On your browser, visit http://localhost:9292

require 'bundler/setup'
require 'sinatra/base'
require 'omniauth-kona'

class App < Sinatra::Base
  get '/' do
    "<a href='/auth/kona'>Log in with Kona</a>"
  end

  get '/auth/kona/callback' do
    content_type 'application/json'
    MultiJson.encode(request.env['omniauth.auth'])
  end

  get '/auth/failure' do
    content_type 'application/json'
    MultiJson.encode(request.env)
  end
end

use Rack::Session::Cookie, :secret => 'iduf93ub9sdhfusdhf' # replace this with your own secret

use OmniAuth::Builder do
  provider :kona, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']
end

run App.new
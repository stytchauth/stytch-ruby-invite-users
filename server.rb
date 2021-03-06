require 'stytch'
require 'dotenv'
require 'sinatra'
require 'active_support/core_ext/hash/keys'

Dotenv.load

set :content_type,'application/json'

get '/' do
  erb :invite_user
end

post '/invite-user' do
  resp = client.magic_links.email.invite(
    email: params[:email],
    invite_magic_link_url: magic_link_url
  ).symbolize_keys

  if resp[:status_code] != 200
    return resp[:error_message]
  end

  erb :email_sent
end

get '/authenticate' do
  resp = client.magic_links.authenticate(
    token: params[:token]
  ).symbolize_keys

  if resp[:status_code] != 200
    return resp[:error_message]
  end

  erb :logged_in
end

get '/logout' do
  erb :logged_out
end

def client
  Stytch::Client.new(
    project_id: ENV['STYTCH_PROJECT_ID'],
    secret: ENV['STYTCH_SECRET'],
    env: ENV['STYTCH_ENV'].to_sym
  )
end

def magic_link_url
  "#{ENV['HOST']}/authenticate"
end

require 'rubygems'
require 'active_record'
require 'sinatra'
require_relative 'models/user'

env_index = ARGV.index("-e")
env_arg = ARGV[env_index + 1] if env_index
env = env_arg || ENV["SINATRA_ENV"] || "development"

use ActiveRecord::ConnectionAdapters::ConnectionManagement # close connection to the DDBB properly...https://github.com/puma/puma/issues/59
databases = YAML.load_file("config/database.yml")
ActiveRecord::Base.establish_connection(databases[env])


# creating fixture data (only in test mode)
if env == 'test'
  User.destroy_all
  User.create(
   :name => "aaron", 
   :email => "paul@pauldix.net", 
   :bio => "rubyist")
end

get '/api/v1/users/:name' do
		user = User.find_by_name(params[:name])
		if user
			user.to_json
		else
			error 404, {:error => "User not found"}.to_json
		end
end

post '/api/v1/users' do
	#puts JSON.parse(request.body)
	begin
		user = User.create(JSON.parse(request.body.read))
		if user.valid?
			puts user
			user.to_json
		else
			error 400, user.errors.to_json
		end
	rescue => e
		error 400, e.message.to_json
	end
end
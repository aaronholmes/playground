ENV['SINATRA_ENV'] = 'test'

require_relative '../service'
require 'rspec'
require 'rack/test'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  Sinatra::Application
end

describe "Service" do
	before(:each) do
		User.delete_all
	end

	describe "GET on /api/v1/users/:id" do
		before(:each) do
			User.create(
				:name => "aaron",
				:email => "aholmes@pureguru-software.com",
				:password => "secret",
				:bio => "what a guy."
				)
		end

		it "Should return a user by name" do
			get '/api/v1/users/aaron'
			last_response.status.should == 200
			attributes = JSON.parse(last_response.body)
			attributes["user"]["email"].should eq "aholmes@pureguru-software.com"
			attributes.should_not have_key("password")
		end
	end

	describe "POST on /api/v1/users" do
		it "Should create a new user" do
			post '/api/v1/users', {
				:name 		=> "tester",
				:email		=> "tester@test.com",
				:password => "testpass",
				:bio			=> "Test User"
			}.to_json

			last_response.status.should == 200

			get '/api/v1/users/tester'
			
			attributes = JSON.parse(last_response.body)["user"]
			attributes["name"].should eq "tester"
			attributes["email"].should eq "tester@test.com"
			attributes["bio"].should eq "Test User"
			attributes.should_not have_key("password")
		end
	end

	describe "PUT user to /api/v1/users/mike" do
		it "Should update a user" do
			User.create(
				name: 		 "mike", 
				email: 		 "mike@exaple.com",
				password:  "pass", 
				bio: 			 "Nice person" 
				)

			put '/api/v1/users/mike', {
				:bio 			=> "mean person"
			}.to_json

			get '/api/v1/users/mike'
			attributes = JSON.parse(last_response.body)["user"]
			attributes["bio"].should eq "mean person"
		end
	end
end
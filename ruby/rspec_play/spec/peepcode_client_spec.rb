require 'rspec'
require_relative '../peepcode_client.rb'

describe Wordpress::Comments::Client do
	it "stores a URL" do
		client = Wordpress::Comments::Client.new 'http://google.com'
		expect(client.url).to eq 'http://google.com' 
	end
end

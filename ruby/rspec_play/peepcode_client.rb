module Wordpress
	module Comments
		class Client
			attr_reader :url
			def initialize url
				@url = url
			end
		end
	end
end
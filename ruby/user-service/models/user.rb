class User < ActiveRecord::Base
	validates_uniqueness_of :name, :email
	
	#overwrite base implementation so pass is not returned
	def to_json
		super(:except => :password)
	end
end
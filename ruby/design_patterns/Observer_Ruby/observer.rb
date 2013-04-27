require 'observer'

class Employee

	include Observable

	def initialize
		@salary = 0
	end

	def salary=(salary)
		@salary = salary
		changed
		notify_observers
	end
end

class Payroll
	attr_accessor :notified
	def initialize 
		@notified = false
	end
	def notify
		@notified = true
	end
end
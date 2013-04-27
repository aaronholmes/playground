class Employee
	attr_reader :salary
	def initialize(name)
		@name = name
		@observers = []
	end

	def add_observer(observer)
		@observers << observer
	end

	def remove_observer(observer)
		@observers.delete observer
	end

	def salary=(salary)
		@salary = salary
		notify_observers
	end

	def notify_observers
		@observers.each do |observer|
			# Pass in self so observer can get info on change
			# Alternative is to pass params
			observer.notify(self)
		end
	end
end

class Payroll
	attr_accessor :notified

	def notify(change)
		puts "new Salary is #{change.salary}"
		self.notified = true
	end
end
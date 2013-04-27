require 'test/unit'
require 'stringio'
require_relative 'observer'

class ObserverTest < Test::Unit::TestCase

	def setup 
		@employee = Employee.new("steve")
		@payroll = Payroll.new
	end

	def test_observer_item
		@employee.add_observer(@payroll)

		# Notify when salary changes
		@employee.salary = "100000"

		assert(@payroll.notified, "Payroll should have been notified")
	end

	def test_removing_observer
		@employee.add_observer(@payroll)
		@employee.remove_observer(@payroll)

		# Observer was removed so there should be no notifications
		@employee.salary = "100000"
		assert(!@payroll.notified, "Payroll should not have been notified")
	end

end
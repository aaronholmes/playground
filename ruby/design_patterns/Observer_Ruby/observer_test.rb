require 'test/unit'
require 'stringio'
require_relative 'observer'

class ObserverTest < Test::Unit::TestCase

	def setup
		@employee = Employee.new
		@payroll = Payroll.new
	end

	def test_observer_item
		@employee.add_observer(@payroll, :notify)
		@employee.salary = "1000000"

		assert(@payroll.notified, "Payroll should have been notified of salary change")
	end

	def test_observer_remove
		@employee.add_observer(@payroll, :notify)
		@employee.delete_observer(@payroll)
		@employee.salary = "1000000"

		assert(!@payroll.notified, "Payroll should not have been notified of salary change")
	end

end
require 'test/unit'
require 'stringio'
require_relative 'composite'

class CompositeTest < Test::Unit::TestCase
	def setup
		
	end

	def test_composite_task
		@make_batter_task = MakeBatterTask.new
		assert_equal(@make_batter_task.get_time_required, 4.0)
	end

	def test_composite_task_with_nested_composites
		@make_cake_task = MakeCakeTask.new
		assert_equal(@make_cake_task.get_time_required, 66.0)
	end
end
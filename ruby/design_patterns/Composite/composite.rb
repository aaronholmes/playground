#
# TODO: refactor out the common code in composite tasks
#

# Abstract Base Task class (COMPONENT)
class Task 
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def get_time_required
		0.0
	end
end

# Single tasks - (LEAF)
class AddDryIngredientsTask < Task
	def initialize
		super('Add Dry Ingredients')
	end
	def get_time_required
		1.0
	end
end

class MixTask < Task
	def initialize
		super "Mix Task"
	end

	def get_time_required
		3.0
	end
end

class CookTask < Task
	def initialize
		super "Cooking Cake"
	end

	def get_time_required
		60.0
	end
end

class FillPanTask < Task
	def initialize
		super "Putting batter in pan"
	end

	def get_time_required
		2.0
	end
end

# Collection of leaves for larger task (COMPOSITE)
class MakeBatterTask < Task
	def initialize
		super('Make Batter')
		@sub_tasks = []
		add_subtask( AddDryIngredientsTask.new )
		add_subtask( MixTask.new )
	end

	def add_subtask(task)
		@sub_tasks << task
	end

	def remove_subtask
		@sub_tasks.delete(task)
	end

	def get_time_required
		time = 0.0
		@sub_tasks.each {|task| time += task.get_time_required}
		time
	end
end

class MakeCakeTask < Task
	def initialize
		super('Make Cake')
		@sub_tasks = []
		add_subtask( MakeBatterTask.new )
		add_subtask( FillPanTask.new )
		add_subtask( CookTask.new )
	end

	def add_subtask(task)
		@sub_tasks << task
	end

	def remove_subtask
		@sub_tasks.delete(task)
	end

	def get_time_required
		time = 0.0
		@sub_tasks.each {|task| time += task.get_time_required}
		time
	end
end

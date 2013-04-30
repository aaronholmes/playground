describe "Meal", ->
	
	beforeEach ->
		@donut = new Dish 'Maple Bacon Donut $1.99'
		@fish = new Dish 'Salmon $14.25'

	describe "blank object", ->

		beforeEach ->
			@meal = new Meal

		it "adds a new dish", ->
			@meal.add @donut
			(expect @meal.dishes.length).toEqual 1

		it "adds several dishes", ->
			@meal.add @donut, @fish
			(expect @meal.dishes.length).toEqual 2
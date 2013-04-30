describe "A simple test...", ->

	it "performs addition", ->
		# Not the coffeescript way!
		expect(1+1).toEqual 2

	it "still performs addition", ->
		# This is the coffeescript way
		(expect 1+1).toEqual 2

describe "Dish", ->
	
	beforeEach ->
		@dish = new Dish "Chicken Dinner $9.99 mains"

	it "extracts the title", ->
		(expect @dish.title).toEqual "Chicken Dinner"

	it "extracts the price", ->
		(expect @dish.price.cents).toEqual 999
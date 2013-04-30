window.Meal = class Meal
	constructor: ->
		@dishes = []

	# the ... is the splat operator for CS
	add: (dishes...) ->
		@dishes.push dishes...

	totalPrice: ->
		total = new Money
		total.cents = total.cents + dish.price.cents for dish in @dishes
		total

	toJSON: ->
    dishes: do => dish.toJSON() for dish in @dishes
    price: @totalPrice().toString()
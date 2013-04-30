window.Meal = class Meal
	constructor: ->
		@dishes = []

	# the ... is the splat operator for CS
	add: (dishes...) ->
		@dishes.push dishes...
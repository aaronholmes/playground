
window.Money = class Money 
	constructor: (rawString) ->
		@cents = @parseCents rawString

	parseCents: (rawString) ->
		[dollars, cents] = rawString.match(/(\d+)/g) ? [0,0]
		+cents + 100*dollars

	toString: ->
		cents = @cents%100

		# Add a leading 0 if cents are less than 10 - ie $10.05
		if cents < 10
			cents = "0"+cents
			
		"$#{Math.floor(@cents/100)}.#{cents}"
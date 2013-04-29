
# Assign to window so that the test can see the class
window.Dish = class Dish
	constructor: (rawDescription="") ->
		# ? - existential method - checks if any previous methods in chain
		# returned null and prevents error (removed this code)

		# Returns last value & uses 'destructuring assignment' to set returned
		# array to array of values
		# Returns All, Title, and Price - all is throwaway variable
		[all, @title, @price] = @parseRawDescription rawDescription

	parseRawDescription: (rawDescription) ->
		pattern = ///
			([^\$]+)					# Title
			(\$\d+\.\d+)			# Price
		///
		result = rawDescription.match pattern
		r.trim() for r in result
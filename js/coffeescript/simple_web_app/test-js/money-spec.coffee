describe "Money", ->
	describe "valid value", ->

		beforeEach ->
			@money = new Money "25.99"

		it "parses to cents", ->
			(expect @money.cents).toEqual 2599

		it "formats to string", ->
			(expect @money.toString()).toEqual "$25.99"

		it "formats to string when cents is 0x", ->
			money2 = new Money "25.09"
			(expect money2.toString()).toEqual "$25.09"

	describe "invalid value", ->

		it "sets cents to 0 if a valid value cannot be parsed", ->
			money = new Money "No Mo Monies"
			(expect money.cents).toEqual 0
// Generated by CoffeeScript 1.6.2
(function() {
  var Money;

  window.Money = Money = (function() {
    function Money(rawString) {
      this.cents = this.parseCents(rawString);
    }

    Money.prototype.parseCents = function(rawString) {
      var cents, dollars, _ref, _ref1;

      _ref1 = (_ref = rawString.match(/(\d+)/g)) != null ? _ref : [0, 0], dollars = _ref1[0], cents = _ref1[1];
      return +cents + 100 * dollars;
    };

    Money.prototype.toString = function() {
      var cents;

      cents = this.cents % 100;
      if (cents < 10) {
        cents = "0" + cents;
      }
      return "$" + (Math.floor(this.cents / 100)) + "." + cents;
    };

    return Money;

  })();

}).call(this);
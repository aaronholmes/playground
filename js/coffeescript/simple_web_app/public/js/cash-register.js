// Generated by CoffeeScript 1.6.2
(function() {
  var Dish;

  window.Dish = Dish = (function() {
    function Dish(rawDescription) {
      var all, _ref;

      if (rawDescription == null) {
        rawDescription = "";
      }
      _ref = this.parseRawDescription(rawDescription), all = _ref[0], this.title = _ref[1], this.price = _ref[2];
      this.price = new Money(this.price);
    }

    Dish.prototype.parseRawDescription = function(rawDescription) {
      var pattern, r, result, _i, _len, _results;

      pattern = /([^\$]+)(\$\d+\.\d+)/;
      result = rawDescription.match(pattern);
      _results = [];
      for (_i = 0, _len = result.length; _i < _len; _i++) {
        r = result[_i];
        _results.push(r.trim());
      }
      return _results;
    };

    return Dish;

  })();

}).call(this);

var dispatcher = require('../dispatcher/dispatcher');

var ApiUtil = {
  fetchAllPokemons: function() {
    $.ajax({
      type: "GET",
      url: "api/pokemon",
      dataType: "json",
      success: function(data) {
        console.log(data);
      }
    });
  }
};

module.exports = ApiUtil;

var dispatcher = require('../dispatcher/dispatcher'),
    ServerActions = require('../actions/server_actions');

var ApiUtil = {
  fetchAllPokemons: function() {
    $.ajax({
      type: "GET",
      url: "api/pokemon",
      dataType: "json",
      success: function(data) {
        ServerActions.receiveAllPokemons(data);
      }
    });
  }
};

module.exports = ApiUtil;

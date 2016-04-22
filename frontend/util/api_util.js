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
  },

  fetchSinglePokemon: function(id) {
    $.ajax({
      type: "GET",
      url: "api/pokemon/" + id,
      dataType: "json",
      success: function(data) {
        ServerActions.receiveSinglePokemon(data);
      }
    });
  },

  createPokemon: function(pokemonDeets, callback) {
    $.ajax({
      type: "POST",
      url: "api/pokemon",
      dataType: "json",
      data: {pokemon: pokemonDeets},
      success: function(data) {
        callback(data.id);
        ServerActions.receiveSinglePokemon(data);
      }
    });
  }
};

module.exports = ApiUtil;

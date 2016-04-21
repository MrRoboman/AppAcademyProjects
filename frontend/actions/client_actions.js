var dispatcher = require('../dispatcher/dispatcher'),
    PokemonConstants = require('../constants/pokemon_constants'),
    ApiUtil = require('../util/api_util');

var ClientActions = {
  fetchAllPokemons: function(){
    ApiUtil.fetchAllPokemons();
  },

  fetchSinglePokemon: function(id) {
    ApiUtil.fetchSinglePokemon(id);
  }
};

module.exports = ClientActions;

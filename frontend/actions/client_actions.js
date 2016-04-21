var dispatcher = require('../dispatcher/dispatcher'),
    PokemonConstants = require('../constants/pokemon_constants'),
    ApiUtil = require('../util/api_util');

var ClientActions = {
  fetchAllPokemons: function(){
    ApiUtil.fetchAllPokemons();
  }
};

module.exports = ClientActions;

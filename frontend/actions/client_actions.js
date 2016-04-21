var dispatcher = require('../dispatcher/dispatcher'),
    PokemonConstants = require('../constants/pokemon_constants');

var ClientActions = {
  fetchAllPokemons: function(){
    dispatcher.dispatch({
      actionType: PokemonConstants.FETCH_POKEMONS
    });
  }
};

module.exports = ClientActions;

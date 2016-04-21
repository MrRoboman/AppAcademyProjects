var dispatcher = require('../dispatcher/dispatcher'),
    PokemonConstants = require('../constants/pokemon_constants');

var ServerActions = {
  receiveAllPokemons: function(receivedPokemons) {
    dispatcher.dispatch({
      actionType: PokemonConstants.POKEMONS_RECEIVED,
      receivedPokemons: receivedPokemons
    });
  }
};

module.exports = ServerActions;

var dispatcher = require('../dispatcher/dispatcher'),
    PokemonConstants = require('../constants/pokemon_constants');

var ServerActions = {
  receiveAllPokemons: function(receivedPokemons) {
    dispatcher.dispatch({
      actionType: PokemonConstants.POKEMONS_RECEIVED,
      receivedPokemons: receivedPokemons
    });
  },

  receiveSinglePokemon: function(receivedPokemon) {
    dispatcher.dispatch({
      actionType: PokemonConstants.SINGLE_POKEMON_RECEIVED,
      receivedPokemon: receivedPokemon
    });
  }
};

module.exports = ServerActions;

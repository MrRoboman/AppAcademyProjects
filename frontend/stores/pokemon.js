var Store = require('flux/utils').Store,
    dispatcher = require('../dispatcher/dispatcher'),
    PokemonConstants = require('../constants/pokemon_constants');

var pokemonStore = new Store(dispatcher);

var _pokemons = {};

// API

pokemonStore.__onDispatch = function(payload) {
  switch (payload.actionType) {
    case PokemonConstants.POKEMONS_RECEIVED:
      resetPokemons(payload.receivedPokemons);
      this.__emitChange();
      break;
  }
};

pokemonStore.all = function() {
  var result = [];

  Object.keys(_pokemons).forEach(function(id) {
    result.push(_pokemons[id]);
  });

  return result;
};

pokemonStore.find = function(id) {
  return _pokemons[id];
};

// private

var resetPokemons = function(pokemons) {
  _pokemons = {};

  pokemons.forEach(function(pokemon){
    _pokemons[pokemon.id] = pokemon;
  });
};

module.exports = pokemonStore;

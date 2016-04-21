var React = require('react'),
    ReactDOM = require('react-dom'),
    PokemonsIndex = require('./components/pokemons/pokemons_index');
    // pokemonStore = require('./stores/pokemon');
    // ClientActions = require('./actions/client_actions');

$(function() {
  ReactDOM.render(<PokemonsIndex/>, document.getElementById('root'));
});

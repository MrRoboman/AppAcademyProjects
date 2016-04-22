var React = require('react'),
    pokemonStore = require('../../stores/pokemon'),
    ClientActions = require('../../actions/client_actions'),
    PokemonIndexItem = require('./pokemon_index_item');


var PokemonsIndex = React.createClass({
  getInitialState: function() {
    return {pokemons: pokemonStore.all()};
  },

  componentDidMount: function() {
    this.listener = pokemonStore.addListener(this._onChange);
    ClientActions.fetchAllPokemons();
  },

  _onChange: function() {
    this.setState({pokemons: pokemonStore.all()});
  },

  componentWillUnmount: function() {
    this.listener.remove();
  },

  render: function() {
    var pokemonLIs = this.state.pokemons.map(function(pokemon) {
      return <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />;
    });

    return (
      <ul>
        {pokemonLIs}
      </ul>
    );
  }
});

module.exports = PokemonsIndex;

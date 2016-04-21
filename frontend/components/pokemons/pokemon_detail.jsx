var React = require('react'),
    pokemonStore = require('../../stores/pokemon'),
    ClientActions = require('../../actions/client_actions'),
    ToysIndex = require('../toys/toys_index');

var PokemonDetail = React.createClass({
  componentWillReceiveProps: function(props) {
    var id = parseInt(props.params.pokemonId);
    ClientActions.fetchSinglePokemon(id);
  },

  getInitialState: function() {
    return {pokemon: this.getStateFromStore()};
  },

  componentDidMount: function() {
    this.listener = pokemonStore.addListener(this._onChange);
    ClientActions.fetchSinglePokemon(this.props.params.pokemonId);
  },

  componentWillUnmount: function() {
    this.listener.remove();
  },

  getStateFromStore: function() {
    var id = parseInt(this.props.params.pokemonId);
    return pokemonStore.find(id);
  },

  _onChange: function() {
    this.setState({pokemon: this.getStateFromStore()});
  },

  render: function() {
    var content = <div className="detail">Loading...</div>;
    var toysIndex = <div>Loading...</div>;
    var pokemon = this.state.pokemon;

    if (pokemon) {
      var movesString = pokemon.moves.map(function(move){
        return '"' + move + '"';
      }).join(", ");

      movesString = "[" + movesString + "]";

      content = (
        <div className="detail">
          <img src={pokemon.image_url} />
          <p>name: {pokemon.name}</p>
          <p>attack: {pokemon.attack}</p>
          <p>defense: {pokemon.defense}</p>
          <p>poke_type: {pokemon.poke_type}</p>
          <p>moves: {movesString}</p>
        </div>
      );

      if (pokemon.toys) {
        toysIndex = <ToysIndex toys={pokemon.toys} />;
      }
    }

    return (
      <div>
        <div className="pokemon-detail-pane">
          {content}
          <h2 className="detail-header">Toys:</h2>
          {toysIndex}
        </div>
      </div>
    );
  }
});

module.exports = PokemonDetail;

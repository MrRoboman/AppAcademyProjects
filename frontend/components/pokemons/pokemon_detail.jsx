var React = require('react'),
    pokemonStore = require('../../stores/pokemon');

var PokemonDetail = React.createClass({
  getInitialState: function() {
    return {pokemon: this.getStateFromStore()};
  },

  componentDidMount: function() {
    this.listener = pokemonStore.addListener(this._onChange);
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

    if(this.state.pokemon){
      var movesString = this.state.pokemon.moves.map(function(move){
        return '"' + move + '"';
      }).join(", ");

      movesString = "[" + movesString + "]";

      content = (
        <div className="detail">
          <img src={this.state.pokemon.image_url} />
          <p>name: {this.state.pokemon.name}</p>
          <p>attack: {this.state.pokemon.attack}</p>
          <p>defense: {this.state.pokemon.defense}</p>
          <p>poke_type: {this.state.pokemon.poke_type}</p>
          <p>moves: {movesString}</p>
        </div>
      );
    }

    return (
      <div>
        <div className="pokemon-detail-pane">
          {content}
        </div>
      </div>
    );
  }
});

module.exports = PokemonDetail;

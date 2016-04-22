var React = require('react'),
    PokemonsIndex = require('./pokemons/pokemons_index'),
    PokemonForm = require('./pokemons/pokemon_form');

var App = React.createClass({

  render: function() {
    return (
      <div id="pokedex">
        <div className="pokemon-index-pane">
          <PokemonForm />
          <PokemonsIndex />
        </div>

        {this.props.children}
      </div>
    );
  }

});

module.exports = App;

var React = require('react'),
    LinkedStateMixin = require('react-addons-linked-state-mixin'),
    ClientActions = require('../../actions/client_actions');

var PokemonForm = React.createClass({
  mixins: [LinkedStateMixin],

  getInitialState: function() {
    return {
      name: "",
      image_url: "",
      poke_type: window.pokemonTypes[0],
      attack: "",
      defense: "",
      move_1: "",
      move_2: ""
    };
  },

  createPokemon: function(event) {
    event.preventDefault();

    var params = {
      name: this.state.name,
      image_url: this.state.image_url,
      poke_type: this.state.poke_type,
      attack: this.state.attack,
      defense: this.state.defense,
      moves: [this.state.move_1, this.state.move_2]
    };

    ClientActions.createPokemon(params);
  },

  render: function() {
    var typeOptions = window.pokemonTypes.map(function(pokemonType) {
      return <option key={pokemonType}>{pokemonType}</option>;
    });

    return (
      <form className="new-pokemon">
        <div>
          <label key="1" htmlFor="pokemon_name">Name:</label>
            <input id="pokemon_name" type="text" valueLink={this.linkState("name")}/>
        </div>

        <div>
          <label key="2" htmlFor="pokemon_image_url">Image URL:</label>
            <input id="pokemon_image_url" type="text" valueLink={this.linkState("image_url")}/>
        </div>

        <div>
          <label key="3" htmlFor="pokemon_type">Type:</label>
            <select id="pokemon_type" className="type-selector" valueLink={this.linkState("poke_type")}>
              {typeOptions}
            </select>
        </div>

        <div>
          <label key="4" htmlFor="pokemon_attack">Attack:</label>
            <input id="pokemon_attack" type="text" valueLink={this.linkState("attack")}/>
        </div>

        <div>
          <label key="5" htmlFor="pokemon_defense">Defense:</label>
            <input id="pokemon_defense" type="text" valueLink={this.linkState("defense")}/>
        </div>

        <div>
          <label key="6" htmlFor="pokemon_move_1">Move #1:</label>
            <input id="pokemon_move_1" type="text" valueLink={this.linkState("move_1")}/>
        </div>

        <div>
          <label key="7" htmlFor="pokemon_move_2">Move #2:</label>
            <input id="pokemon_move_2" type="text" valueLink={this.linkState("move_2")}/>
        </div>


        <button onClick={this.createPokemon}>Create Pokemon</button>
      </form>
    );
  }

});

module.exports = PokemonForm;

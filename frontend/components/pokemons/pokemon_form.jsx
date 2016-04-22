var React = require('react'),
    LinkedStateMixin = require('react-addons-linked-state-mixin');

var PokemonForm = React.createClass({
  mixins: [LinkedStateMixin],

  getInitialState: function() {
    return {
      name: "",
      imageUrl: "",
      type: "",
      attack: "",
      defense: "",
      move1: "",
      move2: ""
    };
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
            <select id="pokemon_type" valueLink={this.linkState("type")}>
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
            <input id="pokemon_move_1" type="text" valueLink={this.linkState("move1")}/>
        </div>

        <div>
          <label key="7" htmlFor="pokemon_move_2">Move #2:</label>
            <input id="pokemon_move_2" type="text" valueLink={this.linkState("move2")}/>
        </div>


        <button>Create Pokemon</button>
      </form>
    );
  }

});

module.exports = PokemonForm;

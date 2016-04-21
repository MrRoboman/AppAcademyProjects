var React = require('react');

var PokemonIndexItem = React.createClass({

  render: function() {
    return (
      <li>{this.props.pokemon.name}</li>
    );
  }

});

module.exports = PokemonIndexItem;

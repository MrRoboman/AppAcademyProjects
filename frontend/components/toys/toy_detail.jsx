var React = require('react'),
    ClientActions = require('../../actions/client_actions'),
    pokemonStore = require('../../stores/pokemon');


var ToyDetail = React.createClass({

  componentWillReceiveProps: function(props) {
    var id = parseInt(props.params.pokemonId);
    ClientActions.fetchSinglePokemon(id);
  },

  getInitialState: function() {
    return {toy: this.getStateFromStore()};
  },

  componentDidMount: function() {
    this.listener = pokemonStore.addListener(this._onChange);
    ClientActions.fetchSinglePokemon(this.props.params.pokemonId);
  },

  componentWillUnmount: function() {
    this.listener.remove();
  },

  getStateFromStore: function() {
    var toyId = parseInt(this.props.params.toyId);
    var pokemonId = parseInt(this.props.params.pokemonId);

    return pokemonStore.findToy(pokemonId, toyId);
  },

  _onChange: function() {
    this.setState({toy: this.getStateFromStore()});
  },

  render: function() {
    var toy = "Loading...";

    if (this.state.toy) {
      toy = this.state.toy;
    }

    return (
      <div className="toy-detail-pane">
        Hello World {toy.name}
      </div>
    );
  }

});

module.exports = ToyDetail;

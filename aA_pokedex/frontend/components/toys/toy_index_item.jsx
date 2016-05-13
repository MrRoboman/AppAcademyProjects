var React = require('react');

var ToyIndexItem = React.createClass({
  contextTypes: {
    router: React.PropTypes.object.isRequired
  },

  showDetail: function() {
    var toy = this.props.toy;
    var url = "pokemon/" + toy.pokemon_id + "/toys/" + toy.id;

    this.context.router.push(url);
  },

  render: function() {
    return (
      <li className="toy-list-item" onClick={this.showDetail}>
        <p>name: {this.props.toy.name}</p>
        <p>happiness: {this.props.toy.happiness}</p>
        <p>price: {this.props.toy.price}</p>
      </li>
    );
  }

});

module.exports = ToyIndexItem;

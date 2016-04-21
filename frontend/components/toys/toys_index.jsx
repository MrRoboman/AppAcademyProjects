var React = require('react'),
    ToyIndexItem = require('./toy_index_item');

var ToysIndex = React.createClass({

  render: function() {
    var toyLIs = this.props.toys.map(function(toy) {
      return <ToyIndexItem key={toy.id} toy={toy} />;
    });
    return (
      <ul>
        {toyLIs}
      </ul>
    );
  }

});

module.exports = ToysIndex;

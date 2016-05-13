var React = require('react');
var TodoStore = require('../stores/todo_store');
var DoneButton = require('./done_button');

var TodoListItem = React.createClass({
  handleDestroy: function() {
    TodoStore.destroy(this.props.todoListItem.id);
  },
  render: function() {
    return (
      <div>
        <h4>{this.props.todoListItem.title}</h4>
        <div>{this.props.todoListItem.body}</div>
        <button onClick={this.handleDestroy}>Delete</button>
        <DoneButton todoListItem={this.props.todoListItem}/>
      </div>
    );
  }

});


module.exports = TodoListItem;

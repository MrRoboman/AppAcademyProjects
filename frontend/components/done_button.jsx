var React = require('react');
var TodoStore = require('../stores/todo_store');

module.exports = React.createClass({
  getInitialState: function() {
    var buttonText = this.props.todoListItem.done ? "undo" : "done";
    return {buttonText: buttonText};
  },
  handleDone: function(event) {
    TodoStore.toggleDone(this.props.todoListItem.id);
  },
  render: function() {
    var buttonText = this.props.todoListItem.done ? "undo" : "done";
    return (
      <button onClick={this.handleDone}>{this.state.buttonText}</button>
    );
  }
});

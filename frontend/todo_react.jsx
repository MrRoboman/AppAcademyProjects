var React = require('react');
var ReactDOM = require('react-dom');
var TodoList = require('./components/todo_list.jsx');
var TodoStore = require('./stores/todo_store.js');

var TodoApp = React.createClass({
  render: function() {
    return (
      <TodoList />
    );
  }
});

document.addEventListener('DOMContentLoaded', function(){
  ReactDOM.render(<TodoApp/>, document.getElementById('home'));
});

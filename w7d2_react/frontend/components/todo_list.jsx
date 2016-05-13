var React = require('react');
var TodoStore = require('../stores/todo_store.js');
var TodoListItem = require('./todo_list_item.jsx');
var TodoForm = require('./todo_form.jsx');

module.exports = React.createClass({
  getInitialState: function() {
    return {todos: TodoStore.all()};
  },
  componentDidMount: function() {
    TodoStore.addChangedHandler(this.updateList);
    TodoStore.fetch();
  },
  // todosChanged
  updateList: function() {
    this.setState({todos: TodoStore.all()});
  },

  componentWillUnmount: function() {
    TodoStore.removeChangedHandler(this.updateList);
  },
  render: function() {
    var todos = this.state.todos;
    todos = todos.map(function(todo){
      return (
        <TodoListItem key={todo.id} todoListItem={todo}/>
      );
    });
    return (
      <div>
        {todos}
        <TodoForm updateList={this.updateList}/>
      </div>
    );
  }
});


var _todos =  [];
var _callbacks = [];

var TodoStore = {

  changed: function() {console.log('called it');
    for (var i = 0; i < _callbacks.length; i++) {
      _callbacks[i]();
    }
  },

  addChangedHandler: function(cb) {
    _callbacks.push(cb);
  },

  removeChangedHandler: function(cb) {
    for (var i = 0; i < _callbacks.length; i++) {
      if (_callbacks[i] === cb) {
        _callbacks.splice(i, 1);
        return;
      }
    }
  },

  all: function() {
    return _todos;
  },

  fetch: function() {
    var self = this;
    $.ajax({
      method: "GET",
      url: "/api/todos",
      dataType: "JSON",
      success: function(data) {
        _todos = data;
        self.changed();
      },
      error: function(response) {
        console.log(response);
      }
    });
  },

  removeTodo: function(id) {
    for(var i = 0; i < _todos.length; i++){
      if(id === _todos[i].id){
        return _todos.splice(i, 1);
      }
    }
  },

  create: function(todo) {
    var self = this;
    $.ajax({
      method: "POST",
      url: "/api/todos",
      dataType: "JSON",
      data: {todo: {title: todo.title, body: todo.body}},
      success: function(data) {
        console.log('success', data);
        // debugger;
        _todos.push(data);
        self.changed();
      },
      error: function(response) {
        console.log(response);
      }
    });
  },

  destroy: function(id) {
    var self = this;
    $.ajax({
      method: "DELETE",
      url: "/api/todos/" + id,
      dataType: "JSON",
      success: function(data) {
        console.log('success', data);
        self.removeTodo(id);
        self.changed();
      },
      error: function(response) {
        console.log(response);
      }
    });
  },

  toggleDone: function(id) {
    var self = this;
    $.ajax({
      method: "PATCH",
      url: "/api/todos/" + id,
      dataType: "JSON",
      success: function(data) {
        console.log('success', data);
        self.changed();
      },
      error: function(response) {
        console.log(response);
      }
    });
  }
};

module.exports = TodoStore;

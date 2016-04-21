var React = require('react'),
    ReactDOM = require('react-dom'),
    ApiUtil = require('./util/api_util');

$(function() {
  ApiUtil.fetchAllPokemons();
  // ReactDOM.render();
});

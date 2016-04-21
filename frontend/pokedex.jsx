var React = require('react'),
    ReactDOM = require('react-dom'),
    Router = require('react-router').Router,
    Route = require('react-router').Route,
    hashHistory = require('react-router').hashHistory,
    App = require('./components/app');

$(function() {
  ReactDOM.render(
    <Router history={hashHistory}>
      <Route path="/" component={App}></Route>
    </Router>,
    document.getElementById('root')
 );
});

var React = require('react'),
    ReactDOM = require('react-dom'),
    Router = require('react-router').Router,
    Route = require('react-router').Route,
    hashHistory = require('react-router').hashHistory,
    App = require('./components/app'),
    PokemonDetail = require('./components/pokemons/pokemon_detail');

$(function() {
  ReactDOM.render(
    <Router history={hashHistory}>
      <Route path="/" component={App}>
        <Route path="pokemon/:pokemonId" component={PokemonDetail}>
        </Route>
      </Route>
    </Router>,
    document.getElementById('root')
 );
});

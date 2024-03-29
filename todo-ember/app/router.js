import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('todo');
  this.route('login');
  this.route('register');

  this.route('home', {path: '/'});
});

export default Router;

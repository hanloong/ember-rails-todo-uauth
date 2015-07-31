import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {
  model: function() {
    return {todos: this.store.findAll('todo'), newTodo: ''};
  },
  actions: {
    create: function(newTodo) {
      if(newTodo != '') {
        var todo = this.store.createRecord('todo', {title: newTodo});
        todo.save();
        this.set('model.newTodo', '');
      }
      return false;
    },
    complete: function(todo) {
      todo.set('complete', true);
      todo.save();
      return false;
    }
  }
});

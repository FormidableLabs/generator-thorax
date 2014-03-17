define([
  'view',
  "views/todo-collection",
  'hbs!templates/todo-list/index'
], function(View, TodosCollectionView, template) {
  return Handlebones.View.extend({
    events: {
      "submit form": function (event) {
        event.preventDefault();
        var input = this.$('input[name="title"]');
        this.collection.add({
          title: input.val()
        });
        input.val("")
      },
      'change input[type="checkbox"]': function (event) {
        $(event.target).view().model.set({
          done: event.target.checked
        });
      }
    },
    template: Handlebars.compile(
      '{{view todosCollectionView}}' +
      '<form><input name="title">' + 
      '<input type="submit" value="Add"></form>'
    ),
    initialize: function (options) {
      this.todosCollectionView = this.addChild(new TodosCollectionView({
        collection: options.collection
      }));
    }
  });
});


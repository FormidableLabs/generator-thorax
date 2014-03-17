define([
  'view',
  'hbs!templates/todo-list/todo-collection-item'
], function(View, template) {  
  return Handlebones.CollectionView.extend({
    name: "todo-collection",
    tagName: "ul",
    modelView: Handlebones.ModelView.extend({
      name: "todo-collection-model",
      tagName: "li",
      template: template,
      initialize: function () {
        this.listenTo(this, "ready", this._onChange);
        this.listenTo(this.model, "change", this._onChange);
      },
      _onChange: function () {
        if (this.model.get("done")) {
          this.$el.addClass("done");
          this.$("input").attr("checked", true);
        } else {
          this.$el.removeClass("done");
          this.$("input").removeAttr("checked", true);
        }
      }
    })
  });
});
define [
  "view"
  "views/todo-list/todo-collection"
  "hbs!templates/todo-list/index"
], (View, TodosCollectionView, template) ->
  Handlebones.View.extend
    name: "todo-list/index"
    events:
      "submit form": (event) ->
        event.preventDefault()
        input = @$("input[name=\"title\"]")
        @collection.add title: input.val()
        input.val ""

      "change input[type=\"checkbox\"]": (event) ->
        $(event.target).view().model.set done: event.target.checked

    template: template
    initialize: (options) ->
      @todosCollectionView = @addChild(new TodosCollectionView(collection: options.collection))


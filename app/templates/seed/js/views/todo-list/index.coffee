define [
  "view"
  "views/todo-collection"
  "hbs!templates/todo-list/index"
], (View, TodosCollectionView, template) ->
  Handlebones.View.extend
    events:
      "submit form": (event) ->
        event.preventDefault()
        input = @$("input[name=\"title\"]")
        @collection.add title: input.val()
        input.val ""

      "change input[type=\"checkbox\"]": (event) ->
        $(event.target).view().model.set done: event.target.checked

    template: Handlebars.compile("{{view todosCollectionView}}" + "<form><input name=\"title\">" + "<input type=\"submit\" value=\"Add\"></form>")
    initialize: (options) ->
      @todosCollectionView = @addChild(new TodosCollectionView(collection: options.collection))


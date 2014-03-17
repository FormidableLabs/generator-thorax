define [
  "view"
  "hbs!templates/todo-list/todo"
], (View, template) ->
  Handlebones.CollectionView.extend
    name: "todo-collection"
    tagName: "ul"
    modelView: Handlebones.ModelView.extend(
      name: "todo-collection-model"
      tagName: "li"
      template: template
      initialize: ->
        @listenTo this, "ready", @_onChange
        @listenTo @model, "change", @_onChange

      _onChange: ->
        if @model.get("done")
          @$el.addClass "done"
          @$("input").attr "checked", true
        else
          @$el.removeClass "done"
          @$("input").removeAttr "checked", true
    )


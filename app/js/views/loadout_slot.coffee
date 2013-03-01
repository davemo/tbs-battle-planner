def 'tbs.views.LoadoutSlot', class LoadoutSlot extends Backbone.Fixins.SuperView

  tagName: "li"

  attributes: =>
    "class"     : "character #{@model.get('type')} #{@model.get('editMode')}"
    "data-slot" : @slot

  initialize: (options) ->
    @slot = options.slot
    @model.on("change", @render)

  renderAttributes: =>
    attrs = @attributes()
    @$el.attr("class",     attrs.class)
    @$el.attr("data-slot", attrs['data-slot'])



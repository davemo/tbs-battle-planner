def 'tbs.views.LoadoutSlot', class LoadoutSlot extends Backbone.Fixins.SuperView

  tagName: "li"

  events:
    "mouseover"     : "showOverlay"
    "mouseout"      : "hideOverlay"
    "click .remove" : "removeFromLoadout"

  removeFromLoadout: ->
    debugger
    @model.collection.resetEditModeOnAllUnits()
    @model.clear()
    @model.set(new tbs.models.Unit().attributes)
    @model.set("editMode", "choosing")

  attributes: =>
    "class"     : "character #{@model.get('name')} #{@model.get('editMode')}"
    "data-slot" : @slot

  showOverlay: =>
    if @model.isChosen() then @$(".remove").css(display: "block")

  hideOverlay: =>
    @$(".remove").hide()

  initialize: (options) ->
    @slot = options.slot
    @model.on("change", @render)

  renderAttributes: =>
    attrs = @attributes()
    @$el.attr("class",     attrs.class)
    @$el.attr("data-slot", attrs['data-slot'])

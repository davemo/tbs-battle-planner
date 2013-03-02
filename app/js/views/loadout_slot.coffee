def 'tbs.views.LoadoutSlot', class LoadoutSlot extends Backbone.Fixins.SuperView

  tagName: "li"

  events:
    "mouseover"     : "showOverlay"
    "mouseout"      : "hideOverlay"
    "click .remove" : "removeFromLoadout"

  removeFromLoadout: (e) ->
    if confirm("Remove #{@model.get('name')} from slot #{@slot + 1}?")
      @model.clear()
      @model.set(new tbs.models.Unit().attributes)
      @model.set("editMode", "choosing")
      @model.trigger("change:editMode")
    else
      e.preventDefault()

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
    @model.on("change", @updateHelpText)

  renderAttributes: =>
    attrs = @attributes()
    @$el.attr("class",     attrs.class)
    @$el.attr("data-slot", attrs['data-slot'])

  renderStatsOverlay: =>
    if stats = @model.get('stats')
      stats.each (stat) =>
        @$(".stats-overlay .#{stat.get('stat')}").text(stat.get('current'))

  updateHelpText: =>
    if @model.isChosen()
      @$(".help-text").text("")
    else
      @$(".help-text").text("Click a unit below")




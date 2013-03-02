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
      Backbone.trigger("choose:unit")
    else
      e.preventDefault()
      e.stopPropagation()

  attributes: =>
    "class"     : "character #{@model.get('name')}"
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

  renderStatsOverlay: =>
    if stats = @model.get('stats')
      stats.each (stat) =>
        @$(".stats-overlay .#{stat.get('stat')}").text(stat.get('current'))

  renderAllocatedStatsOverlay: =>
    @$(".allocated-max-stats .allocated").text(@model.get("allocated_stat_points"))
    @$(".allocated-max-stats .max").text(@model.get("max_stat_points"))

  renderHelpText: =>
    if @model.isChosen()
      @$(".help-text").text("")
    else
      @$(".help-text").text("Click a unit below")




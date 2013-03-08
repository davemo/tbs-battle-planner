def 'tbs.views.UnitGrouping', class UnitGrouping extends Backbone.Fixins.SuperView

  attributes:
    class: "unit-type"

  initialize: (options) ->
    @type  = options.type
    @units = options.units

  renderTitle: =>
    @$(".title").text(@type)

  renderUnits: =>
    _(@units).each (unit) =>
      unit = new tbs.views.UnitSelector(model: unit)
      @$(".classes").append(unit.render().el)
      unit.draggable()
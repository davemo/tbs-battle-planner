def 'tbs.views.UnitGrouping', class UnitGrouping extends Backbone.Fixins.SuperView

  attributes:
    class: "unit-type"

  initialize: (options) ->
    @type  = options.type
    @units = options.units

  templateContext: =>
    type: @type
    units: _(@units).map (unit) -> unit.toJSON()

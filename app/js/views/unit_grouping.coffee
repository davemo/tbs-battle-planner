def 'tbs.views.UnitGrouping', class UnitGrouping extends Backbone.Fixins.SuperView

  attributes:
    class: "classtype"

  initialize: (options) ->
    @type  = options.type
    @name  = options.name
    @units = options.units

  templateContext: =>
    type: @type
    units: _(@units).map (unit) -> unit.toJSON()

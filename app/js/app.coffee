def 'tbs.BattlePlanner', class BattlePlanner

  constructor: ->
    @units         = new tbs.collections.Units(tbs.data.Units())
    @loadout_units = new tbs.collections.Units(@defaultLoadoutUnits())
    @unit_selector = $("#unit-groupings")


    # loadout
    @loadout = new tbs.views.Loadout(
      el: "#loadout",
      collection: @loadout_units
    ).render()

    # character-selector
    groupings = @units.groupBy("type")
    delete groupings.base
    _(groupings).each (units, type) =>
      @unit_selector.append(new tbs.views.UnitGrouping(
        units: units
        type: type
      ).render().el)

  defaultLoadoutUnits: =>
    _(_.range(0,6)).map => new tbs.models.Unit

  start: ->
    Backbone.history.start()

$ -> tbs.BattlePlanner = new tbs.BattlePlanner(); tbs.BattlePlanner.start()


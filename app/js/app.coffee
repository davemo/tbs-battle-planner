def 'tbs.BattlePlanner', class BattlePlanner

  constructor: ->
    @units         = new tbs.collections.Units(tbs.data.Units())
    @loadout       = $("#selected-characters")
    @unit_selector = $("#unit-groupings")

    # loadout controls
    _(_.range(0,6)).each =>
      @loadout.append(new tbs.views.LoadoutSlot().render().el)

    # character-selector
    groupings = @units.groupBy("type")
    delete groupings.base
    _(groupings).each (units, type) =>
      @unit_selector.append(new tbs.views.UnitGrouping(
        units: units
        type: type
      ).render().el)

  start: ->
    Backbone.history.start()

$ -> tbs.BattlePlanner = new tbs.BattlePlanner(); tbs.BattlePlanner.start()


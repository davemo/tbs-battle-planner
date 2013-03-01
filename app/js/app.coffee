def 'tbs.BattlePlanner', class BattlePlanner

  constructor: ->
    @units         = new tbs.collections.Units(tbs.data.Units())
    @unit_selector = $("#unit-groupings")
    @loadout_units = new tbs.collections.Units()

    # default loadout models
    _(_.range(0,6)).each =>
      @loadout_units.add(new tbs.models.Unit)

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

  start: ->
    Backbone.history.start()

$ -> tbs.BattlePlanner = new tbs.BattlePlanner(); tbs.BattlePlanner.start()


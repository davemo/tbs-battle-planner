def 'tbs.BattlePlanner', class BattlePlanner

  constructor: ->
    @units          = new tbs.collections.Units(tbs.data.Units())
    @loadout_units  = new tbs.collections.Units(@defaultLoadoutUnits())

    # loadout
    @loadout = new tbs.views.Loadout(
      el: "#loadout"
      collection: @loadout_units
    ).render()

    #character_selector
    @character_selector = new tbs.views.CharacterSelector(
      el: "#character-selector"
      collection: @unitTypesWithoutBase()
    ).render()

    #stat-editor

  unitTypesWithoutBase: =>
    _(@units.groupBy("type")).tap (types) -> delete types.base

  defaultLoadoutUnits: =>
    _(_.range(0,6)).map => new tbs.models.Unit

  start: ->
    Backbone.history.start()

$ -> tbs.BattlePlanner = new tbs.BattlePlanner(); tbs.BattlePlanner.start()


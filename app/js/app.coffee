def 'tbs.BattlePlanner', class BattlePlanner

  constructor: ->
    @units          = new tbs.collections.Units(@defaultUnits())
    @loadout_units  = new tbs.collections.Units(@defaultLoadoutUnits())

    # stat editor
    @stat_editor = new tbs.views.StatEditor(el: "#stat-editor")

    # loadout
    @loadout = new tbs.views.Loadout(
      el: "#loadout"
      collection: @loadout_units
      stat_editor: @stat_editor
    ).render()

    #character_selector
    @character_selector = new tbs.views.CharacterSelector(
      el: "#character-selector"
      collection: @unitTypesWithoutBase()
    ).render()

  unitTypesWithoutBase: =>
    _(@units.groupBy("type")).tap (types) -> delete types.base

  defaultLoadoutUnits: =>
    _(_.range(0,6)).map (slot) =>
      if slot is 0
        new tbs.models.Unit(editMode: "choosing")
      else
        new tbs.models.Unit

  defaultUnits: =>
    RANK_0_TOTAL_POINTS = 10
    RANK_1_TOTAL_POINTS = 11

    units = tbs.data.Units()

    _(units).each (unit) =>
      unit.max_stat_points = if unit.rank is 0 then RANK_0_TOTAL_POINTS else RANK_1_TOTAL_POINTS
      unit.allocated_stat_points = 0

    units

  start: ->
    Backbone.history.start()

$ -> tbs.BattlePlanner = new tbs.BattlePlanner(); tbs.BattlePlanner.start()


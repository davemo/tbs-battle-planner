def 'tbs.BattlePlanner', class BattlePlanner

  constructor: ->
    @units          = new tbs.collections.Units(tbs.data.Units())
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

  start: ->
    Backbone.history.start()

$ -> tbs.BattlePlanner = new tbs.BattlePlanner(); tbs.BattlePlanner.start()


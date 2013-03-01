def 'tbs.BattlePlanner', class BattlePlanner

  constructor: ->
    @units = new tbs.collections.Units(tbs.data.Units())

  start: ->
    Backbone.history.start()

$ -> tbs.BattlePlanner = new tbs.BattlePlanner(); tbs.BattlePlanner.start()


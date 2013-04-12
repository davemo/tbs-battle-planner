tbs.BattlePlannerNG.factory 'Units', ->
  _(_.range(0,6)).map ->
    name: ""
    type: ""
    stats: undefined
    allocated_stat_points: 0
    max_stat_points: 11

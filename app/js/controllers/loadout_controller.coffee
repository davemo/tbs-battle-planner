def 'tbs.LoadoutController', ($scope) ->

  # what does a unit look like
  defaultUnit =
    name: ""
    type: ""
    stats: undefined
    allocated_stat_points: 0
    max_stat_points: 0

  $scope.defaultUnits =
    _(_.range(0,6)).map ->
      _.clone(defaultUnit)

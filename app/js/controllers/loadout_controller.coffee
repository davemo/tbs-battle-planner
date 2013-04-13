tbs.BattlePlannerNG.directive "toggleIfUnitHasStatsWhenParentIsHovered", ->
  (scope, element, attributes) ->
    element.parent().bind "mouseenter", ->
      if scope.isChosen(scope.$index) and scope.$index.toString() isnt attributes.position
        element.show()

    element.parent().bind "mouseleave", ->
      element.hide()

def 'tbs.controllers.Loadout', ($scope, Units) ->
  $scope.units = Units

  $scope.isChosen = (index) ->
    $scope.units[index].stats isnt undefined

  $scope.moveUnit = (unit, from, to) ->
    otherUnit = $scope.units[from+to]
    $scope.units[from+to] = unit
    $scope.units[from]    = otherUnit

  $scope.statsOrEmpty = (unit, statIndex, min) ->
    if unit.stats
      unit.stats[statIndex][min]
    else
      "\u00A0" # &nbsp;

  $scope.clearUnit = (unit) ->
    _(unit).extend(tbs.core.defaultUnit())

tbs.BattlePlannerNG.directive "toggleIfUnitHasStatsWhenParentIsHovered", ->
  (scope, element, attributes) ->
    element.parent().bind "mouseenter", ->
      if scope.isChosen(scope.$index) and scope.$index.toString() isnt attributes.position
        element.show()

    element.parent().bind "mouseleave", ->
      element.hide()

def 'tbs.controllers.Loadout', ($scope, Units) ->
  $scope.units = Units

  $scope.statsOrEmpty = (unit, index, min) ->
    unit.stats?[index]?[min] || "\u00A0" # &nbsp;

  $scope.clearUnit = (unit) ->
    _(unit).extend(tbs.core.defaultUnit())

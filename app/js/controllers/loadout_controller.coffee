tbs.BattlePlannerNG.directive "toggleIfUnitHasStatsWhenParentIsHovered", ->
  (scope, element, attributes) ->
    element.parent().bind "mouseenter", ->
      if scope.isChosen(scope.$index) and scope.$index.toString() isnt attributes.position
        element.show()

    element.parent().bind "mouseleave", ->
      element.hide()

def 'tbs.LoadoutController', ($scope, Units) ->
  $scope.units = Units

  $scope.isChosen = (index) ->
    $scope.units[index].stats isnt undefined

  $scope.updateName = (index) ->
    $scope.units[index].name = "dave"

  $scope.statsOrEmpty = (unit, index, min) ->
    unit.stats?[index]?[min] || "\u00A0" # &nbsp;

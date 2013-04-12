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
    Units[index].stats isnt undefined

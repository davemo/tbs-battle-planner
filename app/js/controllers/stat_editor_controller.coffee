tbs.BattlePlannerNG.directive "disableRightClick", ->
  (scope, element, attributes) ->
    element.bind "contextmenu", -> false

def 'tbs.controllers.StatEditor', ($scope, AppStateService) ->

  $scope.doneEditing = ->
    AppStateService.choose()

  $scope.$on 'edit:unit', (event, unit) ->
    $scope.unit = unit
    $scope.editing = true

  $scope.$on 'choose:unit', ->
    $scope.editing = false

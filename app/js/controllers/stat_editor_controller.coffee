def 'tbs.controllers.StatEditor', ($scope, AppStateService) ->

  $scope.doneEditing = ->
    AppStateService.choose()

  $scope.$on 'edit:unit', (event, unit) ->
    $scope.unit = unit
    $scope.editing = true

  $scope.$on 'choose:unit', ->
    $scope.editing = false

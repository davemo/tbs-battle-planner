def 'tbs.controllers.CharacterSelector', ($scope, UnitGroupings, Units) ->
  $scope.unitGroupings = UnitGroupings

  $scope.$on 'edit:unit', ->
    $scope.editing = true

  $scope.$on 'choose:unit', ->
    $scope.editing = false

  $scope.assignUnitToNextAvailableLoadoutSlot = (unit) ->
    _(nextAvailableLoadoutSlot()).extend(unit)

  # private

  nextAvailableLoadoutSlot = ->
    _(Units).findWhere(stats: undefined) || _(Units).last()

def 'tbs.controllers.CharacterSelector', ($scope, UnitGroupings, Units) ->
  $scope.unitGroupings = UnitGroupings

  $scope.assignUnitToNextAvailableLoadoutSlot = (unit) ->
    _(nextAvailableLoadoutSlot()).extend(unit)

  # private

  nextAvailableLoadoutSlot = ->
    _(Units).findWhere(stats: undefined) || _(Units).last()

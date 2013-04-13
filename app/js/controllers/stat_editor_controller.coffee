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

def 'tbs.controllers.StatController', ($scope) ->

  changeBy = (unit, stat, amount) ->
    if !(unit.allocated_stat_points + amount > unit.max_stat_points or unit.allocated_stat_points + amount < 0)
      if !(stat.current + amount < stat.min or stat.current + amount > stat.max)
        stat.current += amount
        unit.allocated_stat_points += amount

  $scope.increaseOrDecrease = (unit, stat, e) ->
    switch e.which
      when 1 then changeBy(unit, stat, 1)  #left click
      when 3 then changeBy(unit, stat, -1) #right click

tbs.BattlePlannerNG.factory 'AppStateService', ($rootScope) ->
  edit: (unit) ->
    $rootScope.$broadcast('edit:unit', unit)
  choose: ->
    $rootScope.$broadcast('choose:unit')

def 'tbs.BattlePlannerNG.Router',
  tbs.BattlePlannerNG.config ($routeProvider) ->
    $routeProvider.when '/:encoded',
      controller: tbs.controllers.Loadout

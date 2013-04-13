def 'tbs.BattlePlannerNG',
  _(angular.module('tbs.BattlePlannerNG', [])).tap (app) ->
    # useful logging tools for all scopes
    app.run ($rootScope) ->
      $rootScope.log = (things...) ->
        console.log(things)

      $rootScope.alert = (something) ->
        alert(something)

def 'tbs.BattlePlannerNG',
  _(angular.module('tbs.BattlePlannerNG', [])).tap (app) ->
    # configure template string other than handlebars
    app.config ($interpolateProvider) ->
      $interpolateProvider.startSymbol('{[{')
      $interpolateProvider.endSymbol('}]}')

    # useful logging tools for all scopes
    app.run ($rootScope) ->
      $rootScope.log = (things...) ->
        console.log(things)

      $rootScope.alert = (something) ->
        alert(something)

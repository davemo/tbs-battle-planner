tbs.BattlePlannerNG.directive "disableRightClick", ->
  (scope, element, attributes) ->
    element.bind "contextmenu", -> false

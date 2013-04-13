def 'tbs.BattlePlannerNG.Router',
  tbs.BattlePlannerNG.config ($routeProvider) ->
    $routeProvider.when '/:encoded',
      controller: tbs.controllers.Loadout


# def 'tbs.Router', class Router extends Backbone.Router

#   initialize: (options) =>
#     # @loadout = options.loadout
#     # @loadout.on("change", @storeHash)

#   routes:
#     ":encoded" : "loadLoadout"

#   loadLoadout: (encoded) ->
#     # @loadout.reset(@loadout.deserialize(encoded))
#     # Backbone.trigger("loaded:from:hash")

#   storeHash: =>
#     @navigate(@loadout.serialize(), {replace: true})

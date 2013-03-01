def 'tbs.views.LoadoutSlot', class LoadoutSlot extends Backbone.Fixins.SuperView

  events:
    "click" : -> $("#character-selector").slideDown()

  initialize: ->
    @model ||= new tbs.models.Unit
    @model.on("change", @render)



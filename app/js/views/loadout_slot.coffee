def 'tbs.views.LoadoutSlot', class LoadoutSlot extends Backbone.Fixins.SuperView

  initialize: ->
    @model ||= new tbs.models.Unit
    @model.on("change", @render)



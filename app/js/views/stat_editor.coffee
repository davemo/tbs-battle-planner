def 'tbs.views.StatEditor', class StatEditor extends Backbone.Fixins.SuperView

  renderVisible: =>
    if @model.isChosen() then @$el.show() else @$el.hide()

  hide: =>
    @$el.hide()

  show: (unit) =>
    @model = unit
    @render()

def 'tbs.views.StatEditor', class StatEditor extends Backbone.Fixins.SuperView

  renderVisible: =>
    if @model.isChosen() then @$el.show() else @$el.hide()

  renderStatControls: =>
    unit_stats = @model.get('stats')
    unit_stats.each (stat, i) =>
      @$(".stats").append(new tbs.views.StatControl(model: stat).render().el)

  hide: =>
    @$el.hide()

  show: (unit) =>
    @model = unit
    @render()

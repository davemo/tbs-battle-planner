def 'tbs.views.StatEditor', class StatEditor extends Backbone.Fixins.SuperView

  events:
    "click .reset" : "resetToMinimums"
    "click .done"  : "hide"

  renderVisible: =>
    if @model.isChosen() then @$el.show() else @$el.hide()

  renderStatControls: =>
    unit_stats = @model.get('stats')
    unit_stats.each (stat, i) =>
      @$(".stats").append(new tbs.views.StatControl(unit: @model, model: stat).render().el)

  resetToMinimums: =>
    @model.set("allocated_stat_points", 0)
    stats = @model.get('stats')
    stats.each (stat) =>
      stat.set('current', stat.get('min'))
    @model.trigger('change')

  renderTotals: =>
    @$(".total .allocated").text(@model.get("allocated_stat_points"))
    @$(".total .max").text(@model.get("max_stat_points"))

  hide: =>
    $("#character-selector").show()
    @$el.hide()

  show: (unit) =>
    @model = unit
    @model.on("change:allocated_stat_points", @renderTotals)
    @render()

def 'tbs.views.Loadout', class Loadout extends Backbone.View

  events:
    "click .character" : "setEditMode"

  initialize: =>
    @stat_editor   = $("#stat-editor")
    @unit_selector = $("#character-selector")
    @collection.on("change:editMode", @showProperEditWindow)

  setEditMode: (e) =>
    @resetEditModeOnAllUnits()
    unit = @collection.at($(e.currentTarget).data("slot"))
    if unit.isChosen() then unit.editStats() else unit.choose()

  resetEditModeOnAllUnits: =>
    @collection.each (unit) =>
      unit.set("editMode", "")

  showProperEditWindow: (__, editMode) =>
    switch editMode
      when "choosing"
        @stat_editor.hide()
        @unit_selector.show()
      when "stats"
        @unit_selector.hide()
        @stat_editor.show()

  render: =>
    @collection.each (unit, i) =>
      @$("#selected-characters").append(new tbs.views.LoadoutSlot(
        model: unit
        slot: i
      ).render().el)
    @

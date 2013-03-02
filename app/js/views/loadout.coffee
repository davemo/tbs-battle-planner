def 'tbs.views.Loadout', class Loadout extends Backbone.View

  events:
    "click .character"     : "setEditMode"

  initialize: (options) =>
    @stat_editor   = options.stat_editor
    @unit_selector = $("#character-selector")
    @collection.on("change:editMode", @showProperEditWindow)

  setEditMode: (e) =>
    unit = @fetchUnitFromCollectionViaSlotDataAttribute(e)
    if unit.isChosen() then unit.editStats()

  fetchUnitFromCollectionViaSlotDataAttribute: (element) =>
    @collection.at($(element.currentTarget).data("slot"))

  showProperEditWindow: (unit, editMode) =>
    switch editMode
      when "choosing"
        @stat_editor.hide()
        @unit_selector.show()
      when "edit-stats"
        @unit_selector.hide()
        @stat_editor.show(unit)

  render: =>
    @collection.each (unit, i) =>
      @$("#selected-characters").append(new tbs.views.LoadoutSlot(
        model: unit
        slot: i
      ).render().el)
    @

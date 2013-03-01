def 'tbs.views.Loadout', class Loadout extends Backbone.View

  events:
    "click .character" : "setEditMode"

  initialize: =>
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
      when "choosing" then $("#character-selector").slideDown()
      when "editing"  then alert("editing")

  render: =>
    @collection.each (unit, i) =>
      @$("#selected-characters").append(new tbs.views.LoadoutSlot(
        model: unit
        slot: i
      ).render().el)
    @

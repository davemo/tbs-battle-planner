def 'tbs.views.Loadout', class Loadout extends Backbone.View

  events:
    "click .character" : "setMode"

  initialize: =>
    @collection.on("change:editMode", @showProperEditWindow)

  setMode: (e) =>
    @resetEditModeOnAllUnits()
    slot = $(e.currentTarget).data("slot")
    unit = @collection.at(slot)
    unit.set("editMode", "choosing")

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

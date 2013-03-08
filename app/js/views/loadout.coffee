def 'tbs.views.Loadout', class Loadout extends Backbone.View

  events:
    "click .character" : "editUnit"

  initialize: =>
    Backbone.on("loaded:from:hash", @render)

  editUnit: (e) =>
    unit = @fetchUnitFromCollectionViaSlotDataAttribute(e)
    if unit.isChosen()
      Backbone.trigger("edit:unit", unit)
    else
      Backbone.trigger("choose:unit")

  fetchUnitFromCollectionViaSlotDataAttribute: (element) =>
    @collection.at($(element.currentTarget).data("slot"))

  updateLoadOrder: (e, ui) =>
    newPosition = 0
    startingPosition = $(ui.item).data("loadout_slot").slot
    @$("#selected-characters").find("li.character").not(".ui-sortable-placeholder").each (j) ->
      $(this).attr("data-slot", j)
      $(this).data("loadout_slot").slot = j;
      if this == ui.item.get 0
        newPosition = j
        false
    unit = @collection.models.splice(startingPosition, 1)
    @collection.models.splice(newPosition, 0, unit[0])
    attrs = _(unit[0].attributes).clone()
    unit[0].clear()
    unit[0].set(attrs)

  startSorting: (e, ui) =>
    $(ui.item).data("loadout_slot").hideOverlay()

  stopSorting: (e, ui) =>
    $(ui.item).data("loadout_slot").showOverlay()

  render: =>
    characters = @$("#selected-characters").empty()
    @collection.each (unit, i) =>
      slot = new tbs.views.LoadoutSlot(
        model: unit
        slot: i
      )
      characters.append(slot.render().el)
      slot.droppable()
    startingPosition = 0
    characters.sortable
      update: @updateLoadOrder
      start: @startSorting
      stop: @stopSorting
    @
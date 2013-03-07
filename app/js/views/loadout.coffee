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

  render: =>
    @$("#selected-characters").empty()
    @collection.each (unit, i) =>
      @$("#selected-characters").append(new tbs.views.LoadoutSlot(
        model: unit
        slot: i
      ).render().el)
    startingPosition = 0
    @$("#selected-characters").sortable
      update: (e, ui) => 
        newPosition = 0
        @$("#selected-characters").find('li.character').not(".ui-sortable-placeholder").each (j) ->
          if this == ui.item.get 0
            newPosition = j
            return false
        unit = @collection.models.splice(startingPosition, 1)
        @collection.models.splice(newPosition, 0, unit[0])
        attrs = _(unit[0].attributes).clone()
        unit[0].clear()
        unit[0].set(attrs)
      start: (e, ui) =>
        @$("#selected-characters").find('li.character').not(".ui-sortable-placeholder").each (j) ->
          if this == ui.item.get 0
            startingPosition = j
            return false
        ui.item.find(".remove, .move-left, .move-right").hide()
      stop : (e, ui) =>
        ui.item.find(".remove, .move-left, .move-right").show()
    @
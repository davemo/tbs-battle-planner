def 'tbs.views.Loadout', class Loadout extends Backbone.View

  events:
    "click .character"     : "editUnit"

  editUnit: (e) =>
    unit = @fetchUnitFromCollectionViaSlotDataAttribute(e)
    if unit.isChosen()
      Backbone.trigger("edit:unit", unit)
    else
      Backbone.trigger("choose:unit")

  fetchUnitFromCollectionViaSlotDataAttribute: (element) =>
    @collection.at($(element.currentTarget).data("slot"))

  render: =>
    @collection.each (unit, i) =>
      @$("#selected-characters").append(new tbs.views.LoadoutSlot(
        model: unit
        slot: i
      ).render().el)
    @

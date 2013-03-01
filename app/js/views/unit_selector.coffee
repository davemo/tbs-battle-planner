def 'tbs.views.UnitSelector', class UnitSelector extends Backbone.Fixins.SuperView

  tagName: "li"

  attributes: =>
    class: "character #{@model.get('name')}"

  events:
    "click" : "assignUnitToLoadoutSlot"

  assignUnitToLoadoutSlot: =>
    # get the active loadout slot
    loadout_unit = tbs.BattlePlanner.loadout_units.where(editMode: "choosing")[0]
    loadout_unit.clear()
    loadout_unit.set(@model.clone().attributes)

def 'tbs.collections.Units', class Units extends Backbone.Collection
  model: tbs.models.Unit

  resetEditModeOnAllUnits: =>
    @each (unit) =>
      unit.set("editMode", "")

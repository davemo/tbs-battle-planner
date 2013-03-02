def 'tbs.models.Unit', class Unit extends Backbone.Model

  defaults:
    # data
    name: ""
    type: ""
    stats: undefined
    # client attrs
    editMode: ""
    helpText: "Click to add a unit"

  isChosen: =>
    @has("stats")

  isEmpty: =>
    not @has("stats")

  isChoosing: =>
    @get("editMode") == "choosing"

  editStats: =>
    @set("editMode", "edit-stats")

  validate: (attrs) =>
    if attrs.allocated_stat_points < 0 or attrs.allocated_stat_points > attrs.max_stat_points
      "would go over"

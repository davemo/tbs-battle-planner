def 'tbs.models.Unit', class Unit extends Backbone.Model

  defaults:
    # data
    name: ""
    type: ""
    stats: undefined
    # client attrs
    editMode: ""

  isChosen: =>
    @get("stats") isnt undefined

  editStats: =>
    @set("editMode", "edit-stats")

  choose: =>
    @set("editMode", "choosing")

  validate: (attrs) =>
    if attrs.allocated_stat_points < 0 or attrs.allocated_stat_points > attrs.max_stat_points
      "would go over"

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

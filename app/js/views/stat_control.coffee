def 'tbs.views.StatControl', class StatControl extends Backbone.Fixins.SuperView

  tagName: "li"

  events:
    "mousedown .icon"   : "increaseOrDecreaseStat"
    "contextmenu .icon" : -> false

  initialize: ->
    @model.on("change:current", @update)

  attributes: =>
    class: @model.get("stat")

  increaseOrDecreaseStat: (e) =>
    e.preventDefault()
    e.stopPropagation()
    switch e.which
      when 1 then @changeBy(1) #left click
      when 3 then @changeBy(-1) #right click

  changeBy: (amount) =>
    @model.set({current: @model.get("current") + amount}, {validate: true})

  update: =>
    @$(".current").text(@model.get("current"))


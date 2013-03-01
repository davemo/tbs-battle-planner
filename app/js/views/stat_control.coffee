def 'tbs.views.StatControl', class StatControl extends Backbone.Fixins.SuperView
  attributes: =>
    class: @model.get("stat")

def 'tbs.views.UnitSelector', class UnitSelector extends Backbone.Fixins.SuperView

  tagName: "li"

  attributes: =>
    class: "character #{@model.get('name')}"

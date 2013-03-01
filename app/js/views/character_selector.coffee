def 'tbs.views.CharacterSelector', class CharacterSelector extends Backbone.View

  render: =>
    _(@collection).each (units, type) =>
      @$("#unit-groupings").append(new tbs.views.UnitGrouping(
        units: units
        type: type
      ).render().el)


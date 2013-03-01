def 'tbs.models.UnitStat', class UnitStat extends Backbone.Model

  validate: (attrs) ->
    if attrs.current < attrs.min or attrs.current > attrs.max
      "invalid min/max attempted"

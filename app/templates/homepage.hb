<!DOCTYPE html>
<html>
  <head>
    <title>{{ pkg.name }}</title>
    <link rel="stylesheet" type="text/css" href="{{ css }}?v={{ pkg.version }}" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Skranji' rel='stylesheet' type='text/css'>
  </head>
  <body ng-app="tbs.BattlePlannerNG">

    <div id="header">
      <div class="wrapper">
        <h1>The Banner Saga : Factions | Battle Planner</h1>
      </div>
    </div>

    <div id="loadout" ng-controller="tbs.controllers.Loadout" ng-cloak>
      <div class="wrapper">
        <ul id="selected-characters">
          <li ng-repeat="unit in units" class="character {[{ unit.name }]}" ng-click="edit(unit)">
            <div class="title">{[{ unit.name }]}</div>
            <div class="portrait">
              <span class="help-text" ng-hide="isChosen($index)">Click a unit below</span>
            </div>
            <span class="remove" show-if-unit-has-stats-when-parent-is-hovered ng-click="clearUnit(unit)">&times;</span>
            <ul class="stats-overlay">
              {{! How can I still have the default values show up here like this... }}
              {{! <li class="armor">&nbsp;</li> }}
              {{! this seems clunky... }}
              {{! might be a good opportunity for an element directive }}
              <li class="armor">{[{ statsOrEmpty(unit, "armor") }]}</li>
              <li class="strength">{[{ statsOrEmpty(unit, "strength") }]}</li>
              <li class="willpower">{[{ statsOrEmpty(unit, "willpower") }]}</li>
              <li class="exertion">{[{ statsOrEmpty(unit, "exertion") }]}</li>
              <li class="break">{[{ statsOrEmpty(unit, "break") }]}</li>
            </ul>
            <span class="move-left" show-if-unit-has-stats-when-parent-is-hovered position="0" ng-click="moveUnit(unit, $index, -1, $event)"></span>
            <span class="move-right" show-if-unit-has-stats-when-parent-is-hovered position="5" ng-click="moveUnit(unit, $index, 1, $event)"></span>
            <div class="allocated-max-stats">
              <span class="allocated">{[{ unit.allocated_stat_points }]}</span>/<span class="max">{[{ unit.max_stat_points }]}</span>
            </div>
          </li>
        </ul>
      </div>
    </div>

    <div id="character-selector" ng-controller="tbs.controllers.CharacterSelector" ng-cloak ng-hide="editing">
      <div class="wrapper">
        <div id="unit-groupings" >
          <div class="unit-type" ng-repeat="(type, group) in unitGroupings">
            <div class="title">{[{ type }]}</div>
              <ul class="classes">
                <li class="character {[{ unit.name }]}" ng-repeat="unit in group" ng-click="assignUnitToNextAvailableLoadoutSlot(unit)">
                  <div class="title">{[{ unit.name }]}</div>
                  <div class="portrait"></div>
                </li>
              </ul>
          </div>
        </div>
      </div>
    </div>

    <div id="stat-editor" ng-controller="tbs.controllers.StatEditor" ng-cloak ng-show="editing">
      <div class="wrapper">
        <div class="title-and-controls">
          <div class="title">{[{ unit.name }]} - (rank <span class="rank">{[{ unit.rank }]}</span>)</div>
          <div class="controls">
            <span class="done" ng-click="doneEditing()">Done Editing</span>
            <span class="reset">Reset to Minimums</span>
            <span class="total">
              <span class="allocated">{[{ unit.allocated_stat_points }]}</span>/<span class="max">{[{ unit.max_stat_points }]}</span>
            </span>
            <span id="rank-changer" class="rank{[{ unit.rank }]}">
              <span class="ui-title">Rank</span>
              <span class="set-rank-1 change-rank">1</span><span class="set-rank-2 change-rank">2</span><span class="set-rank-3 change-rank">3</span>
            </span>
          </div>
        </div>

        <div class="portrait {[{ unit.name }]}"></div>

        <ul class="stats">
          <li class="{[{ stat.name }]}" ng-repeat="stat in unit.stats" ng-controller="tbs.controllers.StatChange">
            <span class="current">{[{ stat.current }]}</span>/<span class="max">{[{ stat.max }]}</span>
            <span class="icon" disable-right-click ng-mousedown="increaseOrDecrease(unit, stat, $event)"></span>
          </li>
        </ul>
      </div>
    </div>

    <div id="credits">
      <div class="wrapper">
        built by <a href="http://www.twitter.com/@dmosher">@dmosher</a>
        <span class="build">
          Calculator Release <span class="version">{{ pkg.version }}</span> based on <a href="http://stoicstudio.com/forum/the-banner-saga-factions.php">The Banner Saga: Factions</a> build <span class="version">{{ pkg.tbs_version }}</span>
        </span>
      </div>
    </div>

    <script src="{{ js }}?v={{ pkg.version }}"></script>
  </body>
</html>

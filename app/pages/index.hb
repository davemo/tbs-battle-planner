<!DOCTYPE html>
<html>
  <head>
    <title>{{ pkg.name }}</title>
    <link rel="stylesheet" type="text/css" href="css/app.css?v={{ pkg.version }}" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Skranji' rel='stylesheet' type='text/css'>
    <script src="js/app.js?v={{ pkg.version }}"></script>
  </head>
  <body ng-app="tbs.BattlePlannerNG">

    <div id="header">
      <div class="wrapper">
        <h1>The Banner Saga : Factions | Battle Planner</h1>
      </div>
    </div>

    <div id="loadout" ng-controller="tbs.LoadoutController" ng-cloak>
      <div class="wrapper">
        <ul id="selected-characters">
          <li ng-repeat="unit in units" class="character {[{ name }]}" ng-click="updateName($index)">
            <div class="title">{[{ unit.name }]}</div>
            <div class="portrait">
              <span class="help-text">Click a unit below</span>
            </div>
            <span class="remove" data-slot="{[{ $index }]}" toggle-if-unit-has-stats-when-parent-is-hovered>&times;</span>
            <ul class="stats-overlay">
              <li class="armor">&nbsp;</li>
              <li class="strength">&nbsp;</li>
              <li class="willpower">&nbsp;</li>
              <li class="exertion">&nbsp;</li>
              <li class="break">&nbsp;</li>
            </ul>
            <span class="move-left" toggle-if-unit-has-stats-when-parent-is-hovered position="0"></span>
            <span class="move-right" toggle-if-unit-has-stats-when-parent-is-hovered position="5"></span>
            <div class="allocated-max-stats">
              <span class="allocated">0</span>/<span class="max">11</span>
            </div>
          </li>
        </ul>
      </div>
    </div>

    <div id="character-selector">
      <div class="wrapper">
        <div id="unit-groupings"></div>
      </div>
    </div>

    <div id="stat-editor"></div>

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

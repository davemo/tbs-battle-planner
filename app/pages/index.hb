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

    <div id="loadout" ng-controller="tbs.LoadoutController">
      <div>{[{ data.message }]}</div>
      <div class="wrapper">
        <ul id="selected-characters"></ul>
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

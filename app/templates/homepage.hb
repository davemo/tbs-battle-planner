<!DOCTYPE html>
<html>
  <head>
    <title>{{ pkg.name }}</title>
    <link rel="stylesheet" type="text/css" href="{{ css }}" media="all" />
    <link href='http://fonts.googleapis.com/css?family=Skranji' rel='stylesheet' type='text/css'>
    <script src="{{ js }}"></script>
  </head>
  <body>

    <div id="header">
      <div class="wrapper">
        <h1>The Banner Saga : Factions | Battle Planner</h1>
      </div>
    </div>

    <div id="loadout">
      <div class="inner">
        <ul id="selected-characters" class="wrapper"></ul>
      </div>
    </div>

    <div id="character-selector">
      <div class="wrapper">
        <div id="unit-groupings"></div>
      </div>
    </div>

    <div id="stat-editor">
      <div class="wrapper">
        <div class="title">Bowmaster</div>
        <div class="portrait bowmaster"></div>
        <ul class="stats">
          <li class="armor">
            <span class="current">8</span>/<span class="max">9</span><span class="icon"></span>
          </li>
          <li class="strength">
            <span class="current">8</span>/<span class="max">8</span><span class="icon"></span>
          </li>
          <li class="willpower">
            <span class="current">6</span>/<span class="max">12</span><span class="icon"></span>
          </li>
          <li class="exertion">
            <span class="current">3</span>/<span class="max">3</span><span class="icon"></span>
          </li>
          <li class="break">
            <span class="current">1</span>/<span class="max">2</span><span class="icon"></span>
          </li>
          <li class="total">
            <span class="current">11</span>/<span class="max">11</span>
          </li>
        </ul>
        <div class="controls">
          <button>Confirm</button>
          <button>Cancel</button>
        </div>
      </div>
    </div>
  </body>
</html>

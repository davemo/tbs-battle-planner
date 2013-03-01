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
        <ul id="selected-characters" class="wrapper">
          <li class="character warhawk">
            <div class="title">warhawk</div>
            <div class="portrait"></div>
          </li>
          <li class="character provoker">
            <div class="title">provoker</div>
            <div class="portrait"></div>
          </li>
          <li class="character skystriker">
            <div class="title">skystriker</div>
            <div class="portrait"></div>
          </li>
          <li class="character thrasher">
            <div class="title">thrasher</div>
            <div class="portrait"></div>
          </li>
          <li class="character shieldbanger">
            <div class="title">shieldbanger</div>
            <div class="portrait"></div>
          </li>
          <li class="character backbiter">
            <div class="title">backbiter</div>
            <div class="portrait"></div>
          </li>
        </ul>
      </div>
    </div>

    <div id="character-selector">
      <div class="wrapper">
        <div class="raiders classtype">
          <div class="title">Raiders</div>
          <ul class="classes">
            <li class="character raidmaster">
              <div class="title">Raidmaster</div>
              <div class="portrait"></div>
            </li>
            <li class="character thrasher">
              <div class="title">Thrasher</div>
              <div class="portrait"></div>
            </li>
            <li class="character backbiter">
              <div class="title">Backbiter</div>
              <div class="portrait"></div>
            </li>
          </ul>
        </div>

        <div class="archers classtype">
          <div class="title">Archers</div>
          <ul class="classes">
            <li class="character skystriker">
              <div class="title">Skystriker</div>
              <div class="portrait"></div>
            </li>
            <li class="character bowmaster">
              <div class="title">Bowmaster</div>
              <div class="portrait"></div>
            </li>
            <li class="character siegearcher">
              <div class="title">Siege Archer</div>
              <div class="portrait"></div>
            </li>
          </ul>
        </div>

        <div class="warriors classtype">
          <div class="title">Warriors</div>
          <ul class="classes">
            <li class="character warmaster">
              <div class="title">Warmaster</div>
              <div class="portrait"></div>
            </li>
            <li class="character warleader">
              <div class="title">Warleader</div>
              <div class="portrait"></div>
            </li>
            <li class="character warhawk">
              <div class="title">Warhawk</div>
              <div class="portrait"></div>
            </li>
          </ul>
        </div>

        <div class="shieldbangers classtype">
          <div class="title">Shieldbangers</div>
          <ul class="classes">
            <li class="character provoker">
              <div class="title">Provoker</div>
              <div class="portrait"></div>
            </li>
            <li class="character strongarm">
              <div class="title">Strongarm</div>
              <div class="portrait"></div>
            </li>
            <li class="character shieldmaster">
              <div class="title">Shieldmaster</div>
              <div class="portrait"></div>
            </li>
          </ul>
        </div>
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

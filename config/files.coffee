# Exports an object that defines  all of the paths & globs that the project  is
# concerned with.
#
# The "configure" task will require this file and then re-initialize the grunt
# config such that directives like <config:files.js.app> will work regardless
# of the point you're at in the build lifecycle.
#
# You can find the parent object in: node_modules/lineman/config/files.js
#
module.exports = require("lineman").config.extend("files",

  #Override file patterns here
  js:
    spec: "spec/js/**/*.js"
    specHelpers: "spec/js/helpers/**/*.js"
    vendor: [
      "vendor/js/underscore.js",
      "vendor/js/jquery.js",
      "vendor/js/backbone.js",
      "vendor/js/**/*.js"
    ]

  coffee:
    # must be loaded before template_helpers.coffee
    app: [
      "app/js/config/**/*.coffee",
      "app/js/models/**/*.coffee",
      "app/js/**/*.coffee"
    ]
    spec: "spec/js/**/*.coffee"
    specHelpers: "spec/js/helpers/**/*.coffee"
)

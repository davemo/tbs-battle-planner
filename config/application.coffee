# Exports an object that defines  all of the configuration needed by the
# projects' depended-on grunt tasks.
#
# You can find the parent object in: node_modules/lineman/config/application.js
#
module.exports = require("lineman").config.extend "application",

  loadNpmTasks: [
    "grunt-angular-templates"
    "grunt-contrib-imagemin"
  ]

  removeTasks:
    common: ["handlebars", "jst"]

  prependTasks:
    common: ["ngtemplates"]
    dist: ["imagemin"]

  ngtemplates:
    "tbs.BattlePlannerNG":
      options:
        base: "app/templates"
      src: "<%= files.ngtemplates.src %>",
      dest: "<%= files.ngtemplates.dest %>"

  less:
    options:
      ieCompat: false

  imagemin:
    all_images:
      files: [
        expand: true
        src: ["app/img/**/*.png"]
        dest: "."
      ]

  concat:
    js:
      src: [
        "<%= files.js.vendor %>"
        "<%= files.coffee.generated %>"
        "<%= files.ngtemplates.dest %>"
      ]
      dest: "<%= files.js.concatenated %>"

  watch:
    ngtemplates:
      files: "app/templates/**/*.html"
      tasks: ["ngtemplates", "concat:js"]

# Exports an object that defines  all of the configuration needed by the
# projects' depended-on grunt tasks.
#
# You can find the parent object in: node_modules/lineman/config/application.js
#
module.exports = require("lineman").config.extend "application",

  loadNpmTasks: [
    "grunt-angular-templates"
  ]

  removeTasks:
    common: ["handlebars", "jst"]

  prependTasks:
    common: ["ngtemplates"]

  ngtemplates:
    "tbs.BattlePlannerNG":
      options:
        base: "app/templates"
      src: "<%= files.ngtemplates.src %>",
      dest: "<%= files.ngtemplates.dest %>"

  concat:
    js:
      src: ["<%= files.js.vendor %>", "<%= files.coffee.generated %>", "<%= files.ngtemplates.dest %>"],
      dest: "<%= files.js.concatenated %>"

  watch:
    ngtemplates:
      files: "app/templates/**/*.html"
      tasks: ["ngtemplates", "concat:js"]

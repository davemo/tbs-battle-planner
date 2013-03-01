# Exports an object that defines  all of the configuration needed by the
# projects' depended-on grunt tasks.
#
# You can find the parent object in: node_modules/lineman/config/application.js
#
module.exports = require("lineman").config.extend("application",

  #Override application configuration here
  homepage:
    template: "app/templates/homepage.hb"

  handlebars:
    compile:
      options:
        wrapped: true

  concat:
    js:
      separator: ";"

  server:
    base: "generated"
    web:
      port: 8000
)

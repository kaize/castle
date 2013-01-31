class Castle.Routers.CalendarsRouter extends Backbone.Router
  initialize: (options) ->
    @calendars = new Castle.Collections.CalendarsCollection([Castle.Models.Calendar])

  #alert JSON.stringify(@calendars)

  routes:
    "index"    : "index"
    ".*"        : "index"

  index: ->
    @view = new Castle.Views.Calendars.IndexView(model:@calendars.models[0], calendars: @calendars)
    $("#calendars").html(@view.render().el)

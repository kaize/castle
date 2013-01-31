Castle.Views.Calendars ||= {}

class Castle.Views.Calendars.IndexView extends Backbone.View
  template: JST["backbone/templates/calendars/index"]

  events:
    "click .month-dec": "month_decrement"
    "click .month-inc": "month_increment"
    "click .year-dec": "year_decrement"
    "click .year-inc": "year_increment"

  month_decrement: () ->
    @model.month_decrement()
    @model.set_days()
    @.render()

  month_increment: () ->
    @model.month_increment()
    @model.set_days()
    @.render()

  year_decrement: () ->
    @model.year_decrement()
    @model.set_days()
    @.render()

  year_increment: () ->
    @model.year_increment()
    @model.set_days()
    @.render()

  render: =>
    @$el.html(@template(options: @options.calendars.models[0].attributes))

    return this

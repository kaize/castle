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
    return false

  month_increment: () ->
    @model.month_increment()
    @model.set_days()
    @.render()
    return false

  year_decrement: () ->
    @model.year_decrement()
    @model.set_days()
    @.render()
    return false

  year_increment: () ->
    @model.year_increment()
    @model.set_days()
    @.render()
    return false

  render: =>
    work_date = moment(@model.get("year") + "-" + @model.get("digit_month") + "-01", "YYYY-MM-DD")
    $.ajax({
      url: "/api/events"
      async: false
      context: @
      data:
        ran:
          begin_date_lteq: work_date.endOf("month").format("YYYY-MM-DD")
          end_date_gteq: work_date.startOf("month").format("YYYY-MM-DD")
    }).done (data) ->
      @model.events_days (data)

    @$el.html(@template(options: @options.calendars.models[0].attributes))

    return this

class Castle.Models.Calendar extends Backbone.Model
  paramRoot: 'calendar'

#  TODO Повесить событие на изменение месяца и года и вызывать у них @set_days() и @load_events()

  month_decrement: =>
    month = parseInt(@attributes.digit_month) - 1

    if month == 0
      @attributes.digit_month = 12
      @attributes.year = parseInt(@attributes.year) - 1
    else
      @attributes.digit_month = month
    @attributes.month = _.str.capitalize(moment(@attributes.digit_month + "", ["MM"]).format('MMMM'))

    @set_days()
    @load_events()
    return @

  month_increment: =>
    month =  parseInt(@attributes.digit_month)   + 1

    if month == 13
      @attributes.digit_month =  1
      @attributes.year = parseInt(@attributes.year) + 1
    else
      @attributes.digit_month = month
    @attributes.month = _.str.capitalize(moment(@attributes.digit_month + "", ["MM"]).format('MMMM'))

    @set_days()
    @load_events()
    return @

  year_decrement: =>
    @attributes.year = parseInt(@attributes.year) - 1

    @set_days()
    @load_events()
    return @

  year_increment: =>
    @attributes.year = parseInt(@attributes.year) + 1

    @set_days()
    @load_events()
    return @


  days_on_weeks: (month, year) =>
    days = {}
    i = 1
    work_date = moment(month + "-" + year, ["MM-YYYY"])
    first_day = moment(work_date.startOf("month"))
    first_day_week_num = parseInt(first_day.format("d"))

    last_day = moment(work_date.endOf("month"))
    last_day_num = parseInt(last_day.format("D"))
    last_day_week_num = parseInt(last_day.format("d"))

    last_day_week_num = 7  if last_day_week_num is 0
    first_day_week_num = 7 if first_day_week_num is 0

    days_num = (first_day_week_num - 1) + last_day_num + (7 - last_day_week_num)
    @attributes.days_to_display_count = days_num
    week_num = 0
    days[week_num] = {}
    while i <= days_num
      day = i + 1 - first_day_week_num
      if day <= 0 or day > last_day_num
        days[week_num][i] = ""
      else
        days[week_num][i] = day
      if i % 7 == 0
        week_num++
        days[week_num] = {}
      i++
    return days

  events_days: (data) =>
    @attributes.events = {}
    for event of data.events

      event_begin_date = moment(data.events[event].begin_date)
      event_end_date = moment(data.events[event].end_date)
      if event_begin_date < moment(@attributes.digit_month + "-" + @attributes.year, "MM-YYYY")
        event_begin_date = moment(@attributes.digit_month + "-" + @attributes.year, "MM-YYYY").format("D")
      else
        event_begin_date = event_begin_date.format("D")

      if event_end_date > moment(@attributes.digit_month + "-" + @attributes.year, "MM-YYYY").endOf("month")
        event_end_date = moment(@attributes.digit_month + "-" + @attributes.year, "DD-MM-YYYY").endOf("month").format("D")
      else
        event_end_date = event_end_date.format("D")

      while event_begin_date <= event_end_date
        @attributes.events[event_begin_date] = {} if @attributes.events[event_begin_date] is undefined
        @attributes.events[event_begin_date][data.events[event].id] = data.events[event]
        event_begin_date++

  set_days: () =>
    @set("days",  @days_on_weeks(@attributes.digit_month, @attributes.year))
    
  load_events: () =>
    work_date = moment(@attributes.year + "-" + @attributes.digit_month + "-01", "YYYY-MM-DD")
    $.ajax({
      url: "/api/events"
      async: false
      context: @
      data:
        ran:
          begin_date_lteq: work_date.endOf("month").format("YYYY-MM-DD")
          end_date_gteq: work_date.startOf("month").format("YYYY-MM-DD")
    }).done (data) ->
      @events_days (data)

  initialize: (options) ->
    if options && options.date
      now = moment(options.date, ["YYYY-MM-DD"])
    else
      now = moment()

    @attributes.digit_month = now.format('MM')
    @attributes.month = _.str.capitalize(now.format('MMMM'))
    @attributes.year = now.format('YYYY')
    @attributes.current_day = parseInt(now.format('D'))

    @set_days()
    @load_events()

    return @


class Castle.Collections.CalendarsCollection extends Backbone.Collection
  model: Castle.Models.Calendar
  url: '/api/calendars'

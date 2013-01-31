class Castle.Models.Calendar extends Backbone.Model
  paramRoot: 'calendar'

  month_decrement: =>
    month = parseInt(@attributes.digit_month) - 1

    if month == 0
      @attributes.digit_month = 12
      @attributes.year = parseInt(@attributes.year) - 1
    else
      @attributes.digit_month = month
    @attributes.month = moment(@attributes.digit_month + "", ["MM"]).format('MMMM')
    return @

  month_increment: =>
    month =  parseInt(@attributes.digit_month)   + 1

    if month == 13
      @attributes.digit_month =  1
      @attributes.year = parseInt(@attributes.year) + 1
    else
      @attributes.digit_month = month
    @attributes.month = moment(@attributes.digit_month + "", ["MM"]).format('MMMM')
    return @

  year_decrement: =>
    @attributes.year = parseInt(@attributes.year) - 1
    return @

  year_increment: =>
    @attributes.year = parseInt(@attributes.year) + 1
    return @


  prepare_days: (month, year) =>
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

  set_days: () =>
    @set("days",  @prepare_days(@attributes.digit_month, @attributes.year))

  initialize: ->
    now = moment()
    @attributes.digit_month = now.format('MM')
    @attributes.month = now.format('MMMM')
    @attributes.year = now.format('YYYY')
    @attributes.current_day = now.format('DD')

    @set_days()

    return @


class Castle.Collections.CalendarsCollection extends Backbone.Collection
  model: Castle.Models.Calendar
  url: '/api/calendars'

$ ->
  set_time_picker= ->
    $("[data-behaviour~=timepicker]").timepicker
      timeFormat: 'hh:mm:ss'

  set_time_picker()

  $("#schedules").bind "cocoon:after-insert", ->
    set_time_picker()
$ = jQuery
$.fn.extend
  event: (options) ->
    settings =
      dateFormat:
        db: 'dd-mm-yy'


    settinges = $.extend settings, options
    return @each ()->
      $('#event_begin_date', this).datetimepicker
        numberOfMonths: 1,
        dateFormat: settings.dateFormat.db,
        changeMonth: true,
        changeYear: true
      $('#event_end_date', this).datetimepicker
        numberOfMonths: 1,
        dateFormat: settings.dateFormat.db,
        changeMonth: true,
        changeYear: true

$ ->
  $(document).event()
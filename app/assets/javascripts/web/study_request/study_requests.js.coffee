$ = jQuery
$.fn.extend
  study_request: (options) ->
    settings =
      dateFormat:
        db: 'dd-mm-yy'


    settinges = $.extend settings, options
    return @each ()->
      $('#study_request_birth_date', this).datepicker
        numberOfMonths: 1,
        dateFormat: settings.dateFormat.db,
        changeMonth: true,
        changeYear: true,
        yearRange: '1990:+0'


$ ->
  $(document).study_request()
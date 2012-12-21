// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require ckeditor/init
//= require jquery.ui.datepicker
//= require jquery.ui.datepicker-ru
//= require cocoon
//= require select2
//= require_self

(function($) { $(function() {

  $('.select2').select2();
  $('form').on('focusin', 'input.datepicker', function() {

    var
      min_year = $(this).attr('data-year-min'),
      max_year = $(this).attr('data-year-max'),
      min_date = min_year ? new Date(min_year, 0, 1) : null,
      max_date = max_year ? new Date(max_year, 11, 31) : null
      year_range = (min_year && max_year) ? min_year + ':' + max_year : null
    ;

    options = {
      defaultDate: max_date,
      minDate: min_date,
      maxDate: max_date,
      changeMonth: !!year_range,
      changeYear: !!year_range,
      yearRange: year_range
    }

    $(this).closest('form').off('focusin', 'input.datepicker');
    $(this).datepicker(options);
  });

  //$('.tab-pane').each(function() {

    //var id = $(this).attr('id'), link;
    //$(this).find('.error:first').each(function() {

      //link = $('a[href="#'+id+'"]');
      //if (! $('a.alert-error').length)
        //link.click();
      //link.addClass('alert-error');
    //});
  //});

})})(jQuery);

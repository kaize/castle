$ = jQuery
$.fn.extend
  study_request_select2: () ->
    select_common = $('#study_request_union_id')

    select2_params = () ->
      width: 'element'
      minimumInputLength: 0
      placeholder: 'Выберите объединение'

    select_common.select2(select2_params())

$ ->
  $(document).study_request_select2()
enable_button = ->
  if $('.select:checked').length > 0
    $('#order').prop 'disabled', false
  else
    $('#order').prop 'disabled', true

$ ->
  $('.check_all').change ->
    if $(this).is(':checked')
      $('.select').prop 'checked', true
      $('.check_all').prop 'checked', true
    else
      $('.select').prop 'checked', false
      $('.check_all').prop 'checked', false
    enable_button()

$ ->
  $('.select').change ->
    enable_button()
    
$ ->
  $('#datepicker').datepicker({ dateFormat: "yy-mm-dd", monthNames: [ "Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь" ], dayNamesMin: [ "Вс", "Пн", "Вт", "Ср", "Чт", "Пт", "Сб" ], firstDay: 1})
$(document).ready ->
  $("[name='check_all']").change ->
    if $(this).is(':checked')
      $(".select").prop("checked", true)
      $("[name='check_all']").prop("checked", true)
    else
      $(".select").prop("checked", false)
      $("[name='check_all']").prop("checked", false)
    return
  return
return


$ ->
  cloner = (element) ->
    if $(element).val() != ''
      $clone = $(element).clone().val('').attr('placeholder', $(element).attr('placeholder'))
      $(element).parent().append($clone)
      $clone.focus()
      $clone.blur ->
        cloner $(this)
  $('.being-name').blur ->
    cloner $(this)



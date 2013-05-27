

->
  $('.being-name').click ->
    console.log 'foo'
    $(this).parent().append($(this).clone())


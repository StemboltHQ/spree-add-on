$ ->
  $("#new-add-on-link").click (event)->
    event.preventDefault()

    $('.no-objects-found').hide()
    $(@).hide()

    $.ajax
      type: 'GET'
      url: @href
      data: (
        authenticity_token: AUTH_TOKEN
      )
      success: (r)->
        $('#new-add-on').html r



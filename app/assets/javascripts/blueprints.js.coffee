jQuery ->

  $("#new_discussion input.btn[type=submit]").click ->
    $(this).button('loading')


  $("#new_discussion").on "ajax:success", (e, data, status, xhr) ->
    console.log xhr.responseText
    response = JSON.parse(xhr.responseText)
    $("#new_discussion .control-group").removeClass('error')
    $("#new_discussion .control-group .controls span.help-inline").remove()

    # reseting form
    $("#new_discussion")[0].reset()

    # reload
    Turbolinks.visit(window.location)

  $("#new_discussion").on "ajax:error", (e, xhr, status, error) ->
    console.log xhr.responseText
    response = JSON.parse(xhr.responseText)

    for attribute, errors  of response.errors

      # adding error class
      $("#new_discussion .control-group.discussion_#{attribute}").addClass('error')

      # appending error text
      if $("#new_discussion .control-group.discussion_#{attribute} .controls span.help-inline").length > 0
        $("#new_discussion .control-group.discussion_#{attribute} .controls span.help-inline").html(errors[0])
      else
        $(".control-group.discussion_#{attribute} .controls").append("<span class=help-inline>#{errors[0]}</span>")

      # reseting button
      $("#new_discussion input.btn[type=submit]").button('reset')


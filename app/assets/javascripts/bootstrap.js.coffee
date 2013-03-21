jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $("#under-post-tab a").click (e) ->
    e.preventDefault()
    $(this).tab 'show'

  if res = window.location.hash.match(/(review|discussion)_(\d+)/i)
    $("#under-post-tab a[href='##{res[1]}s']").tab 'show'


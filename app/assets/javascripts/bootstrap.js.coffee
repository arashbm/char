jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $("#under-post-tab a").click (e) ->
    e.preventDefault()
    $(this).tab 'show'
  anc = window.location.hash


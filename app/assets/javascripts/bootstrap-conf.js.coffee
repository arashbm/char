jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()

  $('body').tooltip
    selector: "span.s-b-p"
    title: "فقط بعد از علائم سجاوندی فاصله بگذارید."
  $('body').tooltip
    title: "قبل از پرانتز بسته فاصله نگذارید."
    selector: "span.s-b-c-p"
  $('body').tooltip
    title: "بعد از پرانتز باز فاصله نگذارید."
    selector: "span.s-a-o-p"
  $('body').tooltip
    title: "از اعداد فارسی استفاده کنید."
    selector: "span.e-n"
  $('body').tooltip
    title: "از علائم نقل قول فارسی (« و ») استفاده کنید."
    selector: "span.e-q"


  $("#under-post-tab a").click (e) ->
    e.preventDefault()
    $(this).tab 'show'

  if res = window.location.hash.match(/(review|discussion)_(\d+)/i)
    $("#under-post-tab a[href='##{res[1]}s']").tab 'show'

  window.currentUser = $('#container').data('currentUser')

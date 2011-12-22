$ ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next>a').attr('href')
      console.log(url)
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 300
        $('.pagination').text("Загрузка ...")
        $.getScript(url)
    $(window).scroll()

  if history and history.pushState
    $("a").live "click", (e) ->
      $.getScript @href
      history.pushState null, document.title, @href
      e.preventDefault()

    $(window).bind "popstate", ->
      $.getScript location.href

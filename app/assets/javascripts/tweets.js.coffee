$ ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next>a').attr('href')
      console.log(url)
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 300
        $('.pagination').text("Загрузка ...")
        $.getScript(url)
    $(window).scroll()

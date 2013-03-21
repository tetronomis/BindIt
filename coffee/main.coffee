$(()->
  mx = null
  my = null

  $('#bindtempo').mousemove((e)->
    mx = e.pageX - this.offsetLeft
    my = e.pageY - this.offsetTop
    return)


  update_position = (x, y, animate = false) ->
    css = {left: x, top: y}
    if animate
      $('#bindtempo .round').animate(css, 800)
    else
      css.left += 'px'
      css.top += 'px'
      $('#bindtempo .round').css(css)
    return


  if true
    $('#bindtempo').mousemove((e)->
      update_position(mx - 10, my - 10)
      return)
  else
    $('#bindtempo').bindTempo('mousemove', 1000, (e)->
      update_position(mx - 10, my - 10, true)
      return)


  return)


$(()->
  render = (text) ->
    html = ''

    $.each(text, (index, value) ->
      key = Math.floor((Math.random() * 10) + 1)
      html += '<span class="t'+ key + '">' + value + '</span>'
      return)

    $('#bindsolo .output').html(html)

    return


  if true
    $('#bindsolo .input').bind('keyup', (e)->
      render($(this).val())
      return)
  else
    $('#bindsolo .input').bindSolo('keyup', 500, (e)->
      render($(this).val())
      return)


  return
)
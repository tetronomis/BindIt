bind_tempo = (bindit) ->
  mx = null
  my = null

  $('#bindtempo').unbind('mousemove')

  $('#bindtempo').mousemove((e)->
    mx = e.pageX - this.offsetLeft
    my = e.pageY - this.offsetTop
    return)

  update_position = (x, y, animate = false) ->
    css = {left: x, top: y}
    if animate
      $('#bindtempo .round').animate(css, 400)
    else
      css.left += 'px'
      css.top += 'px'
      $('#bindtempo .round').css(css)
    return

  unless bindit
    $('#bindtempo').mousemove((e)->
      update_position(mx - 10, my - 10)
      return)
  else
    $('#bindtempo').bindTempo('mousemove', 500, (e)->
      update_position(mx - 10, my - 10, true)
      return)

  return


bind_solo = (bindit) ->
  $('#bindsolo .input').unbind('keyup')

  render = (text) ->
    html = ''

    for c in text
      key = Math.floor((Math.random() * 10) + 1)
      html += '<span class="t' + key + '">' + c + '</span>'

    $('#bindsolo .output').html(html)

    return

  unless bindit
    $('#bindsolo .input').bind('keyup', (e)->
      render($(this).val())
      return)
  else
    $('#bindsolo .input').bindSolo('keyup', 500, (e)->
      render($(this).val())
      return)

  return


$(()->bind_tempo(false))
$(()->bind_solo(false))
$(()->$(':radio[name="bindtempo"]').change(()->bind_tempo($(this).val())))
$(()->$(':radio[name="bindsolo"]').change(()->bind_solo($(this).val())))
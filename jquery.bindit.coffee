###
BindIt - A jQuery plugin to bind events with delay
Copyright (c) 2013, Opteemo.
https://github.com/Opteemo/BindIt
###
(($) ->
  $.fn.bindTempo = (type, delay, fn) ->
    locked = false

    dfn = () ->
      call = () ->
        locked = false
        fn()
        return

      unless locked
        window.setTimeout(call, delay)
        locked = true
      return

    $(this).bind(type, dfn)
    return


  $.fn.bindSolo = (type, delay, fn) ->
    id = null

    dfn = () ->
      if id then window.clearTimeout(id)
      id = window.setTimeout(fn, delay)
      return

    $(this).bind(type, dfn)
    return
)(jQuery)
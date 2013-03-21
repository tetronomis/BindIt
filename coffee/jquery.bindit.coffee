###
BindIt - A jQuery plugin to bind events with delay
Copyright (c) 2013, Opteemo.
https://github.com/Opteemo/BindIt
###
(($) ->
  $.fn.bindTempo = (type, delay, fn) ->
    locked = false

    dfn = (event) ->
      element = this

      call = () ->
        locked = false
        fn.call(element, event)
        return

      unless locked
        window.setTimeout(call, delay)
        locked = true
      return

    $.each(this, (index, value)->
      $(value).bind(type, dfn)
      return)

    return


  $.fn.bindSolo = (type, delay, fn) ->
    id = null

    dfn = (event) ->
      element = this

      call = () ->
        fn.call(element, event)

      if id then window.clearTimeout(id)
      id = window.setTimeout(call, delay)
      return

    $.each(this, (index, value)->
      $(value).bind(type, dfn)
      return)

    return


)(jQuery)
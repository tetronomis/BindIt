BindIt
======

A jQuery plugin to bind events with delay.

Usage
-----

### $.bindTempo(type, delay, fn)

Useful for events triggered repeatedly such as `scroll` event or `mousemove` event.  
In this case, `fn` is called every `delay` milliseconds instead of every triggered event `type`.

``` javascript
$(window).bindTempo('mousemove', 1000, function() {
    $('body').append('Mouse is moving<br />');
})
```

### $.bindSolo(type, delay, fn)

Useful for the `fn` to call after `delay` once user completed an action such as typing or scrolling.

``` javascript
$('textarea').bindSolo('keyup', 1000, function() {
    $('body').append('Saving...<br />');
})
```
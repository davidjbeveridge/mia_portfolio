#= require vendor/jquery-1.9.1.min
#= require vendor/modernizr
#= require vendor/bootstrap
#= require vendor/respond
#= require_tree .

$(document).ready ->
  
  $body = $('html, body')
  $(document).on 'click', 'a[href^=#]', (e) ->
    e.preventDefault()
    target = this.hash
    $target = $(target)
    $body.stop().animate {scrollTop: $target.offset().top}, 'normal', 'swing', ->
      window.location.hash = target;
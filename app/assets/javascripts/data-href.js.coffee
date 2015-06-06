$(document).on "click", "[data-href]", (e) ->
  location.href = $(@).attr('data-href')
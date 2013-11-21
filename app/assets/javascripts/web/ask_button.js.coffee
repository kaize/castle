$ ->
  $("a#ask_question").on "mouseover", ->
    UE.Popin.preload()

  $("a#ask_question").on "click", ->
    UE.Popin.show()
    false
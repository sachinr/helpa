document.ready = (() ->
  sliders = $("select.slider")
  for slider in sliders
    $("#" + slider.id).selectToUISlider().hide()
)

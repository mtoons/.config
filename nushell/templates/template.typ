#import "@local/catppuccin:0.1.0": catppuccin, themes, get-palette
#let theme = sys.inputs.at("flavor", default: themes.mocha)
#show: catppuccin.with(theme)
#let palette = get-palette(theme)
#let colors = palette.colors

#set text(lang: "fr", font: "Cambria", size: 13pt)
#show heading: it => {
  show: text.with(font: "Cambria")
  show: align.with(center)
  it
}
#show link: it => underline(text(fill: colors.lavender.rgb, it))
#show raw: it => {
  set text(font: "Victor Mono", weight: "semibold")
  it
}
#show math.equation: set text(font: "Cambria Math")
#let vec(arg) = math.class(
  "normal",
  math.accent(arg, math.arrow),
)

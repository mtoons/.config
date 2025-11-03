#import "@preview/catppuccin:1.0.0": catppuccin, flavors
#import "@preview/cetz:0.4.2": canvas, draw
#import "@local/cetz-plot:18.0.0": plot
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "@preview/physica:0.9.6": *
#let impression = false
#let flavor = if impression {
  flavors.latte
} else {
  flavors.mocha
}
#show: if impression {
  it => {
    it
  }
} else {
  catppuccin.with(flavor)
}
#let colors = flavor.colors

#set text(lang: "fr", font: "Noto Sans", size: 13pt)
#set page(numbering: "1/1", number-align: right + bottom)
#show heading: it => {
  show: text.with(font: "Jellee")
  show: align.with(center)
  it
}
#show link: it => underline(text(fill: colors.lavender.rgb, it))
#show raw: it => {
  set text(font: "Victor Mono", weight: "semibold")
  it
}
#show math.equation: set text(font: "Noto Sans Math")
#show math.equation.where(block: false): it => math.display(it)
#let high(string) = text(string, fill: colors.rosewater.rgb)
#let und(string) = underline(
  string,
  background: true,
  stroke: if impression {
    black
  } else {
    colors.sky.rgb
  },
)
#let ptree(..args, scale: 1) = {
  let ptree-recurse(array, scale: 1) = {
    let objects = array.enumerate()
    let nodes = ()
    let edges = ()
    let len = array.len()
    if len == 0 {
      return ()
    }
    for (i, obj) in objects {
      let y = i - (len / 2) + 0.5
      y *= scale
      y /= len
      nodes.push(node((1, y), obj.first()))

      edges.push(
        edge(
          (0, 0),
          (1, y),
          label: obj.at(1),
          label-side: center,
          label-fill: none,
        ),
      )
      let sub = ()
      if obj.len() > 2 {
        sub = obj.slice(2, obj.len())
        let childs = ptree-recurse(sub, scale: scale)
        let child_nodes = childs.at("nodes")
        let child_edges = childs.at("edges")
        for nd in child_nodes {
          let (cx, cy) = nd.value.pos.at("raw")

          cy /= len
          let content = nd.value.label
          nodes.push(node((cx + 1, y + cy), content))
        }
        for ed in child_edges {
          let (start, end) = ed.value.vertices
          let (ex, ey) = end
          let (sx, sy) = start
          sy /= len
          ey /= len
          edges.push(
            edge(
              (start.first() + 1, y + sy),
              (ex + 1, y + ey),
              ed.value.label,
              label-side: center,
              label-fill: none,
            ),
          )
        }
      }
    }
    (
      nodes: nodes,
      edges: edges,
    )
  }
  if args.named().len() > 0 {
    error("Unexpected named argument(s) #..0.", args.named().keys())
  }
  let objects = args.pos()
  let (nodes, edges) = ptree-recurse(objects, scale: scale)
  diagram(
    nodes,
    edges,
  )
}
#let dsv(..args) = {
  let objs = args.pos()
  assert(objs.len() == 3)

  table(
    columns: objs.at(0).len() * 2,
    align: center,
    objs.at(0).at(0),
    table.cell($-oo$, align: left),
    ..for (i, num) in objs.at(0).enumerate() {
      if i > 0 {
        (num,)
        if i < objs.at(1).len() - 2 {
          ([],)
        }
      }
    },
    table.cell($+oo$, align: right),

    objs.at(1).at(0),
    ..for (i, sign) in objs.at(1).enumerate() {
      if i > 0 {
        (sign,)
        if i < objs.at(1).len() - 1 {
          ($0$,)
        }
      }
    },
    objs.at(2).at(0),
    ..for (i, sign) in objs.at(1).enumerate() {
      if i > 0 {
        if sign.body.text == "−" {
          (sym.arrow.br,)
        }
        if sign.body.text == "+" {
          (sym.arrow.tr,)
        }
        if i < objs.at(1).len() - 1 {
          (objs.at(2).at(i),)
        }
      }
    },
  )
}

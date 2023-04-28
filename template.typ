#let photo_scale = 5;
#let photo_width = 295pt / photo_scale;
#let photo_height = 413pt / photo_scale;

#let progressbar(rating, width: 100pt, height: 10pt, bar_color: rgb("#9BFF93"), bg_color: rgb("#E2E2E2")) = {
    let radius = height / 2;
    let progress_width = width * rating;
    let bg_width = width * (1 - rating);
    let progress = rect(
      width: progress_width,
      height: height,
      radius: (
        top-left: radius,
        bottom-left: radius
      ),
      fill: bar_color,
      stroke: (
        right: none,
        rest: 1pt
      )

    );
    let bg = rect(
      width: bg_width,
      height: height,
      radius: (
        top-right: radius,
        bottom-right: radius
      ),
      fill: bg_color,
      stroke: (
        left: none,
        rest: 1pt
      )
    )
    stack(
      dir: ltr,
      progress, bg
    )
}



#let icon(name, shift: 1.5pt) = {
  box(
    baseline: shift,
    height: 15pt,
    image(name)
  )
  h(3pt)
}

#let followMe(name, services) = {
  [=#name \ ]

  set text(10pt)
  let icon = icon.with(shift: 3pt)

  show link: it => {
    let rect = rect.with(stroke: rgb("#B3FFFF"))
    box(
      rect[#it.body]
    )
  }

  services.map(service => {
      icon(service.name)
      if "display" in service.keys() {
        if "link" in service.keys() {
          link(service.link)[#service.display]
        }else{
          [#service.display]
        }
      }else{
        link(service.link)    
      }
    }
  ).join([ \ ])
}

#let skill(talents: ()) = {
  let talent(name, rating) = {
    name
    h(1fr)
    box(progressbar(rating))
  }

  talents.sorted(key: val => val.at(1))
         .rev()
         .map(
          val => {talent(val.at(0), val.at(1))}
        ).join([ \ ])

}



#let profile(photo: "", name: "", services:(), talents: ()) = {
  set text(12pt, weight: "bold")

  grid(
    columns: (0.2fr, 0.39fr, 0.39fr),
    gutter: 50pt,
    image(photo, width: 295pt / 4, height: 413pt / 4),
    followMe(name, services),
    // skill(talents: talents)
  )
}

#let entry() = {
  set text(9.8pt, font: "IBM Plex Sans")
  set page(
    margin: (x: 54pt, y: 52pt),
  )

  show heading.where(
    level: 2
  ) : it => text[
    #{it.body}
    #v(-7pt)
    #line(length: 100%)
  ]

  profile(
    photo: "SpongeBob SquarePants.png",
    name : "SpongeBob SquarePants",
    services: (
      (name: "github.svg", link: "https://github.com/gvariable", display: "github/gvariable"),
      (name: "wechat.svg", link: "gplhust@hust.edu.cn", display: "gplhust@hust.edu.cn"),
      (name: "iphone.svg", display: "(+86)13080331518"),
    ),
    talents: (
      ("Python", 0.66),
      ("Rust", 0.73),
      ("C++", 0.85),
    )
  )

  [
    == Education
    === heading3
    ==== heading4
  ]
}

#entry()
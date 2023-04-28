#let photo_scale = 5;
#let photo_width = 295pt / photo_scale;
#let photo_height = 413pt / photo_scale;

#set document(title: "CV template", author: "gvariable")

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



#let icon(name, shift: 1.5pt, height: 15pt) = {
  box(
    baseline: shift,
    height: height,
    image(name)
  )
  h(3pt)
}

#let followMe(name, services) = {
  [= #name \ ]

  set text(10pt)
  let icon = icon.with(shift: -1pt, height: 12pt)

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
    grid(
      columns: (1fr, auto),
      column-gutter: 5pt,
      align(right)[#name],
      align(left)[#box(progressbar(rating))]
    )
  }

  [
    #linebreak()
    #set block(spacing: 0.5pt)
    #{talents.sorted(key: val => val.at(1))
          .rev()
          .map(
            val => {talent(val.at(0), val.at(1))}
          ).join([ \ ])
    }
  ]
}

#let date(period) = {
  icon("calendar.svg", height: 10pt) 
  period
}

#let location(loc) = {
  icon("location.svg", height: 10pt)
  loc
}


#let term(period, postion) = {
  
  set text(9pt)
  h(1fr)
  date(period)
  h(10pt)
  location(postion)

}

#let profile(photo: "", name: "", services:(), talents: ()) = {
  set text(12pt, weight: "bold")

  grid(
    columns: (0.2fr, 0.39fr, 0.39fr),
    gutter: 50pt,
    image(photo, width: 295pt / 4, height: 413pt / 4),
    followMe(name, services),
    align(right)[#skill(talents: talents)]
  )
}

#let entry() = {
  set text(9.8pt, font: "IBM Plex Sans")
  set page(
    margin: (x: 54pt, y: 52pt),
  )

  show "Brief Introduction": it => {
    [*#it*]

  }

  set list(indent: 4pt)

  show heading.where(
    level: 2
  ) : it => block[
    #set text(12pt, font: "Inria Serif")
    #set align(left)
    #emph(it.body)
    #v(-7pt)
    #line(length: 100%)
  ]

  profile(
    photo: "SpongeBob SquarePants.png",
    name : "gvariable",
    services: (
      (name: "github.svg", link: "https://github.com/gvariable", display: "github/gvariable"),
      (name: "wechat.svg", link: "gplhust@hust.edu.cn", display: "gplhust@hust.edu.cn"),
      (name: "iphone.svg", display: "(+86)13xxxxxxxx"),
      (name: "linkedin.svg", link: "http://linkedin.cn/", display: "linkedin/gvariable")
    ),
    talents: (
      ("Python", 0.66),
      ("Rust", 0.73),
      ("C++", 0.85),
      ("Linux", 0.43),
    )
  )

  [ 
    == #icon("graduation-cap.svg") EDUCATION
    / Huazhong University of Science and Technology\: : Undergraduate student. #term("2019 - 2023", "Wuhan,China")
    / Nan Jing University\: : Ph.D. student. #term("2023 - unknown", "Nanjing,China")
    #lorem(150)
    == #icon("users.svg") EXPERIENCE
    / Intel Inc.: #term("2022 - 2023", "Beijing,China")
    _Intern_  Manager: SpongeBob SquarePants \
    Brief Introduction: #lorem(30)
    - Implemented #lorem(10) 
    - Optimized #lorem(15) 
    - #lorem(10)

    / xxx Project.: #term("2020 - 2021", "Wuhan,China")
    _C, Python, Rust_ Individual Projects. \
    Brief Introduction: #lorem(30)
    - Implemented #lorem(10) 
    - Optimized #lorem(15) 
    - #lorem(10)
    == #icon("award.svg") HONORS AND AWARDS
    - _$1^("st")$ Prize_, Award on xxx
    - _National Scholarship_ in 2019
    - More awards 
    == #icon("info.svg") MISCELLANEOUS
    #lorem(50)
  ]
}

#entry()
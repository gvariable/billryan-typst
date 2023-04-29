#let photo_scale = 5;
#let photo_width = 295pt / photo_scale;
#let photo_height = 413pt / photo_scale;
#let bounding_box_height = 10pt;
#let box_shift = 1.5pt;
#let image_path = "images/";

#set document(title: "CV template", author: "gvariable")

#let progressbar(rating, width: 120pt, height: 12pt, bar_color: rgb("#9BFF93"), bg_color: rgb("#E2E2E2")) = {
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
    image(image_path + name)
  )
  h(3pt)
}

#let followMeAndSkill(name, services, talents) = {
  set text(10pt)
  let icon = icon.with(shift: -1pt, height: bounding_box_height)
  let progressbar = progressbar.with(width: bounding_box_height * 15, height: bounding_box_height)

  let talent(name, rating) = {
    align(right)[#name #h(3pt) #box(baseline: 1.5pt, progressbar(rating))]
  }

  let talents = talents.sorted(key: val => val.at(1))
                      .rev()
                      .map(
                        val => {talent(val.at(0), val.at(1))}
                      ).join([ \ ]);

  let services = services.map(service => {    
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

  align(left)[= #name \ ]

  grid(
    columns: (1fr, 1.5fr, 0.3fr),
    gutter: 15pt,
    services,
    talents
  )

}

#let followMe(name, services) = {
  [= #name \ ]

  set text(10pt)
  let icon = icon.with(shift: -1pt, height: bounding_box_height)

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
      align(left)[#box(progressbar(rating, height: bounding_box_height))]
    )
  }

  [
    #linebreak()
    #linebreak()
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
  
  // set text(9pt)
  // h(1fr)
  // date(period)
  // h(10pt)
  // location(postion)
  box[
      #date(period)
      #h(10pt)
      #location(postion)
  ]

}

#let profile(photo: "", name: "", services:(), talents: ()) = {
  set text(12pt, weight: "medium")
  set block(spacing: 1pt)

  grid(
    columns: (photo_width, auto),
    column-gutter: 10pt,
    image(photo, width: photo_width, height: photo_height),
    followMeAndSkill(name, services, talents)
  )

}

#let conf(photo: "", name : "", services: (), talents: (), tagline:[],  body: []) = {
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
    #v(-10pt)
    #line(length: 100%)
  ]

  show link: it => {
    let rect = rect.with(stroke: rgb("#B3FFFF"))
    box(
      height: bounding_box_height,
      rect(inset: (y: 1pt), outset: (y: 2pt))[#underline(it.body)]
    )
  }

  profile(
    photo: photo,
    name : name,
    services: services,
    talents: talents
  )
  
  body
}
#let photo_scale = 5;
#let photo_width = 295pt / photo_scale;
#let photo_height = 413pt / photo_scale;
#let bounding_box_height = 1.1em;
#let box_shift = 1.5pt;
#let image_path = "images/";
#let body_text_font = "IBM Plex Sans";
#let body_text_size = 10pt;


// document meta data
#set document(title: "resume template", author: "gvariable")

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


#let icon(name, shift: 1.5pt, height: bounding_box_height) = {
  box(
    baseline: shift,
    height: height,
    image(image_path + name)
  )
  h(3pt)
}

#let meta(name, services, talents) = {

  set text(10pt)
  let icon = icon.with(shift: -1pt)
  let progressbar = progressbar.with(width: bounding_box_height * 15, height: bounding_box_height)
  // skills
  let talent(name, rating) = {
    align(right)[#name #h(3pt) #box(baseline: 1.5pt, progressbar(rating))]
  }

  let talents = talents.sorted(key: val => val.at(1))
                      .rev()
                      .map(
                        val => {talent(val.at(0), val.at(1))}
                      ).join([ \ ]);
  // medias
  let services = services.map(service => {    
      icon(service.name)
      if "display" in service.keys() {
        if "link" in service.keys() {
          link(service.link)[#service.display]
        }else{
          box(baseline: -3pt)[#service.display]
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

#let date(period) = {

  icon("calendar.svg") 
  period
  
}

#let location(loc) = {
  icon("location.svg")
  loc
}

#let term(period, postion) = {

  box(width: 1fr)[
    #align(right)[
      #date(period)
      #h(1em)
      #location(postion)]
  ]

}

#let profile(photo: "", name: "", services:(), talents: ()) = {
  set text(12pt, weight: "medium")
  set block(spacing: 1pt)

  grid(
    columns: (photo_width, auto),
    column-gutter: 10pt,
    image(photo, width: photo_width, height: photo_height),
    meta(name, services, talents)
  )

}

#let conf(photo: "", name : "", services: (), talents: (), tagline:[],  body: []) = {
  set text(body_text_size, font: body_text_font)
  set page(
    margin: (x: 5em, y: 4em),
  )

  set align(left + top)

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
      rect(inset: (y: 1pt), outset: (y: 2pt))[#underline(it)]
    )
  }

  profile(
    photo: photo,
    name : name,
    services: services,
    talents: talents
  )
  
  [
    #v(1em)
    tags: #tagline
    \
    #body
  ]
}
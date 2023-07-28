#import "template.typ": *

#show: doc => conf(
    // Your personal photo.
    photo: "SpongeBob SquarePants.png",
    // Your name.
    name: "gvariable",
    // Information regarding your social media accounts.
    // The "display" parameter is required, whereas the "link" parameter is optional.
    medias: (
        (name: "github.svg", link: "https://github.com/gvariable", display: "github/gvariable"),
        (name: "envelope.svg", link: "gplhust@hust.edu.cn", display: "gplhust@hust.edu.cn"),
        (name: "square-phone.svg", display: "(+86)130-1111-4514"),
        (name: "linkedin.svg", link: "http://linkedin.cn/", display: "linkedin/gvariable"),
    ),
    // The skills you possess.
    talents: (
        ("Python", 0.66),
        ("Rust", 0.73),
        ("C++", 0.85),
        ("Linux", 0.43),
    ),
    // Job interests tags.
    tagline: [
        _Software engineering, Operating system, Compiler, Software testing and debugging._
    ],
    // main body
    body: doc
)

// --------------------------- MAIN DOC BODY HERE --------------------------- //

== #icon("graduation-cap.svg") EDUCATION
/ Huazhong University of Science and Technology\: : Undergraduate student.  #term("2019 - 2023", "Wuhan,China")
/ Nan Jing University\: : Ph.D. student.                                    #term("2024- who knows", "Nanjing,China")
#lorem(10)                                                                  
#lorem(15)                                                                  
== #icon("users.svg") EXPERIENCE
/ Intel Inc.: Software engineer                                             #box(width: 1fr)[#align(right)[#date("2022 - 2023")]]
_Intern_ | Manager: SpongeBob SquarePants \
Brief Introduction: #lorem(30)
- Implemented #lorem(10) 
- Optimized #lorem(15) 
- #lorem(10)
- #lorem(40)

/ xxx Project.: Software testing and debuging                               #box(width: 1fr)[#align(right)[#date("2022 - 2023")]]
_C, Python, Rust_ | Individual Projects. \
Brief Introduction: #lorem(30)
- Implemented #lorem(10) 
- Optimized #lorem(15) 
- #lorem(20)
== #icon("award.svg") HONORS AND AWARDS
- _1#super[st] Prize_, Award on xxx #box(height: 1em, width: 1fr)[#align(right)[#location("London,UK")]]
- _National Scholarship_ in 2019
- More awards 
== #icon("info.svg") MISCELLANEOUS
#lorem(50)
#lorem(30)


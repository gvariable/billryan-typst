#import "template.typ": *

#show: doc => conf(
    photo: "SpongeBob SquarePants.png",
    name: "gvariable",
    services: (
        (name: "github.svg", link: "https://github.com/gvariable", display: "github/gvariable"),
        (name: "mail.svg", link: "gplhust@hust.edu.cn", display: "gplhust@hust.edu.cn"),
        (name: "iphone.svg", display: "(+86)13xxxxxxxx"),
        (name: "linkedin.svg", link: "http://linkedin.cn/", display: "linkedin/gvariable"),
    ),
    talents: (
        ("Python", 0.66),
        ("Rust", 0.73),
        ("C++", 0.85),
        ("Linux", 0.43),
    ),
    tagline: [],
    body: doc
)

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
- _1#super[st] Prize_, Award on xxx
- _National Scholarship_ in 2019
- More awards 
== #icon("info.svg") MISCELLANEOUS
#lorem(50)


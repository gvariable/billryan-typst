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
        _软件工程, 操作系统, 编译器, 软件测试与调试._
    ],
    // main body
    body: doc
)

// --------------------------- MAIN DOC BODY HERE --------------------------- //

== #icon("graduation-cap.svg") 教育背景
/ 华中科技大学\: : 本科生.  #term("2019 - 2023", "中国武汉")
/ 南京大学\: : 博士生.                                    #term("2024- 未知", "中国南京")
#lorem(10)                                                                  
#lorem(15)                                                                  
== #icon("users.svg") 项目经历
/ Intel公司 : 软件工程师                                             #box(width: 1fr)[#align(right)[#date("2022 - 2023")]]
_实习生_ | 项目经理: 海绵宝宝 \
简介: #lorem(30)
- 实现了xxxxxxxxxxxxxxxxxxx
- 优化了xxxxxxxxxxxxxxxxxxx
- 得出了xxxxxxxxxxxxxxxxxxx

/ xxx 项目 : 软件测试与调试                               #box(width: 1fr)[#align(right)[#date("2022 - 2023")]]
_C, Python, Rust_ | 个人项目 \
简介: #lorem(30)
- 实现了xxxxxxxxxxxxxxxxxxx
- 优化了xxxxxxxxxxxxxxxxxxx
- 得出了xxxxxxxxxxxxxxxxxxx
== #icon("award.svg") 获奖情况
- xxx黑客松一等奖🥇 #box(height: 1em, width: 1fr)[#align(right)[#location("英国伦敦")]]
- 国家奖学金
- ICPC铜牌🥉 
== #icon("info.svg") 其他
- xxx学生社团队长
- xxx组织管理人员


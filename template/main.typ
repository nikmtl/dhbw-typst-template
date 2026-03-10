#import "acronyms.typ": *
#import "@local/dhbw-typst-template:0.1.0": dhbw-typst-template

#let title = "A very informative title, that might even span multiple lines if it is long enough"
#let author = "Jhon Doe"
#let project = "for the 03. Semester (T4_2000)"
#let project-type = "Project Thesis"
#let course = "Applied Computer Science"
#let mat-number = "123456"
#let course-acronym = "ABC123"
#let university = "Baden-Wuerttemberg Cooperative State University Mannheim"
#let completion-period = "Mon - Mon YYYY"
#let submission-date = datetime(year: 2000, month: 1, day: 1)
#let place-of-authorship = "New York"
#let supervisor = "John Doe"
#let company = "Your Company GmbH"
#let company-location = "New York"
#let bib = ""

#let dhbw_logo = image("resources/dhbw-logo.jpg")
#let company_logo = image("resources/company-logo.png", width: 20%)

#let confidentiality-notice = true

#show: dhbw-typst-template.with(
  title: title,
  project: project,
  project-type: project-type,
  course: course,
  mat-number: mat-number,
  course-acronym: course-acronym,
  place-of-authorship: place-of-authorship,
  author: author,
  completion-period: completion-period,
  submission-date: submission-date,
  supervisor: supervisor,
  company: company,
  company-location: company-location,
  university: university,
  university-logo: dhbw_logo,
  acronym-list: glossary-list,
  figure-gap-above: 0.5em,
  figure-gap-under: 0.5em,
  text-lang: "de",
  company-logo: company_logo,
  confidentiality-notice: confidentiality-notice,
  path-to-abstract: "../template/chapters/abstract.typ",
  // bib: bib,
)

// Keep the content in the chapters folder and only include the files here.
// For example:
#include "chapters/introduction.typ"
//
// #include "chapters/fundamentals.typ"
//
// #include "chapters/main-part.typ"
//
// #include "chapters/summary.typ"

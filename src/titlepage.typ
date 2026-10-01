#let titlepage(
  title: [],
  author: [],
  course: [],
  mat-number: [],
  course-acronym: [],
  completion-period: [],
  submission-date: datetime,
  company-location: [],
  project: [],
  project-type: [],
  supervisor: [],
  university-supervisor: [],
  company: [],
  functional-integrated: [],
  university: [],
  company-logo: [],
  university-logo: [],
  text-lang: [],
  title-font: auto,
) = {
  set par(leading: 1.5em)

  // `author` and `mat-number` may be a single value or an array (multiple authors).
  let authors = if type(author) == array { author } else { (author,) }
  let mat-numbers = if type(mat-number) == array { mat-number } else { (mat-number,) }
  let multi = authors.len() > 1

  let cover(source) = {
    set image(height: 2cm, fit: "contain")
    source
  }

  let texts = if text-lang == "en" {
    (
      project-course-line: [#project \ of Degree Course *#course* \ at #university],
      by-line: [by \ ],
      completion-label: [*Completion Period*],
      student-label: if multi { [*Student IDs*] } else { [*Student ID*] },
      course-label: [*Course*],
      partner-label: [*Cooperation Partner*],
      functional-integrated-label: [*Functionally Integrated at*],
      supervisor-label: [*Company Supervisor*],
      supervisor-signature-label: [*Signature Supervisor*],
      university-supervisor-label: [*University Supervisor*],
    )
  } else {
    (
      project-course-line: [#project \ des Studienganges *#course* \ an der #university],
      by-line: [von \ ],
      completion-label: [*Bearbeitungszeitraum*],
      student-label: if multi { [*Matrikelnummern*] } else { [*Matrikelnummer*] },
      course-label: [*Kurs*],
      partner-label: [*Dualer Partner*],
      functional-integrated-label: [*Funktional Integriert bei*],
      supervisor-label: [*Betrieblicher Betreuer*],
      supervisor-signature-label: [*Unterschrift Betreuer*],
      university-supervisor-label: [*Gutachter der DHBW*],
    )
  }

  v(-1cm)

  align(top, block(
    width: 100%,
    inset: (x: -0.5cm),
  )[
    #if company-logo != [] {
      stack(
        dir: ltr,
        align(left, cover(company-logo)),
        align(right, cover(university-logo)),
      )
    } else {
      // no company logo: center the university logo
      align(center, cover(university-logo))
    }
  ])

  v(4em)

  set align(center)

  project-type

  v(2em)

  par(leading: 1em, text(24pt, font: title-font)[*#title*])

  v(2em)

  texts.project-course-line

  v(1.5em)

  texts.by-line
  text(15pt)[*#authors.join([ \ ])*]

  v(1.5em)
  submission-date

  v(2em)

  set rect(width: 100%, inset: 0.5em)

  let parsed = ()
  let partner-row = ()

  if functional-integrated != [] {
    parsed.push(texts.functional-integrated-label)
    parsed.push(functional-integrated)
  }

  if supervisor != [] {
    parsed.push(texts.supervisor-label)
    parsed.push(supervisor)
    parsed.push([#align(left + bottom, texts.supervisor-signature-label)])
    parsed.push(box(width: 100%, height: 1.5em)[#align(left + bottom, line(length: 100%, stroke: 0.4pt))])
  }

  if company != [] {
    partner-row.push(texts.partner-label)
    partner-row.push(par(justify: true)[#company, #company-location])
  }

  if university-supervisor != [] {
    parsed.push(texts.university-supervisor-label)
    parsed.push(university-supervisor)
  }

  // One grid row per author ID, so the spacing between all lines is identical.
  let id-rows = if multi and mat-numbers.len() == authors.len() {
    authors.enumerate().map(((i, a)) => (
      if i == 0 { texts.student-label } else { [] },
      [#a: #mat-numbers.at(i)],
    )).flatten()
  } else {
    (texts.student-label, mat-numbers.join(", "))
  }

  align(left + bottom, grid(
    columns: (1fr, 1fr),
    align: left + top,
    inset: 0.5em,
    [
      #texts.completion-label
    ],
    [
      #completion-period
    ],
    ..id-rows,
    texts.course-label,
    course-acronym,
    ..partner-row,
    ..parsed,
  ))
}

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
) = {
  set par(leading: 1.5em)

  let cover(source) = {
    set image(height: 2cm, fit: "contain")
    source
  }

  let texts = if text-lang == "en" {
    (
      project-course-line: [#project \ of Degree Course *#course* \ at #university],
      by-line: [by \ ],
      completion-label: [*Completion Period*],
      student-course-label: [*Student ID*, *Course*],
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
      student-course-label: [*Matrikelnummer*, *Kurs*],
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
    #stack(
      dir: ltr,
      if company-logo != [] {
        align(left, cover(company-logo))
      },
      align(right, cover(university-logo)),
    )
  ])

  v(4em)

  set align(center)

  project-type

  v(2em)

  par(leading: 1em, text(24pt)[*#title*])

  v(2em)

  texts.project-course-line

  v(1.5em)

  texts.by-line
  text(15pt)[*#author*]

  v(1.5em)
  submission-date

  v(2em)

  set rect(width: 100%, inset: 0.5em)

  let parsed = ()

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

  if university-supervisor != [] {
    parsed.push(texts.university-supervisor-label)
    parsed.push(university-supervisor)
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
    [
      #texts.student-course-label
    ],
    [
      #mat-number, #course-acronym
    ],
    [
      #texts.partner-label
    ],
    [
      #par(justify: true)[#company, #company-location]
    ],
    ..parsed,
  ))
}

#let confidentiality_notice(
  title: [],
  company: [],
  university: [],
  date: none,
  place-of-authorship: [],
  author: [],
  lang: "de",
) = {
  set par(leading: 1em)
  let notice-title = if lang == "en" {
    "Confidentiality Notice"
  } else {
    "Sperrvermerk"
  }

  let date-text = if date == none {
    ""
  } else {
    datetime.display(date, "[day].[month].[year]")
  }

  let place-date = if place-of-authorship != [] and date-text != "" {
    [#place-of-authorship, #date-text]
  } else if place-of-authorship != [] {
    place-of-authorship
  } else {
    date-text
  }

  let access-clause = if lang == "en" {
    [This project report #v(1em) #align(center, title) #v(1em) contains internal and confidential data of #company. It is intended exclusively for inspection by the assigned examiner, the head of department, and, if required, the examination board at #university. It is prohibited to]
  } else {
    [Die vorliegende Projektarbeit #v(1em) #align(center, title) #v(1em) enthält interne bzw. vertrauliche Daten der #company. Sie ist ausschliesslich zur Einsicht durch den zugesandten Prüfer, den Leiter des Fachbereichs und, falls notwendig, den Prüfungsausschuss an der #university bestimmt. Es ist strengstens verboten]
  }

  let disclosure-clause = if lang == "en" {
    [distribute or disclose the content of this work, including data, figures, tables, diagrams, etc., in whole or in part.]
  } else {
    [den Inhalt dieser Arbeit, einschliesslich Daten, Abbildungen, Tabellen, Diagrammen etc., ganz oder in Auszügen zu verbreiten.]
  }

  let copies-clause = if lang == "en" {
    [make copies or transcripts of this work or parts of it.]
  } else {
    [Kopien oder Abschriften dieser Arbeit oder von Teilen davon anzufertigen.]
  }

  let digital-clause = if lang == "en" {
    [distribute or make this work available in digital, electronic, or virtual form.]
  } else {
    [diese Arbeit in digitaler, elektronischer oder virtueller Form zu verbreiten oder zugänglich zu machen.]
  }

  let exception-clause = if lang == "en" {
    [Exceptions require the written permission of the author and #company.]
  } else {
    [Ausnahmefälle bedürfen der schriftlichen Genehmigung des Autors und der #company.]
  }


  [
    #set heading(outlined: false)
    #set par(justify: true)

    = #notice-title

    #access-clause
    #v(1em)
    - #disclosure-clause
    #v(0.5em)
    - #copies-clause
    #v(0.5em)
    - #digital-clause

    #v(1em)
    #exception-clause

    #v(3em)
    #place-date

    #v(4em)
    #line(length: 14em, stroke: 0.5pt)
    #author

  ]
}

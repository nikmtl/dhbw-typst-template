#let declaration(
  title: [],
  author: [],
  project: [],
  project-type: [],
  place-of-authorship: [],
  date: [],
  lang: [],
) = {
  set align(left)
  set par(leading: 1em)

  // `author` may be a single value or an array (multiple authors).
  let authors = if type(author) == array { author } else { (author,) }
  let multi = authors.len() > 1
  let signatures = grid(
    columns: (14em,) * authors.len(),
    column-gutter: 2em,
    row-gutter: 0.5em,
    ..authors.map(_ => line(length: 100%, stroke: 0.5pt)),
    ..authors,
  )

  if lang == "en" {
    set text(lang: "en")
    [


      #heading("Declaration", outlined: false)
      #set par(justify: true)

      #block(stroke: 0.5pt, inset: 1em)[

        #if multi [We hereby declare that we have] else [I hereby declare that I have] written this paper on the topic "#title" independently and that #if multi [we have] else [I have] used no sources or aids other than those indicated. #if multi [We] else [I] also declare that #if multi [we have] else [I have] not submitted this paper for any other examination with the same or comparable content and that it has not yet been published.

        #v(1em)

        #if multi [We have] else [I have] used AI tools as aids in the preparation of this paper. The tools used and their respective purposes are fully listed in the AI Acknowledgement at the end of the paper.

        #v(1em)

        Furthermore, #if multi [we] else [I] declare that the submitted electronic version corresponds to the printed version.#footnote[If both versions are required.]

        #v(5em)

        #place-of-authorship, #datetime.display(date, "[month repr:long] [day], [year]")

        #v(4em)

        #signatures
      ]
    ]
  } else {
    set text(lang: "de")
    [
      #heading("Erklärung", outlined: false)
      #set par(justify: true)

      #block(stroke: 0.5pt, inset: 1em)[
        #if multi [Wir versichern] else [Ich versichere] hiermit, dass #if multi [wir] else [ich] die vorliegende Arbeit mit dem Thema "#title" selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel verwendet #if multi [haben] else [habe] und diese Arbeit bei keiner anderen Prüfung mit gleichem oder vergleichbarem Inhalt vorgelegt #if multi [haben] else [habe] und diese bislang nicht veröffentlich wurde.

        #v(1em)

        #if multi [Wir haben] else [Ich habe] bei der Erstellung der Arbeit KI-Werkzeuge als Hilfsmittel eingesetzt. Die verwendeten Werkzeuge und ihre jeweiligen Einsatzzwecke sind im AI-Acknowledgement am Ende der Arbeit vollständig aufgeführt.
        

        #v(1em)

        Des Weiteren #if multi [versichern wir] else [versichere ich], dass die eingereichte elektronische Fassung mit der gedruckten Ausfertigung übereinstimmt.#footnote[Falls beide Fassungen gefordert sind.]


        #v(6em)

        #place-of-authorship, den #datetime.display(date, "[day].[month].[year]")

        #v(4em)

        #signatures
      ]
    ]
  }
}

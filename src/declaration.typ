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

  if lang == "en" {
    set text(lang: "en")
    [


      #heading("Declaration", outlined: false)
      #set par(justify: true)

      #block(stroke: 0.5pt, inset: 1em)[

        I hereby declare that I have written this paper on the topic "#title" independently and that I have used no sources or aids other than those indicated. I also declare that I have not submitted this paper for any other examination with the same or comparable content and that it has not yet been published.

        #v(1em)

        Furthermore, I declare that the submitted electronic version corresponds to the printed version.#footnote[If both versions are required.]

        #v(6em)

        #place-of-authorship, #datetime.display(date, "[month repr:long] [day], [year]")

        #v(4em)

        #line(length: 14em, stroke: 0.5pt)

        #v(2em)

        #author
      ]
    ]
  } else {
    set text(lang: "de")
    [
      #heading("Erklärung", outlined: false)
      #set par(justify: true)

      #block(stroke: 0.5pt, inset: 1em)[
        Ich versichere hiermit, dass ich die vorliegende Arbeit mit dem Thema "#title" selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel verwendet habe und diese Arbeit bei keiner anderen Prüfung mit gleichem oder vergleichbarem Inhalt vorgelegt habe und diese bislang nicht veröffentlich wurde.

        #v(1em)

        Des Weiteren versichere ich, dass die eingereichte elektronische Fassung mit der gedruckten Ausfertigung übereinstimmt.#footnote[Falls beide Fassungen gefordert sind.]


        #v(6em)

        #place-of-authorship, den #datetime.display(date, "[day].[month].[year]")

        #v(4em)

        #line(length: 14em, stroke: 0.5pt)

        #v(.5em)

        #author
      ]
    ]
  }
}

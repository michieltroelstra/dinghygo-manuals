// ─────────────────────────────────────────────
// DinghyGo Betriebsanleitung — Vollständige Anleitung
// Orca 280 · Orca 325 · Orca 375
// v5.0 Mai 2026
// ─────────────────────────────────────────────

#set document(
  title: "DinghyGo Betriebsanleitung",
  author: "Aquacrafts B.V.",
)

#set page(
  paper: "a4",
  margin: (top: 25mm, bottom: 25mm, left: 22mm, right: 22mm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(8pt, gray)[DinghyGo Betriebsanleitung]],
        align(right)[#text(8pt, gray)[v5.0 Mai 2026]]
      )
      line(length: 100%, stroke: 0.5pt + gray)
    }
  },
  footer: context {
    line(length: 100%, stroke: 0.5pt + gray)
    v(2pt)
    grid(
      columns: (1fr, 1fr, 1fr),
      align: (left, center, right),
      text(8pt, gray)[v5.0 Mai 2026],
      text(8pt, gray)[#counter(page).display() / #counter(page).final().first()],
      text(8pt, gray)[© Aquacrafts B.V.],
    )
  }
)

#set text(
  font: "Verdana",
  size: 10pt,
  lang: "de",
)

#set par(
  justify: true,
  leading: 0.65em,
)

#set heading(numbering: none)

// Make all hyperlinks visibly blue and underlined
#show link: it => text(fill: rgb("#0055CC"), it)
#show link: underline

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  v(4mm)
  block(
    fill: rgb("#ED1C24"),
    inset: (x: 8pt, y: 6pt),
    radius: 3pt,
    width: 100%,
    text(weight: "bold", size: 14pt, fill: white, it.body)
  )
  v(4mm)
}

#show heading.where(level: 2): it => {
  v(5mm)
  text(weight: "bold", size: 11pt, fill: rgb("#ED1C24"), it.body)
  v(1.5mm)
  line(length: 100%, stroke: 0.5pt + rgb("#ED1C24"))
  v(2mm)
}

#show heading.where(level: 3): it => {
  v(4mm)
  text(weight: "bold", size: 10pt, fill: rgb("#333333"), it.body)
  v(1.5mm)
}

#show heading.where(level: 4): it => {
  v(3mm)
  text(weight: "bold", style: "italic", size: 10pt, fill: rgb("#333333"), it.body)
  v(1mm)
}

// ── Callout boxes ──────────────────────────────
#let note(body) = block(
  fill: rgb("#EEF6FF"),
  stroke: (left: 3pt + rgb("#3B82F6")),
  inset: (left: 10pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 3pt),
  width: 100%,
  below: 8pt,
  above: 8pt,
  [#text(weight: "bold", fill: rgb("#1D4ED8"))[📌 HINWEIS] \ #body]
)

#let warning(body) = block(
  fill: rgb("#FFF7ED"),
  stroke: (left: 3pt + rgb("#F97316")),
  inset: (left: 10pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 3pt),
  width: 100%,
  below: 8pt,
  above: 8pt,
  [#text(weight: "bold", fill: rgb("#C2410C"))[⚠️ VORSICHT] \ #body]
)

#let danger(body) = block(
  fill: rgb("#FEF2F2"),
  stroke: (left: 3pt + rgb("#EF4444")),
  inset: (left: 10pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 3pt),
  width: 100%,
  below: 8pt,
  above: 8pt,
  [#text(weight: "bold", fill: rgb("#991B1B"))[⛔ GEFAHR] \ #body]
)

#let caution(body) = block(
  fill: rgb("#FEFCE8"),
  stroke: (left: 3pt + rgb("#EAB308")),
  inset: (left: 10pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 3pt),
  width: 100%,
  below: 8pt,
  above: 8pt,
  [#text(weight: "bold", fill: rgb("#A16207"))[⚠️ ACHTUNG] \ #body]
)

#let advice(body) = block(
  inset: (left: 2pt),
  below: 6pt,
  above: 6pt,
  text(style: "italic", fill: rgb("#555555"))[☝︎ #body]
)

// ── Legenda table helper ────────────────────────
#let legenda(items) = {
  let table_cells = ()
  // header
  table_cells.push(table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 8pt)[Nr.]])
  table_cells.push(table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 8pt)[Bezeichnung]])
  table_cells.push(table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 8pt)[Nr.]])
  table_cells.push(table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 8pt)[Bezeichnung]])
  let i = 0
  while i < items.len() {
    let (n1, it1) = items.at(i)
    table_cells.push(if n1 == 0 { [] } else { text(size: 9pt, weight: "bold")[#n1] })
    table_cells.push(text(size: 9pt)[#it1])
    if i + 1 < items.len() {
      let (n2, it2) = items.at(i + 1)
      table_cells.push(if n2 == 0 { [] } else { text(size: 9pt, weight: "bold")[#n2] })
      table_cells.push(text(size: 9pt)[#it2])
    } else {
      table_cells.push([])
      table_cells.push([])
    }
    i = i + 2
  }
  table(
    columns: (auto, 1fr, auto, 1fr),
    inset: (x: 5pt, y: 3pt),
    stroke: 0.3pt + rgb("#CCCCCC"),
    fill: (col, row) => if row == 0 { rgb("#E8E8E8") } else if calc.odd(row) { rgb("#FAFAFA") } else { white },
    ..table_cells
  )
}

// ─────────────────────────────────────────────
// DECKBLATT
// ─────────────────────────────────────────────
#page(
  margin: (top: 0pt, bottom: 0pt, left: 0pt, right: 0pt),
  header: none,
  footer: none,
)[
  #align(center + horizon)[
    #block(width: 100%, inset: (x: 48pt, y: 40pt))[
      #align(center)[
        #image("../mkdocs/docs/images/logo_black_notag.png", width: 220pt)
        #v(20pt)
        #text(size: 24pt, weight: "bold", fill: rgb("#111111"))[Betriebsanleitung]
        #v(8pt)
        #text(size: 11pt, fill: rgb("#555555"))[Orca 280 · Orca 325 · Orca 375]
        #v(16pt)
        #line(length: 55%, stroke: 0.75pt + rgb("#DDDDDD"))
        #v(10pt)
        #text(size: 9pt, fill: rgb("#999999"))[Aquacrafts B.V. — v5.0 Mai 2026]
        #v(24pt)
        #image("../mkdocs/docs/images/orca325_cover.png", height: 200pt)
      ]
    ]
  ]
]

// ─────────────────────────────────────────────
// INHALTSVERZEICHNIS
// ─────────────────────────────────────────────
#pagebreak()
= Inhaltsverzeichnis
#outline(title: none, depth: 3, indent: 1em)

// ─────────────────────────────────────────────
// KAPITEL 1: ALLGEMEINES
// ─────────────────────────────────────────────

= 1. Allgemeines

== 1.1 Einführung

Diese Betriebsanleitung wurde erstellt, um die sichere und angenehme Nutzung Ihres DinghyGo aufblasbaren 3-in-1-Segelbootes zu gewährleisten. Sie enthält detaillierte Informationen über das Wasserfahrzeug, seine Ausrüstung, seine Systeme sowie Hinweise zu Betrieb und Wartung. Bitte lesen Sie diese Anleitung sorgfältig und schauen Sie sich die DinghyGo-Anleitungsvideos an. Es ist wichtig, dass Sie mit dem Wasserfahrzeug vertraut sind, bevor Sie es in Betrieb nehmen.

Diese Betriebsanleitung ist kein Kurs in Sicherheit und Seemannschaft. Wenn dies Ihr erstes Wasserfahrzeug ist oder Sie mit diesem besonderen Fahrzeugtyp nicht vertraut sind, sorgen Sie bitte für Ihre eigene Sicherheit und Ihren Komfort, indem Sie vor der Inbetriebnahme Ihres DinghyGo Erfahrungen im Steuern und Führen eines Wasserfahrzeugs (Segelboot und Motorboot) sammeln.

Ihr DinghyGo-Händler, der nationale Segelverband oder Ihr Yachtclub stehen Ihnen gerne mit Tipps zu örtlichen Segelschulen und Segelklubs mit qualifizierten Lehrern zur Verfügung. Stellen Sie sicher, dass Ihr DinghyGo den erwarteten Wind- und Seegangsverhältnissen gewachsen ist und dass Sie und Ihre Crew in der Lage sind, das Boot unter diesen Bedingungen zu führen.

Diese Betriebsanleitung ist keine detaillierte Anleitung für die Wartung oder Reparatur des Bootes.

Wenn Probleme auftreten, wenden Sie sich bitte an Ihren DinghyGo-Händler. Befolgen Sie die Wartungs- und Reparaturanweisungen in dieser Anleitung für die ordnungsgemäße Instandhaltung Ihres DinghyGo. Vertrauen Sie stets auf ausgebildete und kompetente Fachleute für Wartung, Reparaturen oder Änderungen. Änderungen am Boot, die die Sicherheitseigenschaften des Wasserfahrzeugs beeinträchtigen könnten, dürfen nur von kompetenten Personen beurteilt, ausgeführt und dokumentiert werden. Der Lieferant Aquacrafts B.V. übernimmt keine Haftung für nicht von ihm genehmigte Änderungen. In einigen Ländern ist eine Lizenz oder Genehmigung für den Betrieb dieses Wasserfahrzeugs erforderlich, und manchmal gelten besondere Vorschriften. Sorgen Sie stets für eine gute Wartung Ihres Wasserfahrzeugs und bedenken Sie, dass mit der Zeit Verschleiß auftreten wird, insbesondere durch starke Nutzung oder Missbrauch. Jedes Boot ist robust gebaut, kann aber bei falscher Verwendung erhebliche Schäden erleiden. Passen Sie Geschwindigkeit und Fahrtrichtung des Bootes stets an die jeweiligen Bedingungen an. Die Crew muss mit der Handhabung aller Sicherheits- und Notfallverfahren vertraut sein (Mann-über-Bord-Manöver, Abschleppen usw.). Segelschulen und -clubs organisieren regelmäßig Kurse, die Ihnen dabei helfen können.

In einigen Ländern ist es gesetzlich vorgeschrieben, jederzeit eine Rettungsweste oder Auftriebshilfe zu tragen, die den nationalen Vorschriften entspricht.

Diese Anleitung verwendet die folgenden Sicherheitssymbole:

#warning[Weist auf eine potenzielle Gefahr hin, die, wenn sie nicht gemieden wird, zu schweren oder tödlichen Verletzungen führen kann.]

#danger[Weist auf eine unmittelbare Gefahr hin, die, wenn sie nicht gemieden wird, zu schweren oder tödlichen Verletzungen führt.]

#caution[Weist auf eine potenzielle Gefahr hin, die, wenn sie nicht gemieden wird, zu leichten oder mittelschweren Verletzungen oder Sachschäden führen kann. Kann auch auf unsichere Betriebspraktiken hinweisen.]

#note[Bitte bewahren Sie diese Anleitung an einem sicheren Ort auf und händigen Sie sie beim Verkauf Ihres DinghyGo dem neuen Eigentümer aus.]

== 1.2 CE-Kategorie

Ihr DinghyGo ist für den Einsatz als *Kategorie D*-Wasserfahrzeug bestimmt:

Kategorie D. Ein Wasserfahrzeug, das für den Einsatz bei Windstärken bis einschließlich Beaufort 4 und entsprechenden signifikanten Wellenhöhen bis einschließlich 0,3 m mit gelegentlichen Wellenhöhen von maximal 0,5 m ausgelegt ist. Solche Bedingungen herrschen in geschützten Küsten- und Binnengewässern, einschließlich kleiner Buchten, kleiner Seen, Flüsse und Kanäle bei guten Wetterverhältnissen.

#advice[Die Wellenhöhe ist die durchschnittliche Höhe des obersten Drittels der Wellen, die in etwa der Wellenhöhe entspricht, wie sie von einem erfahrenen Beobachter geschätzt wird. Einige Wellen können jedoch doppelt so hoch sein.]

#warning[
  Treffen Sie alle erforderlichen Sicherheitsvorkehrungen, wenn das Wasserfahrzeug von einem Mutterschiff auf offener See eingesetzt wird. Den Kontakt mit dem Mutterschiff niemals verlieren!

  *Stets eine Rettungsweste tragen!*
]

== 1.3 ABYC-Standard

Ihr DinghyGo entspricht dem American Boat & Yacht Council (ABYC) H-28 Type 1 Inflatable Boats Standard.

== 1.4 Tragfähigkeitsschild

Das Tragfähigkeitsschild des DinghyGo-Herstellers Aquacrafts B.V. befindet sich auf der Innenseite des Bootshecks (Spiegel).

#figure(
  image("../mkdocs/docs/images/image_02.png", width: 80%),
  caption: [Darstellung des Tragfähigkeitsschildes (Orca 325)],
  supplement: none,
)

Erklärung des Tragfähigkeitsschildes:

- a. Name des Herstellers
- b. Bootsmodell, Typ und Version
- c. Bootskategorie — siehe Tabelle 2.1
- d. CE-Kennzeichnung
- e. ISO 6185 Teil & Typ
- f. Maximale Belastung (Personen + Außenbordmotor + Kraftstoff + Ausrüstung)
- g. Maximale Leistung und Gewicht des Außenbordmotors
- h. Maximale Kapazität / Anzahl der Personen
- i. Maximale Segelfläche
- j. Maximaler Druck der Luftkammern und des Bodens

== 1.5 Nationale Vorschriften

Prüfen Sie vor der Inbetriebnahme die örtlichen Vorschriften bezüglich etwaiger Einschränkungen für das Gewässer, auf dem Sie fahren möchten. Achten Sie besonders auf Einschränkungen hinsichtlich Segeln, Geschwindigkeit, Verwendung des Segelsets oder des Außenbordmotors, Lärmschutzvorschriften auf dem Wasser usw.

== 1.6 Allgemeine Sicherheitshinweise

#advice[Vorschläge zur Sicherheit beim Bootfahren

Um die Gewässer sicher genießen zu können, sollten Sie sich mit den örtlichen und anderen geltenden Schifffahrtsregeln und -vorschriften vertraut machen. Beachten Sie bitte die folgenden Hinweise:]

- Verwenden Sie Rettungswesten oder Auftriebshilfen. Stellen Sie sicher, dass für jede Person an Bord eine geeignete Rettungsweste oder Auftriebshilfe vorhanden und leicht zugänglich ist (in einigen Ländern gesetzlich vorgeschrieben).
- Überschreiten Sie nicht die maximale zulässige Belastung. Wenden Sie sich im Zweifelsfall an Ihren DinghyGo-Händler.
- Führen Sie Sicherheitsprüfungen und erforderliche Wartungsarbeiten durch. Halten Sie einen regelmäßigen Wartungsplan ein und stellen Sie sicher, dass alle Reparaturen ordnungsgemäß ausgeführt werden.
- Kennen und beachten Sie alle geltenden Schifffahrtsregeln und -gesetze.

#advice[Stellen Sie sicher, dass alle Bootsinsassen ordnungsgemäß auf einem Sitzplatz sitzen. Sitzen Sie nicht auf Teilen des Bootes oder des Segelriggs, die nicht als Sitzplatz vorgesehen sind.]

Dies betrifft die Schanzdeckkanten, den Bug und das Deck, wo plötzliche unerwartete Beschleunigungen das Gleichgewicht gefährden können. Plötzliches Stoppen, unerwarteter Kontrollverlust über das Boot oder das Segelrigg sowie plötzliche Bootsbewegungen können dazu führen, dass eine Person über Bord oder ins Boot geschleudert wird.

#advice[Stellen Sie sicher, dass Sie beim Bootfahren NIEMALS unter dem Einfluss von Alkohol oder Drogen stehen (gesetzlich verboten). Alkohol und Drogen beeinträchtigen Ihr Urteils- und Reaktionsvermögen erheblich.]

Machen Sie, wenn möglich, andere Personen an Bord mit der Bootsführung vertraut, falls der Bootsführer handlungsunfähig wird oder über Bord fällt: Unterweisen Sie mindestens eine weitere Person in den Grundlagen des Segelns, des Starts und Betriebs des Außenbordmotors sowie der Steuerung des Bootes.

#advice[Stellen Sie den Außenbordmotor ab, wenn Passagiere ein- oder aussteigen oder sich im Bereich des Bootshecks aufhalten. Es reicht nicht aus, den Außenbordmotor nur auf Leerlauf zu schalten.]

Seien Sie aufmerksam. Der Bootsführer ist gesetzlich dafür verantwortlich, wachsam zu sein und auf mögliche Gefahren zu achten. Der Bootsführer muss insbesondere nach vorne freie Sicht haben. Passagiere und Ladung dürfen die Sicht des Bootsführers während der Fahrt nicht behindern.

#advice[Fahren Sie mit dem Boot niemals direkt hinter einem Wasserskifahrer (oder Wakeboarder) her, da dieser stürzen könnte. Wenn der Wasserskifahrer 61 m (200 Fuß) vor Ihnen fährt und Ihr Boot mit 20 km/h (12,5 mph) unterwegs ist, holen Sie ihn in nur zehn Sekunden ein.]

Achten Sie auf gestürzte Wasserskifahrer. Der Bootsführer muss gestürzte Wasserskifahrer stets im Blick behalten und darf niemals rückwärts zu einem Skifahrer oder einer anderen Person im Wasser fahren. Unfälle sind stets zu melden.

// ─────────────────────────────────────────────
// KAPITEL 2: TECHNISCHE DATEN
// ─────────────────────────────────────────────

= 2. Technische Daten, Beschreibung und Ausstattung

== 2.1 Technische Daten

Die DinghyGo-Modelle fallen unter die Freizeitboot-Richtlinie 2013/53/EU. Ein Beispiel einer Konformitätserklärung ist als Anhang dieser Anleitung beigefügt.

#text(size: 8.5pt)[
  #table(
    columns: (2fr, 1fr, 1fr, 1fr),
    inset: (x: 6pt, y: 4pt),
    stroke: 0.4pt + rgb("#CCCCCC"),
    fill: (col, row) => if row == 0 { rgb("#ED1C24") } else if calc.odd(row) { rgb("#FAFAFA") } else { white },

    table.cell(fill: rgb("#ED1C24"))[#text(weight: "bold", fill: white)[Modell]],
    table.cell(fill: rgb("#ED1C24"))[#text(weight: "bold", fill: white)[Orca 280]],
    table.cell(fill: rgb("#ED1C24"))[#text(weight: "bold", fill: white)[Orca 325]],
    table.cell(fill: rgb("#ED1C24"))[#text(weight: "bold", fill: white)[Orca 375]],

    table.cell(colspan: 4, fill: rgb("#E8E8E8"))[#text(weight: "bold")[Boot — Technische Daten]],
    [CE-Kategorie], [D], [D], [D],
    [Anzahl Luftkammern], [3], [3], [3],

    table.cell(colspan: 4, fill: rgb("#E8E8E8"))[#text(weight: "bold")[Abmessungen und Gewicht \*]],
    [Länge (ft/cm)], [9'2"/280], [10'7"/325], [12'3"/375],
    [Breite (ft/cm)], [4'9"/150], [4'9"/150], [4'9"/150],
    [Tiefgang (ft/cm)], [2'8"/85], [2'8"/85], [2'8"/85],
    [Schlauch-Durchmesser (in/cm)], [16"/40], [16"/40], [16"/40],
    [Gewicht (lbs/kg)], [60/27], [64/29], [71/32],

    table.cell(colspan: 4, fill: rgb("#E8E8E8"))[#text(weight: "bold")[Kapazität (Maximum)]],
    [Personen (ohne/mit Segelrigg)], [3/2], [4/2,5], [5/3],
    [Nutzlast (lbs/kg)], [660/300], [880/400], [1.100/500],
    [Außenbordmotor (kW/PS)], [4,5/6,0], [4,5/6,0], [4,5/6,0],
    [Druck Schläuche/Boden (psi)], [3,6/10,2], [3,6/10,2], [3,6/10,2],
    [Packmaß \*\* (LxBxH in)], [40"x21"x13"], [40"x28"x13"], [40"x28"x15"],
    [Packmaß \*\* (LxBxH cm)], [100x54x32], [100x72x32], [100x72x38],

    table.cell(colspan: 4, fill: rgb("#E8E8E8"))[#text(weight: "bold")[Rigg — Technische Daten]],
    table.cell(colspan: 4, fill: rgb("#F4F4F4"))[#text(style: "italic")[Abmessungen und Gewicht \*]],
    [Mastlänge (ft/cm)], [14'1"/430], [14'1"/430], [14'1"/430],
    [Baumlänge (ft/cm)], [7'4"/225], [7'4"/225], [7'4"/225],
    [Segelfläche (sq.ft/m²)], [52/4,8], [60/5,6], [64/5,9],
    [Gewicht (lbs/kg)], [32/14], [33/15], [37/17],
    [Packmaß \*\* (LxBxH in)], [47"x18"x7"], [47"x18"x7"], [47"x18"x8"],
    [Packmaß \*\* (LxBxH cm)], [120x45x17], [120x45x18], [120x45x20],
  )
]

#v(3mm)
#text(size: 8pt, fill: rgb("#666666"))[\*) Spezifikationen können um 5 % abweichen \ \*\*) Gewichte und Packmaße ohne Karton, Verpackungsmaterialien und Taschen.]

== 2.2 Bootsmodell

DinghyGo ist ein aufblasbares 3-in-1-Segelboot, das seine Form, Festigkeit und seinen Auftrieb durch Befüllung mit Luft erhält. Das Boot ist für kurze Fahrten in geschützten und offenen Gewässern ausgelegt, wie im Abschnitt „CE-Kategorie" angegeben. Die verschiedenen DinghyGo-Modelle sind in der Tabelle der Modell-Spezifikationen aufgeführt.

== 2.3 Anzahl der zulässigen Personen

#warning[Überschreiten Sie nicht die maximale Personenzahl. Unabhängig von der Anzahl der Personen an Bord darf das Gesamtgewicht von Personen und Ausrüstung die maximale empfohlene Nutzlast nicht überschreiten. Verwenden Sie stets den/die vorhandenen Sitz/Sitzplätze.]

== 2.4 Tragfähigkeit

#warning[Überschreiten Sie beim Beladen des Wasserfahrzeugs niemals die maximale empfohlene Nutzlast. Beladen Sie das Wasserfahrzeug stets mit Vorsicht und verteilen Sie die Last gleichmäßig, um eine ordnungsgemäße Trimmlage beizubehalten. Vermeiden Sie die Unterbringung schwerer Gegenstände an hohen Stellen.]

Die maximale empfohlene Nutzlast umfasst ausschließlich:

- a. Die Anzahl der Personen mit je 75 kg Körpergewicht. Wenn Kinder zur Crew gehören, kann die maximale Personenzahl erhöht werden, sofern jedes Kind nicht mehr als 37,5 kg wiegt und das Gesamtgewicht nicht überschritten wird;
- b. Grundausrüstung einschließlich Segelset und Ruderausrüstung;
- c. Vorräte und Ladung (falls vorhanden), Trockenvorräte, verbrauchbare Flüssigkeiten [nicht unter d. erfasst] sowie verschiedene Ausrüstungsgegenstände, die nicht im Bootsgewicht enthalten sind oder unter b. fallen, einschließlich Außenbordmotor;
- d. Verbrauchbare Flüssigkeiten (Frischwasser, Kraftstoff) in tragbaren Tanks, die bis zur maximalen Füllhöhe gefüllt sind.

== 2.5 Segelausrüstung

Die maximale Segelfläche des Segelriggs (Segelset) ist in der „Tabelle der Modell-Spezifikationen" und auf dem Tragfähigkeitsschild angegeben.

Die Installation und Verwendung des Segelsets sind in den Kapiteln „Montage und Zerlegung", „Hinweise über Sicherheit und Betrieb" sowie im Anhang „Montage Ruder/Orca Baum …" dieser Anleitung beschrieben.

#warning[Die Verwendung eines zu großen oder nicht originalen Segelriggs kann, vor allem bei starkem Wind, ernsthafte Schäden am Wasserfahrzeug oder Personenverletzungen verursachen. Verwenden Sie stets das originale und passende DinghyGo-Segelset, das kleiner oder gleich der angegebenen maximalen Segelfläche ist. Segeln Sie niemals bei mehr Wind als in der maximalen CE-Kategorie angegeben.]

== 2.6 Außenbordmotor

Die maximale Motorleistung für dieses Boot ist in der „Tabelle der Modell-Spezifikationen" und auf dem Tragfähigkeitsschild angegeben.

Die Installation des Außenbordmotors und weitere Betriebsanweisungen sind im Kapitel „Montage und Zerlegung" dieser Anleitung beschrieben.

#danger[Die Verwendung eines Außenbordmotors mit maximaler Leistungseinstellung kann zu schweren Verletzungen, Tod oder Schäden am Wasserfahrzeug führen.]

#danger[Sie können die Kontrolle über das Boot verlieren, wenn der Außenbordmotor mit Vollgas betrieben wird. Es besteht Unfallgefahr. Der Lieferant (Aquacrafts B.V.) haftet nicht für derartige Aktionen.]

#warning[Seien Sie beim Tanken vorsichtig: Rauchen Sie nicht und entfernen Sie übergelaufenen Kraftstoff aus dem Boot. Achten Sie darauf, dass die Kraftstoffleitungen beim Installieren des Motors nicht beschädigt werden. Stellen Sie sicher, dass keine brennbaren Materialien mit heißen Motorteilen in Berührung kommen.]

// ── 2.7 Zeichnungen ─────────────────────────────
#pagebreak()
== 2.7 Zeichnungen

// ── 2.7.1 ───────────────────────────────────────
#block(breakable: false)[
  === 2.7.1 Orca 280 — Seitenansicht

  #figure(
    image("../mkdocs/docs/images/image_04.png", height: 195mm),
    caption: [Orca 280 — Seitenansicht],
    supplement: none,
    placement: none,
  )
]

#pagebreak()
*Legende*

#legenda((
  (1, "Segeltasche"),
  (18, "Mastsicherungs-Knöpfe"),
  (2, "Segellatte"),
  (19, "Deck"),
  (3, "Windfaden"),
  (20, "Klemme Baumniederholer"),
  (4, "Schothorn"),
  (21, "Klettband"),
  (5, "Unterliekstrecker"),
  (22, "Hals"),
  (6, "Baumende"),
  (23, "Mastfuß"),
  (7, "Großschotblock mit Öse"),
  (24, "Mastfußbrett"),
  (8, "Großschot"),
  (25, "D-Öse"),
  (9, "Travellerblock mit Schnellverschluss"),
  (26, "Mittelschwert (Steckschwert)"),
  (10, "Klettband"),
  (27, "Festes Teil Schwertkasten"),
  (11, "Klemme Unterliekstrecker"),
  (28, "Flexibles Teil Schwertkasten"),
  (12, "Hinteres Baumteil"),
  (29, "Lenzer"),
  (13, "Großschotblock"),
  (30, "Ruder"),
  (14, "Vorderes Baumteil"),
  (31, "Ruderbeschlag"),
  (15, "Baumniederholer-Stopp"),
  (32, "Fingerling"),
  (16, "Baumniederholer"),
  (33, "Spiegel"),
  (17, "Baumgabel"),
  (34, "Rudersicherung"),
))

// ── 2.7.2 ───────────────────────────────────────
#pagebreak()
#block(breakable: false)[
  === 2.7.2 Orca 375 — Seitenansicht

  #figure(
    image("../mkdocs/docs/images/image_05.png", height: 195mm),
    caption: [Orca 375 — Seitenansicht],
    supplement: none,
    placement: none,
  )
]

#pagebreak()
*Legende* — Zusätzliche Teile (Wanten & Mastunterstützung)

#legenda((
  (60, "Segeltasche-Öffnung"),
  (63, "Want"),
  (61, "Mast-Öse"),
  (64, "Want-Klemme"),
  (62, "Want-Schäkel"),
  (65, "Want/Davits-D-Öse"),
))

*Legende* — Zusätzliche Teile (Fock)

#legenda((
  (66, "Fall"),
  (72, "Fock-Schäkel (Schothorn)"),
  (67, "Fall-Schäkel"),
  (73, "Bug-D-Öse"),
  (68, "Fock-Oberkant"),
  (74, "Fock-Schothorn"),
  (69, "Fock"),
  (75, "Fockschot"),
  (70, "Fall-Klemme"),
  (76, "Fockschot-D-Öse"),
  (71, "Fockhals"),
  (0, ""),
))

// ── 2.7.3 ───────────────────────────────────────
#pagebreak()
#block(breakable: false)[
  === 2.7.3 Orca 280 — Aufsicht

  #figure(
    image("../mkdocs/docs/images/image_06.png", width: 100%),
    caption: [Orca 280 — Aufsicht],
    supplement: none,
    placement: none,
  )
]

#pagebreak()
*Legende*

#legenda((
  (35, "Ventil Boden (Nr. 4)"),
  (48, "Ruderdolle"),
  (36, "Ventil (Nr. 1)"),
  (49, "Riemen/Paddel"),
  (37, "Deck"),
  (50, "Ventil (Nr. 3)"),
  (38, "Handgriff Vorschiff"),
  (51, "Tragegriff (hinten)"),
  (39, "Mastkragen"),
  (52, "Travellerleine"),
  (40, "Mastfußbrett-Anschläge"),
  (53, "Außenborderplatte (Innenbord)"),
  (41, "Überdruckventil"),
  (54, "Außenborderplatte (Außenbord)"),
  (42, "Davit-Öse"),
  (55, "Pinne"),
  (43, "Überdruckventil Boden"),
  (56, "Karabiner"),
  (44, "Sitzbank/Schwertkasten"),
  (57, "Davits- und Traveller-Öse"),
  (45, "Sicherungsleine"),
  (58, "Ventil (Nr. 2)"),
  (46, "Kederleiste"),
  (59, "Tragegriff (hinten) Bord"),
  (47, "3D-Boden"),
  (0, ""),
))

// ── 2.7.4 ───────────────────────────────────────
#pagebreak()
#block(breakable: false)[
  === 2.7.4 Klappruder — Seiten-/Heckansicht

  #figure(
    image("../mkdocs/docs/images/image_07.png", height: 195mm),
    caption: [Klappruder — Seitenansicht (links) und Heckansicht (rechts)],
    supplement: none,
    placement: none,
  )
]

#pagebreak()
*Legende*

#legenda((
  (1, "Ruderblatt"),
  (11, "Fingerlinghalter (unten)"),
  (2, "Bolzenkopfhalter"),
  (12, "Fingerling"),
  (3, "Pinnehalterung (hinten)"),
  (13, "Bolzenendkappe"),
  (4, "Pinne"),
  (14, "Bolzen"),
  (5, "Pinnensicherung"),
  (15, "Flügelmutter"),
  (6, "Pinnehalter (vorne)"),
  (18, "Bolzenkopf"),
  (7, "Fingerlinghalter (oben)"),
  (20, "Bolzenkopf"),
  (8, "Fingerling"),
  (0, ""),
  (9, "Rudersicherung"),
  (0, ""),
  (10, "Ruderkopf"),
  (0, ""),
))

// ─────────────────────────────────────────────
// KAPITEL 3: MONTAGE UND ZERLEGUNG
// ─────────────────────────────────────────────

= 3. Montage und Zerlegung

#advice[Schauen Sie sich die DinghyGo-Anleitungsvideos zur Montage und Demontage des Wasserfahrzeugs genau an. Sie erhalten diese Anleitungsvideos mit Ihrem DinghyGo. Sie können diese auch bei Ihrem DinghyGo-Händler nachbestellen.]

== 3.1 Aufblasbarer Boden

Die DinghyGo-Boote sind mit einem aufblasbaren Boden ausgestattet, der ordnungsgemäß aufgeblasen werden muss. Die Nutzung des Bootes ohne einen ordnungsgemäß aufgeblasenen Boden ist unsicher, unbequem und kann zu Schäden am Boot führen. Lesen Sie den Abschnitt „Aufblasen des aufblasbaren Bodens", um zu erfahren, wie der aufblasbare Boden befüllt wird.

== 3.2 Ventile

Die Bootsventile sind speziell für eine sichere und komfortable Nutzung konstruiert. Die flachen Ventile sind darauf ausgelegt, den Komfort im Boot zu erhöhen und Schäden am Boot zu verhindern.

#align(center)[
  #image("../mkdocs/docs/images/image_08.png", width: 50%)
  #text(style: "italic", size: 9pt)[Abbildung eines Ventils]
]

=== 3.2.1 Bedienung des Ventils

- Nehmen Sie die äußere Schutzkappe ab. Das Ventil ist geschlossen, wenn sich der mittlere Drehknopf in der oberen Stellung befindet.
- Zum Öffnen des Ventils positionieren Sie einen Finger in der Mitte des Ventils, drücken Sie den mittleren Drehknopf nach unten und drehen Sie den Finger ¼ Umdrehung im Uhrzeigersinn, bis der Knopf einrastet.
- Zum Schließen des Ventils drücken Sie den Knopf und drehen Sie den Finger ¼ Umdrehung im Uhrzeigersinn, bis der Knopf wieder herausfährt.

=== 3.2.2 Anschluss der Pumpe

- Schließen Sie das Endstück der Pumpe (die Düse) am Ventil an.
- Drehen Sie es nach rechts (im Uhrzeigersinn), bis es einrastet, und beginnen Sie zu pumpen.
- Pumpen Sie so lange, bis das Boot vollständig gefüllt ist.
- Nehmen Sie die Pumpe nach dem Aufpumpen ab.
- Stellen Sie sicher, dass die Schutzkappe wieder angebracht wird (zum Schutz vor Schmutz und Beschädigung).

=== 3.2.3 Überprüfung auf Luftlecks

Bei einem Luftleck:

- Entnehmen Sie den Ventilschlüssel aus dem Reparatursatz.
- Führen Sie den Ventilschlüssel in das Ventil ein und drehen Sie ihn im Uhrzeigersinn. Prüfen Sie, ob das Problem behoben ist.
- Wenn ein Luftleck festgestellt wird, wenden Sie sich an Ihren DinghyGo-Händler und prüfen Sie die Garantiebedingungen.
- Halten Sie die Rückseite des Ventils fest und drehen Sie den Ventilschaft mit dem Schlüssel nach links (gegen den Uhrzeigersinn), um ihn herauszunehmen.
- Prüfen Sie das Ventil auf Beschädigungen.
- Wenn das Ventil beschädigt ist (siehe Anhang „Garantie"), bringen Sie das defekte Ventil zu Ihrem DinghyGo-Händler. Sie erhalten innerhalb der Garantiefrist ein neues Ventil.
- Schmieren Sie den Ventilschaft mit Silikon oder Seifenwasser und bauen Sie ihn wieder ein.

== 3.3 Ruderausrüstung

Mit dem Boot werden zwei Riemen geliefert. Die Blätter können von den Schäften abgenommen werden, um den Transport zu erleichtern. Die Riemen müssen korrekt in den Ruderdollen gesichert werden. Halten Sie den Riemen parallel zum Schlauch mit dem Blatt nach vorne und stecken Sie den Befestigungsbolzen so tief wie möglich in die Ruderdolle. Drehen Sie den Riemen dann 180 Grad nach außen, um ihn in der Ruderdolle zu sichern.

== 3.4 Segelausrüstung (Segelset)

Ihr DinghyGo wird mit einem Segelset geliefert, das Folgendes enthält:

- Sitzbank (Orca 375 enthält 2 Fock-Klemmen) / Schwertkasten
- Mastfußbrett
- Mittelschwert (Steckschwert)
- Ruder
- Teilbarer Mast
- Teilbarer Baum
- Segel
- Leinensatz (Schoten, Wanten mit Klemmen, Schäkel, Gummiband Mittelschwert)
- Segelset-Tasche

Die Installation und das Aufriggen der Segelausrüstung werden später in der Anleitung einschließlich des Anhangs erläutert.

== 3.5 Sitzbank

DinghyGo ist mit einer Spezialsitzbank und einer „Kederleiste" an beiden Seitenschläuchen ausgestattet, auf die die Sitzbank aufgeschoben wird. Die Sitzbank dient gleichzeitig als oberer Schlitz für das Mittelschwert (Schwertkasten).

#advice[Sie müssen die Sitzbank einbauen, bevor das Boot vollständig aufgeblasen ist.]

== 3.6 Aufpumpen der Schläuche

Rollen Sie das Boot zum Aufblasen auf dem Boden aus. Entfernen Sie alle scharfen Gegenstände von der Fläche, auf der das Boot aufgeblasen wird.

- Prüfen Sie nach dem Auspacken des Bootes, ob alle Teile vorhanden sind.
- Stellen Sie sicher, dass die Ventile geschlossen sind. Stecken Sie dazu einen Finger in das Ventil, drücken Sie den kleinen grauen Drehknopf und drehen Sie ihn leicht nach rechts.
- Wenn der Knopf leicht nach oben springt, kann mit dem Aufblasen des Bootes begonnen werden. (Zum Ablassen der Luft aus dem Boot muss der Knopf nach links gedreht werden!)
- Verwenden Sie die mitgelieferte Pumpe. Drücken Sie die Düse (das Endstück) gegen das Ventil und drehen Sie nach rechts. Die Pumpe rastet am Ventil ein.
- Pumpen Sie genügend Luft in das Boot, um die richtige Form zu erhalten.

#advice[Alle Luftkammern müssen gleichmäßig aufgeblasen werden, um Schäden an den Trennwänden zu vermeiden.]

#advice[Das ordnungsgemäße Aufblasen und Ablassen der Luft ist wesentlich für die Langlebigkeit Ihres Bootes.]

=== 3.6.1 Reihenfolge beim Aufpumpen

Blasen Sie das Boot in aufsteigender Reihenfolge der Nummern auf den Ventilschildern auf:

+ Vordere Kammer (Nr. 1)
+ Seitliche Kammern (Nr. 2 & 3)
+ Boden (Nr. 4)

=== 3.6.2 Aufpumpreihenfolge der Luftkammern

Schritt 1: Pumpen Sie Luft durch das Aufblasventil in die vordere Kammer, bis der vorgeschriebene Druck erreicht ist.

Schritt 2: Pumpen Sie die beiden Seitenkammern in der richtigen Reihenfolge auf, bis der vorgeschriebene Druck erreicht ist.

Wenn das Aufblasen in der richtigen Reihenfolge erfolgt, sind alle Kammern mit dem vorgeschriebenen Druck gefüllt und es treten keine Verformungen im Bereich der Trennwände auf.

Schritt 3: Schließen Sie alle Ventile durch Aufstecken und rechtsseitiges Festdrehen der Staubschutzkappen.

#advice[Überschreiten Sie niemals die auf dem Tragfähigkeitsschild und den Ventilschildern angegebenen Werte! Blasen Sie die Bootschläuche auf 0,25 bar = 3,6 psi = 25 kPa und den Boden auf 0,19 bar = 2,75 psi = 19 kPa (Toleranz ±20%) auf. Blasen Sie den Orca-Boden auf 0,7 bar = 10,2 psi = 70 kPa auf.]

#advice[Verwenden Sie keine mechanischen Kompressoren zum Aufblasen des Bootes. Die mitgelieferte Handpumpe ist so eingestellt, dass sie den richtigen Druck für Ihr Boot erzeugt. Falls gewünscht, kann eine elektrische Pumpe als optionales Zubehör bei Ihrem DinghyGo-Händler bezogen werden. Verwenden Sie die korrekten Druckeinstellungen für ein ordnungsgemäßes Aufblasen.]

#caution[Falsches Aufblasen kann strukturelle Schäden an Ihrem Wasserfahrzeug verursachen. Setzen Sie Ihr Wasserfahrzeug außerhalb des Wassers nicht direktem Sonnenlicht aus. Direkte Sonneneinstrahlung bewirkt, dass sich die Luft im Wasserfahrzeug ausdehnt und Schäden verursacht (außer bei korrekter Verwendung und Wartung des Sicherheitsventils).]

== 3.7 Aufblasen des aufblasbaren Bodens

Wenn der aufblasbare Boden vollständig aufgeblasen wird, klemmt er sich selbst zwischen die Seitenschläuche und den Spiegel.

Schritt 1: Pumpen Sie durch das Ventil Luft in den Boden, wie bei den Seitenschläuchen, bis der vorgeschriebene Druck erreicht ist.

Schritt 2: Schließen Sie das Ventil durch Aufstecken und rechtsseitiges Festdrehen der Staubschutzkappe.

== 3.8 Montage und Demontage des Segelriggs

Die Segelset-Tasche enthält die komplette Segelausrüstung. Legen Sie alle Segelteile zur Montage und zum Aufriggen der Segelausrüstung bereit.

=== 3.8.1 Installieren des Mastfußbretts, der Sitzbank und der Travellerleine

- Blasen Sie den Bug und die Seitenschläuche teilweise auf (lesen Sie den Abschnitt „Aufpumpen der Schläuche"), sodass diese bereits Form angenommen haben, aber noch nicht voll unter Druck stehen. Blasen Sie den Boden noch nicht auf.
- Schieben Sie das Mastfußbrett unter die Schläuche, bis es vor den Mastfußbrett-Anschlägen auf dem Boden (am Bug) einrastet.
- Schieben Sie die Sitzbank / den Schwertkasten auf die Kederleisten der Schläuche, bis sie sich direkt über der Schwertkastenöffnung im Boden befindet.
- Knoten Sie ein Ende der Travellerleine an das Spiegelauge und befestigen Sie das andere Ende mit dem Karabiner am anderen Spiegelauge.

=== 3.8.2 Aufblasen des Bootes

- Blasen Sie die Schläuche und den Boden vollständig auf (lesen Sie die Abschnitte „Aufpumpen der Schläuche" und „Aufblasen des aufblasbaren Bodens"), sodass Mastfußbrett und Sitzbank / Schwertkasten fest eingeklemmt sind.
- Befestigen Sie anschließend den flexiblen Teil des Schwertkasten-Einsatzes mit dem Klettverschluss an der Unterseite der Sitzbank / des Schwertkasten.
- Befestigen Sie die Riemen (lesen Sie den Abschnitt „Anbringen der Riemen").

=== 3.8.3 Aufriggen

- Stellen Sie sicher, dass Ruder und Orca-Baum nach dem Auspacken gemäß dem Anhang korrekt montiert sind.
- Schieben Sie die Mast- und Baumteile zusammen.
- Nehmen Sie das Segel und führen Sie die Segellatten ein.
- Schieben Sie den Mast in die Segeltasche des Segels.
- Befestigen Sie die Wanten durch die Segeltaschen-Öffnung mit dem Want-Schäkel an der Öse des oberen Mastteils.
- Führen Sie das Fock-Fall durch den Fockring an der Öse des oberen Mastteils und befestigen Sie den Karabiner an der Fall-Schlaufe oberhalb des Want-Schäkels (nur Orca 375).
- Stellen Sie den Mast durch den Deckkragen in den Mastfuß.
- Befestigen Sie die Wanten an beiden Seiten der Schläuche, indem Sie das Want durch die D-Öse am Schlauch führen und in der Want-Klemme sichern. Stellen Sie sicher, dass der Mast gerade steht mit nur leichter Want-Spannung.
- Befestigen Sie den Fockhals mit dem Schäkel am Bug-Ring und befestigen Sie den Karabiner am Fock-Oberkant. Hissen Sie die Fock, führen Sie das Fall durch den Bug-Ring und dann durch die Klemme und ziehen Sie es fest (nur Orca 375).
- Befestigen Sie den Baum am Mast, indem Sie das vordere Baumende in den Mast einrasten.
- Befestigen Sie beide Klettbänder des Segels am Baum.
- Stellen Sie Baumniederholer und Unterliekstrecker mit der richtigen Spannung ein.
- Befestigen Sie den Travellerblock mit Schnellverschluss an der Travellerleine.
- Befestigen Sie die Fockschot am Fock-Schothorn, führen Sie die Schot durch die Fockschot-Ringe an den Schläuchen und machen Sie einen Achtknoten. Die Schot kann beim Segeln diagonal in den Sitz-Klemmen gesichert werden (Orca 375).

#warning[Stellen Sie sicher, dass das Segelrigg ordnungsgemäß gerade durch den Deckkragen in den Mastfuß bis auf den Boden eingeführt ist.]

#warning[Stellen Sie sicher, dass der Mast gerade steht und durch die an Mast und beiden Schlauchseiten befestigten Wanten ordnungsgemäß gehalten und abgestützt wird. Das fehlerhafte Befestigen der Wanten kann zur Lösung des Segelriggs führen, wodurch das Wasserfahrzeug außer Kontrolle geraten und die Crew verletzt werden kann.]

=== 3.8.4 Segelklar machen

- Befestigen Sie das Ruder am Spiegel. Stellen Sie sicher, dass das Ruder mit der Rudersicherung eingerastet ist.
- Schieben Sie das Mittelschwert durch die Sitzbank in den Schwertkasten.
- Schließen Sie den Selbstlenzer.

#advice[Das Mittelschwert muss mit der stumpfen Seite nach vorne zeigend in den Schwertkasten eingeführt werden. Ein nasses Mittelschwert lässt sich leichter in den Schwertkasten einschieben. Das mitgelieferte Gummiband kann, mit den Enden zu einer Schlaufe zusammengeknotet, um Mittelschwert und Sitzbank gelegt werden, um das Mittelschwert in der gewünschten Position zu halten.]

#advice[Die Travellerleine muss über die Pinne des Ruders gelegt werden.]

#warning[Befestigen Sie das Ruder mit der Rudersicherung. Falsches Sichern kann zum Verlust des Ruders führen, wodurch das Wasserfahrzeug die Richtungskontrolle verliert, was lebensbedrohliche Situationen verursachen kann.]

#warning[Sichern Sie die Pinne stets im Ruderkopf, bevor Sie segeln. Das Ruder kann sonst beschädigt werden und zum Verlust der Richtungskontrolle des Wasserfahrzeugs führen, was lebensbedrohliche Situationen verursachen kann.]

=== 3.8.5 Segeln

Diese Anleitung enthält keine Segelanweisungen und geht davon aus, dass Bootsführer und Passagiere über ausreichende Segelerfahrung und -qualifikationen verfügen. Ihr DinghyGo-Händler oder Segelclub kann Sie über Ausbildungsmöglichkeiten, wie zum Beispiel Segelkurse, informieren.

#warning[Segeln Sie nur, wenn Sie und Ihre Crew über ausreichende Segelerfahrung verfügen und gewährleisten können, dass Sie auf die (zu erwartenden) Bedingungen, Sicherheitsrisiken, die Leistungsfähigkeit der einzelnen Personen und die Funktionsweise des Wasserfahrzeugs reagieren können. Stellen Sie sicher, dass die Ausrüstung der Crew und des Wasserfahrzeugs einwandfrei ist. Unsachgemäße Handhabung, fehlerhafte Ausrüstung und ungeeignete Bedingungen können lebensbedrohliche Situationen verursachen.]

=== 3.8.6 Abriggen

- Nehmen Sie das Ruder vom Spiegel, indem Sie die Rudersicherung drücken/lösen.
- Entfernen Sie das Mittelschwert aus dem Schwertkasten und der Sitzbank.
- Holen Sie die Fock nieder, indem Sie das Fall aus der Klemme ziehen, die Fock herunterlassen und den Fock-Oberkant vom Fall-Karabiner lösen. Lösen Sie den Karabiner von der Fall-Schlaufe, ziehen Sie das Fall aus dem Fockring am Mast und dem Bug-D-Ring (Orca 375).
- Trennen Sie den Travellerblock von der Travellerleine, indem Sie den Schnellverschluss öffnen.
- Lösen Sie die Wanten von den D-Ösen beider Schlauchseiten, indem Sie die Wanten aus den Want-Klemmen lösen.
- Heben Sie das Segelrigg gerade durch den Deckkragen aus dem Mastfuß.
- Lösen Sie Unterliekstrecker und Baumniederholer und lösen Sie den Baum vom Mast.
- Schieben Sie die Baumteile auseinander.
- Entfernen Sie die Segellatten aus dem Segel, lösen Sie die Wanten vom Mast durch Öffnen des Want-Schäkels und ziehen Sie die Segeltasche vom Mast ab.
- Schieben Sie die Mastteile auseinander.

=== 3.8.7 Entfernen des Mastfußbretts und der Sitzbank

- Lassen Sie teilweise Luft aus dem Boden und den Seitenschläuchen ab (lesen Sie den Abschnitt „Ablassen der Luft aus dem Boot"), sodass diese noch Form haben, aber nicht mehr unter Druck stehen.
- Lösen Sie den flexiblen Teil des Schwertkasten-Einsatzes von der Unterseite der Sitzbank.
- Schieben Sie die Sitzbank rückwärts von ihren Kederleisten an den Schläuchen.
- Ziehen Sie das Mastfußbrett über die Anschläge aus dem Bug des Bootes. Das Anheben des Bugs mit einer Hand erleichtert das Herausziehen.
- Nehmen Sie die Riemen aus den Ruderdollen, indem Sie sie mit dem Blatt nach vorne 180 Grad parallel zum Schlauch drehen, und zerlegen Sie die Riemen.

=== 3.8.8 Einpacken und Lagern der Segelausrüstung

- Stellen Sie sicher, dass alle Segelset-Teile sauber und trocken sind. Teile, die (Salz-)Seewasser ausgesetzt waren, müssen nach dem Gebrauch sofort mit Frischwasser abgespült und gereinigt werden.
- Legen Sie die Segelset-Tasche mit der Öffnung zu sich auf den Boden.
- Legen Sie zunächst Mittelschwert und Ruder in die Segelset-Tasche und stapeln Sie die losen Mast- und Baumteile darauf.
- Fügen Sie die losen Riementeile hinzu.
- Fügen Sie Sitzbank und Mastfußbrett hinzu.
- Legen Sie das gefaltete Segel, die Segellatten und den Leinensatz in die Tasche.
- Legen Sie die gefaltete Fock und den Fock-Leinensatz in die Tasche.
- Legen Sie abschließend die Handpumpe hinzu.
- Verschließen Sie die Tasche fest mit den Spanngurten und Schnallen.
- Tragen Sie die Tasche an den Tragegriffen.
- Transportieren und lagern Sie die Tasche an einem geschützten, trockenen Ort bei normalen Temperaturen, frei von schwerer Belastung, Schädlingen, Gefahrstoffen und Strahlung.

#advice[Beim Einpacken bleiben Großschot, Baumniederholer und Unterliekstrecker am Baum befestigt. Die Travellerleine verbleibt an den Spiegelaugen im Boot.]

== 3.9 Anbringen der Riemen

Die DinghyGo-Boote sind mit teilbaren Riemen, Ruderdollen und einem kombinierten Ruder- und Schwertkasten-Sitz ausgestattet.

- Stellen Sie sicher, dass die Sitzbank korrekt installiert ist (lesen Sie den Abschnitt „Installieren des Mastfußbretts, der Sitzbank und der Travellerleine").
- Zum Einsetzen der Riemen in die Ruderdollen halten Sie die Riemen parallel zu den Schläuchen mit dem Blatt nach vorne (nicht nach hinten, sonst gehen sie nicht hinein) und stecken Sie den Metall-Befestigungsbolzen so tief wie möglich in die Ruderdolle.
- Drehen Sie dann die Riemen mit dem Blatt nach außen, sodass sie in der Ruderdolle einrasten und korrekt verwendet werden können.
- Wenn die Riemen nicht in Gebrauch sind, können sie entlang der Schläuche verstaut werden, gesichert durch die Ruderdollen und die elastischen Riemenhalter am hinteren Ende der Seitenschläuche.

#advice[Berücksichtigen Sie die örtlichen Verhältnisse, bevor Sie mit Ihrem DinghyGo — ob mit Segelset, Riemen oder Außenbordmotor — aufs Wasser gehen. Es ist möglich, dass die Antriebsleistung des Bootes nicht ausreicht, um gegen eine starke Strömung oder einen starken Fluss anzusegeln.]

#caution[Falsches Anbringen der Riemen kann die Befestigungsbolzen und Ruderdollen beschädigen. Entfernen Sie bei Bedarf überschüssigen Kunststoff vom Boden der Ruderdollenöffnung.]

== 3.10 Anbau des Außenbordmotors

#advice[Entnehmen Sie der „Tabelle der Modell-Spezifikationen" in dieser Anleitung die maximale Motorleistung und das maximale Motorgewicht.]

#advice[Die Verwendung eines Außenbordmotors, der die maximale Motorleistung oder das maximale Gewicht überschreitet, kann folgende Auswirkungen haben:
- Schwierigkeiten bei der Manövrierfähigkeit und/oder Stabilität des Bootes
- Veränderung der konstruktiv vorgesehenen Auftriebseigenschaften des Bootes
- Schäden am Boot, insbesondere im Bereich des Spiegels]

#advice[Verwenden Sie einen Notstoppschalter. Dieser schaltet den Außenbordmotor ab, wenn der Bootsführer aus irgendeinem Grund die Steuerposition verlässt.]

#danger[Die Verwendung eines Außenbordmotors mit zu hoher Leistung oder zu hohem Gewicht kann zu schweren Verletzungen, Tod oder Schäden am Wasserfahrzeug führen.]

=== 3.10.1 Montage des Außenbordmotors

- Stellen Sie sicher, dass Sie einen sicheren Stand haben.
- Entriegeln Sie den Außenbordmotor, damit die Klemme zum Kippen freigegeben wird, und montieren Sie den Außenbordmotor mit den Klemmen-Schrauben am Spiegel.
- Der Außenbordmotor muss in der Mitte des Spiegels montiert werden, damit er ordnungsgemäß funktioniert. Achten Sie beim Aufsetzen des Motors auf den Spiegel darauf, die Fingerlinghalter des Ruders nicht zu beschädigen.
- Die Klemmhalterung muss sicher auf den Motorplatten am Spiegel festgeschraubt werden. Prüfen Sie dies regelmäßig, da sich bei manchen Motoren die Klemmschrauben im Betrieb lösen können.

#caution[Es gibt Außenbordmotoren, die bei der Montage am Spiegel die Fingerlinghalter des Ruders beschädigen können. Prüfen Sie, ob Ihr Außenbordmotor passt, und lassen Sie ihn gegebenenfalls von einem Fachmann anpassen. Ihr DinghyGo-Händler kann Ihnen dabei behilflich sein.]

=== 3.10.2 Anordnung des Außenbordmotors

Der Außenbordmotor muss so installiert werden, dass er in normaler Betriebsposition senkrecht im Wasser steht. Das bedeutet, dass die „Kavitationsplatte" an der Unterseite des Außenbordmotors horizontal im Wasser liegt, wenn sich das Boot in normaler Betriebsposition befindet. Bei den meisten Außenbordmotoren gibt es eine Möglichkeit, den Anstellwinkel des Schafts relativ zur Klemmenhalterung einzustellen. Bitte wenden Sie sich an Ihren Außenbordmotorhändler, wenn Sie sich dabei nicht sicher sind.

=== 3.10.3 Starten des Außenbordmotors

- Ziehen Sie das Boot ins Wasser.
- Sichern Sie den Außenbordmotor in der richtigen Position mit den Klemmschrauben.
- Sorgen Sie für einen sicheren Stand und starten Sie dann den Außenbordmotor.
- Fahren Sie beim Rückwärtsfahren nicht zu schnell. Es ist möglich, dass Wasser über den Spiegel in das Boot eindringt.

#advice[Stellen Sie sicher, dass der Selbstlenzer im Spiegel geschlossen ist, bevor das Boot ins Wasser gelassen wird.]

== 3.11 Ablassen der Luft aus dem Boot

#advice[Stellen Sie sicher, dass das Boot sauber und trocken ist, bevor es für die Lagerung aufgerollt wird. Entfernen Sie Sand und Schmutz, der an der Bootshaut haften könnte.]

#advice[Lassen Sie die Luft nicht kammerweise aus dem Boot. Lassen Sie die Luft gleichmäßig aus allen Kammern ab; dies verhindert Schäden an den Trennwänden im Boot.]

Ablassen der Luft:

- Legen Sie das Boot auf den Boden.
- Stecken Sie einen Finger in das Ventil und drehen Sie den grauen Drehknopf nach rechts (weitere Informationen zu den Ventilen finden Sie im Abschnitt „Ventile").
- Lassen Sie etwas Luft aus den Schläuchen und dem Boden ab.
- Stellen Sie sicher, dass die Ventil-Einsätze geöffnet bleiben (damit die Luft beim Zusammenfalten weiter entweichen kann).
- Drücken Sie gleichmäßig auf das gesamte Boot, um so viel Luft wie möglich abzulassen.

== 3.12 Zusammenfalten und Einpacken des Bootes

- Legen Sie das Boot auf den Boden.
- Entfernen Sie alle Segel- und Ruderteile, einschließlich Sitzbank, Mastfußbrett und Riemen.
- Falten Sie die Seitenschläuche zur Mitte hin, sodass das gesamte Boot so breit wie der Spiegel ist.
- Falten Sie den Bug über das Deck.
- Ziehen Sie Bug und Deck rückwärts bis über den Schwertkasten.
- Falten Sie die runden hinteren Enden der Schläuche zur Mitte des Spiegels.
- Ziehen Sie den Spiegel vorwärts über den bereits gefalteten Teil.
- Legen Sie das kompakt gefaltete Paket auf die ausgebreitete Bootstasche.
- Falten Sie die zwei kleinen und dann die zwei großen Taschenteile um das Paket und befestigen Sie sie mit den Spanngurten und Schnallen.

== 3.13 Transport

=== 3.13.1 Das Boot aus dem Wasser heben

Stellen Sie sicher, dass sich an der Stelle, an der Sie das Boot aus dem Wasser heben möchten, keine scharfen Kanten befinden. Verwenden Sie zum Heben vorzugsweise die Hebeösen oder Handgriffe und nicht die Leinen.

=== 3.13.2 Abschleppen des Bootes

#advice[Wenn das Schlauchboot von einem anderen Boot abgeschleppt werden muss, muss es leer sein:
- Entfernen Sie das Segelrigg, den Außenbordmotor, den Kraftstofftank, die Batterien und sonstige Ausrüstung.
- Verschließen Sie den Schwertkasten mit dem mitgelieferten flexiblen Einsatz (aus schwarzem EVA-Material), rollen Sie den flexiblen Teil des Schwertkasten-Einsatzes zusammen und schnallen Sie ihn fest.]

#advice[Wichtig: Der Handgriff am Bug darf nicht zum Abschleppen, Ankern oder Festmachen verwendet werden.
- Verwenden Sie die Metallringe an Steuer- und Backbordseite des Bugs zum Abschleppen. Dies ermöglicht es dem Boot, stabil hinter dem schleppenden Fahrzeug zu liegen, und verhindert Schäden am Boot.
- Bringen Sie eine Leine zwischen den Schleppringen an, um ein Zügel zu bilden. Befestigen Sie eine Schleppleine an diesem Zügel und schleppen Sie das Boot mit niedriger Geschwindigkeit.]

#warning[
  - Schleppen Sie das Wasserfahrzeug niemals mit Personen an Bord.
  - Prüfen Sie die Schleppleine regelmäßig.
  - Überprüfen Sie regelmäßig die Schleppsituation und stellen Sie sicher, dass kein Wasser in das Wasserfahrzeug eindringt.
]

// ─────────────────────────────────────────────
// KAPITEL 4: SICHERHEIT UND BETRIEB
// ─────────────────────────────────────────────

= 4. Hinweise über Sicherheit und Betrieb

== 4.1 Wichtiger Sicherheitshinweis

#advice[Notstoppschalter und Reißleine

Der Zweck der Notstoppschalter-Reißleine ist es, den Außenbordmotor abzuschalten, wenn der Bootsführer sich so weit von seiner Steuerposition entfernt, dass der Schalter ausgelöst wird. Dies ist der Fall, wenn der Bootsführer versehentlich über Bord fällt oder sich zu weit von seiner Steuerposition im Boot entfernt. Solche Stürze sind häufig die Folge unsachgemäßer Verwendung, zum Beispiel durch Sitzen auf der Seite des Schlauchboots bei Gleitfahrt, Stehen bei Gleitfahrt, Betrieb bei Gleitfahrt in flachem oder hindernisreichem Gewässer, durch Loslassen einer einseitig ziehenden Pinne, den Konsum von Alkohol oder Drogen oder durch riskante Bootsmanöver mit hoher Geschwindigkeit.]

#align(center)[
  #image("../mkdocs/docs/images/image_09.png", width: 60%)
  #text(style: "italic", size: 9pt)[Zeichnung des Notstoppschalters]
]

Außenbordmotoren mit Pinne und einige Fernschaltungen sind mit einem Notstoppschalter ausgestattet. Die Reißleine des Notstoppschalters ist in der Regel 122 bis 152 cm (4'–5') lang, wenn sie gestreckt ist. Das erste Ende wird in den Schalter eingesteckt (siehe „Zeichnung des Notstoppschalters", Teil b.) und ein Schnappverschluss (Teil a.) am anderen Ende wird am Bootsführer befestigt. Die Leine ist eine Spiralleine, damit sie im Ruhezustand so kurz wie möglich ist und sich möglichst wenig an umliegenden Gegenständen verfängt.

Die Länge der gestreckten Leine ist so abgestimmt, dass das Risiko einer unbeabsichtigten Aktivierung auf ein Minimum reduziert wird. Wird eine kürzere Leine gewünscht, kann die Leine um das Handgelenk oder das Bein des Bootsführers gewickelt oder mit einem Knoten versehen werden. Obwohl der Außenbordmotor durch Aktivierung des Notstoppschalters sofort abgestellt wird, wird das Boot je nach Geschwindigkeit und Kurvenneigung noch ein Stück weitergleiten. Das Boot wird jedoch keinen vollständigen Kreis ausführen.

Wir empfehlen dringend, andere Passagiere in die ordnungsgemäßen Start- und Betriebsverfahren einzuweisen, damit diese den Außenbordmotor in einem Notfall bedienen können.

#warning[Wenn der Bootsführer vom Wasserfahrzeug fällt, kann durch sofortiges Abschalten des Außenbordmotors die Wahrscheinlichkeit von Tod oder schweren Verletzungen durch Überfahren erheblich reduziert werden. Befestigen Sie beide Enden der Notstoppschalter-Reißleine sicher: ein Ende am Notstoppschalter und das andere Ende am Bootsführer.]

#advice[Eine unbeabsichtigte Aktivierung des Schalters während des normalen Betriebs kann ebenfalls auftreten. Dies kann zu folgenden potenziell gefährlichen Situationen führen:
- Passagiere könnten durch das unerwartete Stoppen nach vorne geschleudert werden — besonders gefährlich für Personen am Bug.
- Verlust des Antriebs und der Lenkbarkeit kann bei schwerem Seegang, starken Strömungen oder starkem Wind auftreten.
- Verlust der Steuerung beim Anlegen.]

#warning[Vermeiden Sie schwere oder tödliche Verletzungen durch starke Verzögerungskräfte, die durch eine unbeabsichtigte Aktivierung des Notstoppschalters entstehen. Der Bootsführer sollte seine Steuerposition niemals verlassen, ohne zuvor die Notstoppschalter-Reißleine von seinem Körper zu lösen.]

== 4.2 Prüfliste vor der Inbetriebnahme

- Den Luftdruck in den Luftkammern prüfen.
- Alle Verstopfungen aus dem Selbstlenzer im Spiegel entfernen.
- Den Selbstlenzer am Spiegel schließen.
- Prüfen, ob Mastfußbrett, Sitzbank / Schwertkasten und Travellerleine ordnungsgemäß angebracht sind.
- Prüfen, ob das Boot ordnungsgemäß getakelt ist und der Mast im Mastfuß steht und mit dem Federsicherungssystem unter Deck gesichert ist.
- Prüfen, ob das Mittelschwert mit der stumpfen Seite nach vorne zeigend in den Schwertkasten eingeführt ist.
- Prüfen, ob das Ruder am Spiegel gesichert ist und die Pinne im Ruderkopf gesichert ist.
- Prüfen, ob die Travellerleine an den Spiegelaugen gesichert ist, über die Pinne geführt wird und mit dem Schnellverschluss am Travellerblock befestigt ist.
- Prüfen, ob die Wanten mit dem Want-Schäkel sicher an der Öse des oberen Mastteils und mit den Want-Klemmen an den D-Ösen beider Schlauchseiten befestigt sind.
- Prüfen, ob der Fockhals-Schäkel am Bug-D-Ring befestigt ist und das Fall mit dem Fall-Karabiner am Fock-Oberkant und durch den Fockring in der Klemme sicher befestigt ist (nur Orca 375).
- Prüfen, ob der Außenbordmotor fest am Spiegel montiert ist und der Schwertkasten mit dem mitgelieferten Einsatz verschlossen ist, wenn Sie schnell fahren oder das Boot abschleppen möchten.
- Sicherstellen, dass der Kraftstofftankinhalt bekannt ist und die Reichweite des Bootes eingeschätzt werden kann.
- Prüfen, ob der Notstoppschalter für den Außenbordmotor ordnungsgemäß funktioniert.
- Sicherstellen, dass das Boot nicht überladen ist. Die maximale Personenzahl und die maximale Nutzlast nicht überschreiten. Das Tragfähigkeitsschild am Boot beachten.
- Sicherstellen, dass für jede Person an Bord eine zugelassene und geeignete Rettungsweste vorhanden und leicht zugänglich ist.
- Das Vorhandensein der am Boot befestigten Riemen für den Fall einer Panne prüfen.
- Der Bootsführer kennt die Verfahren für sicheres Navigieren, Segeln und Betreiben.
- Ein Rettungsring oder ein Rettungskissen befindet sich an Bord.
- Das Gewicht von Passagieren und Ladung gleichmäßig verteilen und sicherstellen, dass alle sicher sitzen.
- Mindestens einen Passagier in die Grundlagen der Bootsführung einweisen.
- Vor der Abfahrt jemanden über das Ziel und den voraussichtlichen Zeitpunkt der Rückkehr informieren.
- Keinen Alkohol oder keine Drogen konsumieren.
- Mit dem Wetter, dem Wasser und dem Bereich vertraut sein; Wind, Gezeiten, Strömungen, Sandbänke, Riffe, Felsen, Wracks und andere Gefahren berücksichtigen.

#warning[
  - Die maximale Antriebsleistung für das Wasserfahrzeug (kW) ist in der „Tabelle der Modell-Spezifikationen" aufgeführt.
  - Das Wasserfahrzeug nicht mit einem Außenbordmotor betreiben, dessen Leistung höher ist als auf dem Tragfähigkeitsschild angegeben.
  - Das Wasserfahrzeug nicht mit negativen Trimmeinstellungen des Außenbordmotors (Bug nach unten) bei hoher Geschwindigkeit betreiben.
  - Das Wasserfahrzeug nicht mit hohen Geschwindigkeiten auf stark befahrenen Wasserstraßen oder bei eingeschränkter Sicht, starkem Wind oder hohem Wellengang betreiben. Örtliche Geschwindigkeitsbegrenzungen beachten und einhalten.
  - Die Segelregeln gemäß der KVR (COLREG) einhalten.
  - Stets ausreichend Abstand halten, um bei Bedarf stoppen oder ausweichen zu können.
]

#warning[Das Bilgewasser sollte auf ein Minimum beschränkt werden.]

== 4.3 Stabilität und Auftrieb

=== 4.3.1 Verteilung von Personen und persönlichen Gegenständen

Zur Sicherheit empfehlen wir, dass die Passagiere so nah wie möglich an der Bootsmitte sitzen. Die Position der Passagiere hat direkten Einfluss auf Stabilität und Trimmlage des Bootes. Es ist möglich, auf der Seite des Bootes zu sitzen, sofern auf der anderen Seite ein entsprechendes Gegengewicht vorhanden ist oder dies aus seglerischen Gründen erforderlich ist. Stellen Sie sicher, dass loses Gepäck sicher befestigt ist.

=== 4.3.2 Segeln

Die Verwendung der Segelausrüstung (Segelset) beeinflusst die Bewegungsfreiheit der Passagiere und die Stabilität des Wasserfahrzeugs. Der Bootsführer muss hinter der Sitzbank auf dem Boden Platz nehmen, damit er Ruder und Großschot ordnungsgemäß bedienen kann. Bei stärkerem Wind kann es erforderlich sein, dass der Bootsführer auf dem Luv-Schlauch sitzt, um das Boot auszubalancieren und ein Kentern zu verhindern.

Passagiere müssen hinter oder vor der Sitzbank auf dem Boden sitzen, damit die Segelsteuerung nicht beeinträchtigt und die persönliche Sicherheit nicht gefährdet wird.

Die Passagiere tragen gemeinsam zur Aufrechterhaltung der Stabilität des Segelbootes bei, zum Beispiel durch Anpassen ihrer Sitzposition zur Vermeidung des Kenterns.

#warning[Fehlbedienung des Segelriggs, plötzliche Änderungen im Segelverhalten oder gefährliche Bedingungen können zu unerwarteten Bewegungen des Segelriggs führen, wobei insbesondere der Baum Kopfverletzungen oder tödliche Verletzungen verursachen kann.]

=== 4.3.3 Rudern

Die Position der Riemen gewährleistet eine bequeme Ruderstellung. Verwenden Sie die mitgelieferte Ruder-/Schwertkasten-Sitzbank, um die Rudermöglichkeiten optimal zu nutzen.

#warning[Auf der kombinierten Ruder- und Schwertkasten-Sitzbank kann maximal eine erwachsene Person mit einem Gewicht von höchstens 75 kg oder zwei Kinder von je 37,5 kg Platz nehmen. Mehr Gewicht als angegeben, Stehen oder Springen auf der Sitzbank kann zu Schäden an der Sitzbank und dem Wasserfahrzeug führen und dabei (schwere) Verletzungen verursachen.]

=== 4.3.4 Betrieb mit dem Außenbordmotor

Der Boden des DinghyGo ist in „V"-Form konstruiert. Dies verbessert die Fahreigenschaften (insbesondere beim Segeln am Wind) und den Betrieb mit dem Außenbordmotor. Es ist daher auch möglich, mit Ihrem DinghyGo in Gleitfahrt zu fahren.

#caution[Vermeiden Sie beim Fahren mit hoher Geschwindigkeit oder bei Gleitfahrt abrupte Wendungen und hohe Wellen; dies kann die Passagiere gefährden. Stellen Sie sicher, dass sich alle Personen an den Sicherheitsleinen festhalten. Reduzieren Sie aus Komfort- und Sicherheitsgründen bei Wellengang die Geschwindigkeit. Kleine Kinder müssen im Boot sitzen. Brechende Wellen stellen eine ernsthafte Gefährdung der Bootsstabilität dar. *Stets eine Rettungsweste tragen!*]

#advice[Springen über Wellen und Kielwasser: Beim Fahren mit einem Freizeitboot ist es unvermeidlich, auf Wellen und Kielwasser zu treffen. Wenn dies jedoch mit so hoher Geschwindigkeit geschieht, dass der Rumpf teilweise oder vollständig aus dem Wasser springt, entstehen bestimmte Risiken, besonders beim Wiedereintritt des Bootes ins Wasser.]

#advice[Die größte Gefahr liegt darin, dass das Boot im Sprung die Richtung ändern kann. Durch einen solchen scharfen Richtungswechsel können Insassen von ihren Plätzen oder über Bord geschleudert werden.]

#advice[Ein weiteres gefährliches Szenario kann entstehen, wenn der Bug beim Aufschlag unter die Wasseroberfläche taucht. Dies bringt das Boot sofort fast vollständig zum Stillstand und könnte die Passagiere nach vorne schleudern.]

#advice[Beim Beschleunigen hebt sich oft der Bug. Dies kann die Sicht des Bootsführers vorübergehend beeinträchtigen. Bei starkem Gegenwind und nach oben zeigendem Bug kann der Wind das Boot weiter anheben (und in Extremfällen zum Kentern bringen).]

#warning[Vermeiden Sie schwere oder tödliche Verletzungen durch das Stürzen beim Aufschlag nach dem Springen über eine Welle oder Kielwasser. Vermeiden Sie das Springen über Wellen und Kielwasser so weit wie möglich. Weisen Sie alle Passagiere an, sich beim Sprung über eine Welle oder Kielwasser möglichst niedrig zu halten und sich an den Handgriffen des Wasserfahrzeugs festzuhalten.]

#advice[Alleinfahrt: Wenn das Boot ohne Passagiere betrieben wird, darf der Bootsführer nicht auf den Seitenschläuchen sitzen. Das Gewicht muss sich so weit wie möglich im Bug- und Mittelbereich befinden.]

#advice[Vermeiden Sie schwere Beladung im Heckbereich. Schnelles Beschleunigen sollte vermieden werden, um zu verhindern, dass der Bootsführer nach hinten geschleudert wird.]

#advice[Wind- und Wellenbedingungen können für Ihren DinghyGo sehr gefährlich sein. Das Boot kann kentern, wenn die Last nicht gleichmäßig verteilt ist, insbesondere wenn zu wenig Gewicht im Bug ist und Wind und Strömung gegen das Boot arbeiten.]

#advice[Die Kavitationsplatte am Motor sollte sich etwa 20 mm unterhalb des Bodens des Spiegels befinden. Steht der Motor zu hoch: Kavitation (Luftblasen und Schlupf am Propeller). Steht der Motor zu tief: Widerstand und Wassereintritt. In beiden Fällen verlieren Sie Geschwindigkeit. Befragen Sie Ihren DinghyGo-Händler oder Außenbordmotorhändler.]

#advice[Wir empfehlen, das Boot bei allen Geschwindigkeiten horizontal zu halten. Nutzen Sie das Gewicht der Passagiere, um sicherzustellen, dass das Boot horizontal liegt.]

#advice[Wenden: Reduzieren Sie die Geschwindigkeit bei scharfen Wendungen. Das Boot neigt sich erheblich zur Innenseite der Kurve.]

== 4.4 Gefahren und Risiken

#advice[Gefahren im Wasser: Wracks, Riffe, Felsen, Sandbänke und seichtes Wasser sollten gemieden oder sehr vorsichtig angefahren werden. Wenn Sie mit dem Gebiet nicht vertraut sind, informieren Sie sich vor dem Wassereintritt über örtliche Risiken. Seien Sie vorsichtig bei ablandigen Winden und Strömungen.]

#advice[Defekte Luftkammern und beschädigte Schläuche: Ihr DinghyGo behält mindestens 50 % seines Auftriebs, auch wenn in einer der Luftkammern infolge eines Lecks ein Luftverlust auftritt. Verlagern Sie in diesem Fall das Gewicht auf die andere Seite. Sichern Sie die undichte Kammer wenn nötig und fahren Sie unverzüglich zur nächstgelegenen Küste oder zum Mutterschiff. Achten Sie jedoch auf seichtes Wasser oder Riffe, da diese das Boot weiter beschädigen können.]

#advice[Strandung: Es wird nicht empfohlen, mit laufendem Außenbordmotor oder mit vollständig aufgebauter Segelausrüstung auf den Strand zu fahren oder das Boot über Felsen, Sand, Kies oder Pflaster zu ziehen. Das Boot und die Segelset-Komponenten könnten beschädigt werden.]

#advice[Davits: Wenn das Boot in Davits hängt, muss der Selbstlenzer geöffnet werden, damit sich das Boot nicht mit Wasser füllen und zu schwer werden kann.]

#advice[Sonneneinstrahlung: Achten Sie darauf, dass das Boot nicht zu lange der Sonne ausgesetzt wird. Der sich ändernde Luftdruck in Schläuchen und Boden kann Schäden am Boot verursachen. Längere Perioden extremer Sonneneinstrahlung (ultraviolette Strahlung) können den Alterungsprozess der Materialien beschleunigen. Wenn das Boot für längere Zeit aus dem Wasser genommen wird, decken Sie es ab.]

#advice[Rauchen: Rauchen Sie nicht, besonders nicht beim Tanken.]

#advice[Kraftstofftank: Stellen Sie tragbare Tanks auf einem weichen Untergrund ab und befestigen Sie sie mit einem Gurt am Boot. Nehmen Sie tragbare Tanks zum Befüllen aus dem Boot. Befüllen Sie die Tanks im Freien, fern von Wärme, Funken oder offenen Flammen. Befüllen Sie die Tanks nicht bis zum Rand.]

#advice[Betrieb in Hochlagen: Der normale Schlauch-/Bodendruck beträgt 0,25/0,70 bar. Wenn das Boot auf Meereshöhe aufgeblasen und dann in höhere Lagen transportiert wird, muss der Druck reduziert werden. Ein ordnungsgemäß funktionierendes Überdruckventil reguliert dies selbstständig.]

#danger[Schalten Sie Ihren Außenbordmotor ab und stoppen Sie den Propeller, wenn Personen in der Nähe Ihres Wasserfahrzeugs schwimmen. Der Propeller kann für Personen oder Gegenstände im Wasser sehr gefährlich sein. *Schalten Sie den Außenbordmotor sofort ab, wenn Sie Schwimmer in der Nähe Ihres Wasserfahrzeugs bemerken.*]

// ─────────────────────────────────────────────
// KAPITEL 5: WARTUNG
// ─────────────────────────────────────────────

= 5. Wartung

== 5.1 Allgemeine Wartung

Reinigungsprodukte / Reinigungsmittel

Verwenden Sie Haushaltsreinigungsmittel sparsam und leiten Sie Reinigungsmittel niemals in Gewässer ein. Mischen Sie niemals verschiedene Arten von Reinigungsmitteln und sorgen Sie in geschlossenen Räumen für ausreichende Belüftung. Verwenden Sie keine starken Reinigungsmittel, Lösungsmittel oder Produkte, die Phosphate, Chlor, Lösungsmittel, nicht biologisch abbaubare Produkte oder erdölbasierte Produkte enthalten. Zitronensäurebasierte Reinigungsmittel eignen sich hervorragend für die Bootsreinigung und sind für Sie und die Umwelt unbedenklich. Ihr DinghyGo wird am besten mit Frischwasser und einem normalen Haushaltsreinigungsmittel gereinigt.

#advice[Reinigungsmittel, die Alkohol oder Kohlenwasserstoffe enthalten, dürfen nicht auf dem Bootsstoff verwendet werden. Diese Produkte trocknen das Material vorzeitig aus oder verursachen Schäden am Boot.]

#warning[Vermeiden Sie schwere/tödliche Verletzungen durch Brand, Explosionen oder Vergiftung. Die für die Reparatur der aufblasbaren Teile verwendeten Klebstoffe und Lösungsmittel sind giftig und leicht entflammbar. Arbeiten Sie stets im Freien oder in einem gut belüfteten Bereich und fern von offenen Flammen, Funken oder Geräten mit Zündflammenbrenner. Vermeiden Sie das Einatmen von Dämpfen und den Kontakt mit Haut und Augen, indem Sie eine Kohlefilter-Atemschutzmaske und Schutzkleidung tragen.]

== 5.2 Reparaturen

=== 5.2.1 Kleine Reparaturen

Wir empfehlen dringend, sich bei Beschädigungen am Boot an Ihren DinghyGo-Händler zu wenden.

Wenn der Schaden aus einem kleinen Loch besteht, können Sie das Reparaturmaterial aus dem Reparatursatz verwenden.

Bei größeren Schäden oder in Fällen, in denen die Flicken über eine Naht aufgetragen werden müssen, muss ein professioneller Reparaturtechniker den Schaden beheben.

Die besten Klebebergebnisse werden erzielt, wenn die relative Luftfeuchtigkeit unter 60 % liegt, die Umgebungstemperatur zwischen 18 °C und 25 °C (65 °F–77 °F) beträgt und keine direkte Sonneneinstrahlung vorhanden ist.

Allgemeines Verfahren:

- Schneiden Sie einen Flicken aus, der groß genug ist, um den Schaden auf allen Seiten um 30 mm zu überlappen.
- Legen Sie den überlappenden Flicken über die beschädigte Stelle und zeichnen Sie die Umrisse des Flickens mit einem Bleistift nach.
- Schleifen Sie die markierte Fläche mit Schleifpapier an (nicht so stark, dass die Fasern des Materials sichtbar werden).
- Reinigen Sie den Flicken und den Bereich um das Loch mit einem Lösungsmittel (z. B. MEK).
- Tragen Sie mit einem kurzborstigen Pinsel zwei dünne Schichten Klebstoff kreisförmig auf die Rückseite des Flickens und auf die Bootspartie auf. Lassen Sie die erste Schicht vollständig trocknen (ca. 15 Minuten) vor der zweiten Schicht. Die zweite Schicht sollte trocknen, bis sie sich leicht klebrig anfühlt; dann bringen Sie den Flicken an, indem Sie ihn fest andrücken.
- Warten Sie 24 Stunden, bevor Sie das Boot wieder aufblasen.

=== 5.2.2 Luftleck in Schläuchen oder Boden durch Riss

I. Luftleck durch einen L-förmigen Riss

- Beurteilen Sie die Größe des Risses mit Ihren Fingern. Bereiten Sie einen Flicken aus verstärktem PVC-Material von 0,7 mm Dicke (aus dem Reparatursatz) vor.
- Reinigen Sie eine Seite des Flickens und die Innenseite des Risses mit einem Lösungsmittel (z. B. MEK). Tragen Sie dann Klebstoff auf die gereinigten Flächen auf.
- Warten Sie 15–20 Minuten und prüfen Sie die erste Klebstoffschicht. Tragen Sie eine zweite Schicht auf und warten Sie weitere 15–20 Minuten.
- Führen Sie den Flicken in den Riss ein und positionieren Sie ihn unterhalb des Risses. Drücken Sie fest an.
- Lassen Sie die Luftkammer auf 70–80 % des empfohlenen Luftdrucks ab und tragen Sie Seifenwasser auf die abgedichtete Stelle auf, um auf Luftlecks zu prüfen.
- Bereiten Sie einen Flicken gleicher Größe aus PVC-Material (0,9 mm, im Reparatursatz enthalten) für die Außenseite vor und wiederholen Sie das Verfahren.

#caution[Eine reparierte Luftkammer muss mindestens 24 Stunden mit einem Luftdruck von weniger als 80 % des empfohlenen Luftdrucks trocknen. Zu frühes vollständiges Aufblasen nach der Reparatur kann zu schlechter Haftung der Flicken führen.]

II. Luftleck durch einen geraden Schnitt oder ein kleines Loch

- Bereiten Sie einen Flicken aus verstärktem PVC-Material (0,7 mm Dicke) vor, der etwas länger als das Loch ist und eine Breite von ca. 20–30 mm hat.
- Befolgen Sie das oben beschriebene Verfahren. Blasen Sie die Kammer auf weniger als 80 % des empfohlenen Luftdrucks auf und lassen Sie sie 24 Stunden an einem trockenen Ort trocknen.

Wenden Sie sich bei Problemen an Ihren örtlichen DinghyGo-Händler.

== 5.3 (Winter-)Lagerung

#advice[Um eine Verfärbung des Rumpfes oder der Luftkammern zu verhindern, lassen Sie das Boot nicht zu lange im Wasser liegen.]

- Nach dem Segeln sollten das Boot und alle Bootsteile mit einer milden Seife gewaschen und dann mit Frischwasser abgespült werden. Trocknen Sie alle Teile vor der Lagerung in der Tragesacks. Dies verhindert Schimmelbildung.
- Bauteile mit einem Holzkern (z. B. Spiegel, Deck, Sitzbank und Mastfußbrett) sollten auf Beschädigungen der Beschichtung untersucht werden. Kratzer und andere Schäden müssen mit PVC oder Polyester abgedichtet werden.
- Lagern Sie das Boot an einem kühlen, trockenen Ort und setzen Sie es nicht zu lange direktem Sonnenlicht aus.
- Eine Bootspersenning ist als Zubehör erhältlich, um Ihr Boot während der Lagerung zu schützen.
- Wenn Sie Ihr Boot für längere Zeit lagern möchten, nehmen Sie es aus der mitgelieferten Tasche. Rollen oder falten Sie das Boot locker und lagern Sie es in einer trockenen Umgebung.
- Legen Sie keine schweren Gegenstände auf das Boot, um Schäden während der Lagerung zu verhindern.
- Vermeiden Sie das Vorhandensein von Nagetieren, Insekten und anderen Schädlingen, die Schäden verursachen.

// ─────────────────────────────────────────────
// KAPITEL 6: UMWELT
// ─────────────────────────────────────────────

= 6. Umwelt

Halten Sie die Umweltgesetze, -verfahren und -verantwortlichkeiten ein.

== 6.1 Entsorgung von Schadstoffen

Stellen Sie sicher, dass keine Schadstoffe in das Wasser um das Boot gelangen. Bitte beachten Sie, dass Sie als Wassersportler die Verantwortung tragen, für eine saubere Umwelt zu sorgen.

== 6.2 Entsorgen von Abfallstoffen

„Abfall" ist der Sammelbegriff für alle Arten von Wassermüll, Entsorgung von Kunststoffen, Verpackungen, Lebensmitteln, Holz, Reinigungsmitteln, Abwasser und sogar Fischresten. Wir empfehlen, dass Sie Ihren gesamten Abfall an Land zurückbringen und ihn verantwortungsbewusst entsorgen. In vielen Gebieten ist das Einleiten von Abwasser in Gewässer streng verboten.

== 6.3 Empfohlene Fahrgeschwindigkeiten

Seien Sie beim Fahren mit hohen Geschwindigkeiten vorsichtig, da diese:

- Sie und andere gefährden können oder Personen und Gegenstände im Wasser gefährden;
- erhebliche Wellen hinter dem Boot verursachen können, die Schäden verursachen können;
- unnötigen Lärm für andere Wassersportler verursachen können.

== 6.4 Lärmbelästigung

„Lärm" kann den Klang des Außenbordmotors, aber auch Stimmen von Personen bedeuten. Auf vielen Gewässern gilt eine Lärmschutzvorschrift. Musik und laute Gespräche sind auf dem Wasser viel weiter zu hören als an Land, besonders in der Nacht. Vermeiden Sie Lärmbelästigung.

== 6.5 Abgasemissionen

Erhöhte Abgasemissionen (Kohlenwasserstoffe) verursachen die Verschmutzung von Wasser und Luft. Halten Sie Ihren Außenbordmotor gut eingestellt und den Rumpf des Bootes sauber für optimale Leistung. Entnehmen Sie der Betriebsanleitung des Außenbordmotors Informationen oder wenden Sie sich an Ihren DinghyGo-Händler.

// ─────────────────────────────────────────────
// ANHANG: ANLEITUNGSVIDEOS
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Anhang — Anleitungsvideos
]

+ #link("https://youtu.be/PpUNTYxSFDY")[Auspacken Taschen (0:49 Min.)]
+ #link("https://youtu.be/L0XLs3TuPF4")[Aufblasen (1:39 Min.)]
+ #link("https://youtu.be/bTWhhxxB430")[Montieren (2:42 Min.)]
+ #link("https://youtu.be/MeQv0KGgGLo")[Installieren (1:32 Min.)]
+ #link("https://youtu.be/kEO_EhRJCVo")[Auftakeln (2:42 Min.)]
+ #link("https://youtu.be/D9vflH5E6gI")[Auftakeln Fock (2:16 Min.)]
+ #link("https://youtu.be/W3n8JRRiW9A")[Reff anwenden (0:48 Min.)]
+ #link("https://youtu.be/yxdSrZQdeM0")[Fertig machen zum Segeln (0:43 Min.)]
+ #link("https://youtu.be/cKa4QFNhdGw")[Schwertkasten abdichten — optional (0:46 Min.)]
+ #link("https://youtu.be/1hIpWgxyzcg")[Abtakeln (2:21 Min.)]
+ #link("https://youtu.be/2on8ob-2a3c")[Abtakeln Fock (1:22 Min.)]
+ #link("https://youtu.be/gU4sUKu-yZE")[Deinstallieren und Luft ablassen (1:17 Min.)]
+ #link("https://youtu.be/LqRoUNQhI9E")[Einpacken Boot (2:35 Min.)]
+ #link("https://youtu.be/-kml_pO87J0")[Einpacken Besegelung (1:36 Min.)]

// ─────────────────────────────────────────────
// ANHANG: GARANTIE
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Anhang — Garantie
]

_Bitte beachten Sie: Dies ist eine deutsche Übersetzung der Original-Allgemeinen Geschäftsbedingungen der Aquacrafts B.V., die im Zweifelsfall maßgebend ist._

_Diese Garantieklauseln sind Teil der Allgemeinen Geschäftsbedingungen der Aquacrafts B.V._

=== Artikel 16 GARANTIE

*16.1.* Der Lieferant garantiert, dass das gelieferte Produkt unter Berücksichtigung aller Umstände die Eigenschaften aufweist, die für eine normale Nutzung erforderlich sind, und frei von Mängeln ist.

*16.2.* Der Lieferant garantiert das Fehlen von strukturellen Mängeln, die nach der Lieferung des Produkts an Kunden für einen Zeitraum von 12 Monaten auftreten. Für Lieferungen an Kunden in EU-Ländern garantiert der Lieferant einen zusätzlichen Zeitraum von 12 Monaten.

*16.3.* Die Garantie ist gültig nach Registrierung der Kontakt- und Adressdaten des Kunden beim Lieferanten oder dessen Vertreter sowie der Seriennummer (Wasserfahrzeug-Identifikationsnummer) des gelieferten Produkts.

*16.4.* Der Kunde hat Anspruch auf die kostenlose Reparatur von strukturellen Mängeln des Produkts durch den Lieferanten innerhalb der geltenden Garantiefrist. Die Garantie deckt Risse, Porosität, Fäulnis und Delamination des Materials sowie das Lösen von Nähten ab. Transportkosten trägt der Kunde.

*16.5.* Der Kunde hat Anspruch auf die kostenlose Reparatur von strukturellen Mängeln und auf den Ersatz der dazugehörigen Komponenten des Produkts, einschließlich, aber nicht beschränkt auf Segelrigg, Sitzbank, Mastfußbrett, Mittelschwert, Ruder, Handpumpe und Taschen; dies gilt innerhalb der ersten 12 Monate der geltenden Garantiefrist. Transportkosten trägt der Kunde.

*16.6.* Folgende Produkte sind nicht von der Garantie des Lieferanten abgedeckt: Außenbordmotoren, Generatoren, Batterien, automatische Aufblassysteme, Klimaanlagen, Spiegel-Räder und alle anderen Teile und Zubehörteile, die nicht vom Lieferanten hergestellt oder geliefert wurden.

*16.7.* Der Lieferant haftet nicht für Mängel, die durch die Beschaffenheit und Qualität der verwendeten Materialien entstehen, aber die Nutzung des Produkts nicht beeinträchtigen, einschließlich, aber nicht beschränkt auf kosmetische Verfärbungen und Schäden an den Materialoberflächen wie Risse, Kratzer, Feuchtigkeitsblasen, Beulen, Korrosion, Verblassen, Witterungseinflüsse, Pilzbefall (Schimmel), Wachstum von Unterwasserorganismen, Texturveränderungen und das Lösen von Kanten.

*16.8.* Der Lieferant haftet nicht für Mängel (nach der Lieferung des Produkts), die verursacht werden durch:

- Normalen Verschleiß, unsachgemäße Handhabung oder Nichtbeachtung der Benutzeranweisungen, Bedingungen und Warnhinweise.
- Missbrauch, Zweckentfremdung, Fahrlässigkeit, einschließlich unsachgemäßem Festmachen, Schleppen, Bootfahren, zu hohem oder zu niedrigem Druck der Luftkammern.
- Ungenaue, unzureichende und überfällige Wartung sowie die Verwendung ungeeigneter Reinigungs- und Pflegeprodukte.
- Verwendung eines Außenbordmotors, Segelriggs oder anderer Antriebssysteme, die eine höhere Leistung oder ein höheres Gewicht als auf dem Tragfähigkeitsschild angegeben haben.
- Übermäßige Last, einschließlich der auf dem Tragfähigkeitsschild angegebenen Anzahl an Passagieren und des Ladegewichts.
- Falsche (De-)Installation des Außenbordmotors, der Segel- und Ruderausrüstung.
- Unsachgemäße Verwendung von Trailern, Davits, Garage oder anderen Methoden der Lager- und Transporteinrichtungen.
- Teilnahme an oder Vorbereitung auf Rennen oder andere Wettkampfsportarten, Vermietung und Verleih des Wasserfahrzeugs und andere gewerbliche Aktivitäten.
- Beschädigungen durch abnormale Umweltbedingungen, einschließlich Wasser- und Luftverschmutzung, Osmose, Kraftstoffe, Säuren, Salze, Harze, Chemikalien, Strahlung, Verbrennung, Regen, Hagel, Sturm und Blitz.
- Verlust, Diebstahl, Kollision, Schädlinge und Unfälle.
- Schäden durch höhere Gewalt.
- Änderungen am Produkt durch Dritte oder durch den Kunden, oder das Hinzufügen von Komponenten oder Zubehörteilen, die nicht vom Lieferanten genehmigt wurden.

*16.9.* Der Lieferant haftet auch nicht für Schäden, die aus Kosten entstehen, die durch das Herausnehmen des Wasserfahrzeugs aus dem Wasser, das Zuwasserlassen, Abschleppen, Festmachen, Reinigung, Wartung, Lagerung, Transport, Reisen, Warten, Versicherung, Miete, Recherche, Kommunikation, Notfall oder Einkommensverlust und Zeit sowie alle anderen Arten von Neben- oder Folgeschäden entstehen.

=== Artikel 17 GARANTIEANSPRÜCHE

*17.1.* Garantieansprüche müssen innerhalb der geltenden Garantiefrist so schnell wie möglich und spätestens 7 Tage nach dem Ereignis eines möglichen Produktmangels durch den Kunden über Fernkommunikationsmittel beim Lieferanten oder dessen Vertreter gemeldet werden.

*17.2.* Ein Garantieanspruch enthält die Kontaktdaten, einschließlich Wohnort oder Adresse und E-Mail-Adresse des Kunden, die Wasserfahrzeug-Identifikationsnummer, eine klare Beschreibung der Probleme einschließlich detaillierter Fotos und/oder Videos des Mangels.

*17.3.* Der Lieferant wird den Garantieanspruch so schnell wie möglich prüfen und spätestens 7 Tage über Fernkommunikationsmittel antworten.

*17.4.* Die Nutzung des Produkts nach der Entdeckung eines Mangels liegt in der Verantwortung und auf das Risiko des Kunden.

*17.5.* Nach der Beurteilung des Garantieanspruchs kann der Kunde den Lieferanten um Erlaubnis bitten, ein Produkt mit geringfügigen Mängeln vorübergehend weiter zu nutzen.

*17.6.* Falls möglich, kann der Kunde den Lieferanten oder dessen Vertreter bitten, den notwendigen Transport für die Garantieinspektion und/oder Reparaturen auf Kosten des Kunden zu arrangieren.

*17.7.* Die Folgen verspäteter Mängelanzeigen gehen zu Risiko und Lasten des Kunden.

// ─────────────────────────────────────────────
// ANHANG: RUDER-MONTAGE
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Anhang — Ruder-Montage (nach dem Auspacken)
]

#figure(
  image("../mkdocs/docs/images/image_07.png", height: 148mm),
  caption: [Klappruder — Komponenten],
  supplement: none,
  placement: none,
)

#v(6pt)
#text(size: 9pt)[*Ruder-Montageanleitung*]
#v(6pt)
#grid(
  columns: (1fr, 1fr),
  column-gutter: 20pt,
  row-gutter: 6pt,
  text(size: 9pt, fill: rgb("#0066cc"))[*a.* Schieben Sie den Ruderkopf (10) auf das Ruderblatt (1).],
  text(size: 9pt, fill: rgb("#0066cc"))[*b.* Legen Sie den Bolzen (14) in den Bolzenkopfhalter (2).],
  text(size: 9pt, fill: rgb("#0066cc"))[*c.* Führen Sie den Bolzen (14) durch die Bohrungen im Ruderkopf (10) und im Ruderblatt (1) ein. Stellen Sie sicher, dass der Bolzenkopfhalter (2) in die 2 kleineren Bohrungen des Ruderkopfs einrastet.],
  text(size: 9pt, fill: rgb("#0066cc"))[*d.* Schrauben Sie die Flügelmutter (15) auf den Bolzen (14).],
  text(size: 9pt, fill: rgb("#0066cc"))[*e.* Setzen Sie die Bolzenendkappe (13) zum Schutz auf das Bolzenende.],
  text(size: 9pt, fill: rgb("#0066cc"))[*f.* Führen Sie die Pinne (4) durch die Pinnehalterungen (3 und 6), indem Sie die Pinnensicherung (5) drücken und loslassen.],
)

// ─────────────────────────────────────────────
// ANHANG: ORCA-RIGG BAUM-MONTAGE
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Anhang — Orca-Rigg Baum-Montage (nach dem Auspacken)
]

#figure(
  image("../mkdocs/docs/images/image_11.png", height: 130mm),
  caption: [Orca-Baum-Montage],
  supplement: none,
  placement: none,
)

#v(6pt)
#text(size: 9pt)[*Legende*]
#v(4pt)
#legenda((
  (1, "Baumteil 1"),
  (3, "Baumgabel"),
  (2, "Baumniederholer-Stopp"),
  (4, "Mastteil 1"),
))

#v(8pt)
#text(size: 9pt)[*Orca-Segelrigg Baum-Montageanleitung*]
#v(6pt)
#grid(
  columns: (1fr, 1fr),
  column-gutter: 20pt,
  row-gutter: 6pt,
  text(size: 9pt, fill: rgb("#0066cc"))[*a.* Legen Sie Mastteil 1 (4) auf den Boden.],
  text(size: 9pt, fill: rgb("#0066cc"))[*b.* Rasten Sie die noch nicht montierte Baumgabel (3) auf den Mast (4) auf.],
  text(size: 9pt, fill: rgb("#0066cc"))[*c.* Nehmen Sie Baumteil 1 (1) und positionieren Sie die Vorderseite (die dem Baumniederholer-Stopp (2) am nächsten liegt) auf der Baumgabel (3). Stellen Sie sicher, dass der Baumniederholer-Stopp (2) nach oben zeigt, parallel zum Mastteil (4).],
  text(size: 9pt, fill: rgb("#0066cc"))[*d.* Drücken Sie Baumteil 1 (1) fest nach unten, bis der röhrenförmige Abschnitt der Baumgabel (3) vollständig in den Baum eingeführt ist.],
)

// ─────────────────────────────────────────────
// ANHANG: KONFORMITÄTSERKLÄRUNG
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Anhang — Konformitätserklärung
]

_Beispiel Konformitätserklärung — DinghyGo Orca 375 V1.1_

#v(4pt)
#figure(
  image("images/doc_page_1.png", height: 170mm),
  caption: none,
  supplement: none,
  placement: none,
)

#pagebreak()
#figure(
  image("images/doc_page_2.png", height: 170mm),
  caption: none,
  supplement: none,
  placement: none,
)

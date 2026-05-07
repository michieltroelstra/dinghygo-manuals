// ─────────────────────────────────────────────
// DinghyGo Gebruiksaanwijzing — Volledige handleiding
// Orca 280 · Orca 325 · Orca 375
// v5.0 mei 2026
// ─────────────────────────────────────────────

#set document(
  title: "DinghyGo Gebruiksaanwijzing",
  author: "Aquacrafts B.V.",
)

#set page(
  paper: "a4",
  margin: (top: 25mm, bottom: 25mm, left: 22mm, right: 22mm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(8pt, gray)[DinghyGo Gebruiksaanwijzing]],
        align(right)[#text(8pt, gray)[v5.0 mei 2026]]
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
      text(8pt, gray)[v5.0 mei 2026],
      text(8pt, gray)[#counter(page).display() / #counter(page).final().first()],
      text(8pt, gray)[© Aquacrafts B.V.],
    )
  }
)

#set text(
  font: "Verdana",
  size: 10pt,
  lang: "nl",
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
  [#text(weight: "bold", fill: rgb("#1D4ED8"))[📌 OPMERKING] \ #body]
)

#let warning(body) = block(
  fill: rgb("#FFF7ED"),
  stroke: (left: 3pt + rgb("#F97316")),
  inset: (left: 10pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 3pt),
  width: 100%,
  below: 8pt,
  above: 8pt,
  [#text(weight: "bold", fill: rgb("#C2410C"))[⚠️ WAARSCHUWING] \ #body]
)

#let danger(body) = block(
  fill: rgb("#FEF2F2"),
  stroke: (left: 3pt + rgb("#EF4444")),
  inset: (left: 10pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 3pt),
  width: 100%,
  below: 8pt,
  above: 8pt,
  [#text(weight: "bold", fill: rgb("#991B1B"))[⛔ GEVAAR] \ #body]
)

#let caution(body) = block(
  fill: rgb("#FEFCE8"),
  stroke: (left: 3pt + rgb("#EAB308")),
  inset: (left: 10pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 3pt),
  width: 100%,
  below: 8pt,
  above: 8pt,
  [#text(weight: "bold", fill: rgb("#A16207"))[⚠️ LET OP] \ #body]
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
  table_cells.push(table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 8pt)[Omschrijving]])
  table_cells.push(table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 8pt)[Nr.]])
  table_cells.push(table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 8pt)[Omschrijving]])
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
// OMSLAG
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
        #text(size: 24pt, weight: "bold", fill: rgb("#111111"))[Gebruiksaanwijzing]
        #v(8pt)
        #text(size: 11pt, fill: rgb("#555555"))[Orca 280 · Orca 325 · Orca 375]
        #v(16pt)
        #line(length: 55%, stroke: 0.75pt + rgb("#DDDDDD"))
        #v(10pt)
        #text(size: 9pt, fill: rgb("#999999"))[Aquacrafts B.V. — v5.0 mei 2026]
        #v(24pt)
        #image("../mkdocs/docs/images/orca325_cover.png", height: 200pt)
      ]
    ]
  ]
]

// ─────────────────────────────────────────────
// INHOUDSOPGAVE
// ─────────────────────────────────────────────
#pagebreak()
= Inhoudsopgave
#outline(title: none, depth: 3, indent: 1em)

// ─────────────────────────────────────────────
// HOOFDSTUK 1: ALGEMEEN
// ─────────────────────────────────────────────

= 1. Algemeen

== 1.1 Inleiding

Deze gebruiksaanwijzing is opgesteld om de veiligheid en het plezier bij het gebruik van uw DinghyGo opblaasbare 3-in-1 zeilboot te waarborgen. Deze handleiding bevat gedetailleerde informatie over het vaartuig, de uitrusting, de systemen en het gebruik en onderhoud ervan. Lees deze handleiding aandachtig door en bekijk de DinghyGo instructievideo's zorgvuldig; het is belangrijk dat u vertrouwd bent met het vaartuig vóór gebruik.

Deze gebruiksaanwijzing biedt geen cursus veiligheid of zeemanskunst. Als dit uw eerste ervaring met een vaartuig is, of als u niet vertrouwd bent met dit specifieke type vaartuig, zorg er dan voor dat u uw eigen veiligheid en comfort waarborgt door ervaring op te doen met het besturen en gebruiken van een vaartuig (zeilboot en motorboot) voordat u uw DinghyGo gebruikt.

Uw DinghyGo leverancier, nationale zeilbond of jachtclub kan u informeren over lokale zeiltechnieken en zeilclubs met gekwalificeerde instructeurs. Zorg ervoor dat uw DinghyGo geschikt is voor de verwachte wind- en zeeomstandigheden, en dat u en uw bemanningsleden de boot in die omstandigheden kunnen hanteren.

Deze gebruiksaanwijzing biedt geen gedetailleerde handleiding voor onderhoud of reparaties aan de boot.

Bij problemen kunt u contact opnemen met uw DinghyGo leverancier. Volg de onderhouds- en reparatie-instructies in deze handleiding voor een correcte verzorging van uw DinghyGo. Raadpleeg altijd opgeleide en bekwame specialisten voor onderhoud, reparaties of aanpassingen. Wijzigingen aan de boot die de veiligheid van het vaartuig kunnen beïnvloeden, mogen uitsluitend worden beoordeeld, uitgevoerd en gedocumenteerd door bevoegde personen. Uw leverancier, Aquacrafts B.V., kan niet verantwoordelijk worden gehouden voor aanpassingen die niet door hen zijn goedgekeurd. In sommige landen is een rijbewijs of vergunning vereist voor het besturen van dit vaartuig, en soms gelden specifieke regels. Zorg ervoor dat uw vaartuig altijd goed onderhouden is en houd er rekening mee dat slijtage optreedt na verloop van tijd, met name door intensief of oneigenlijk gebruik. Elke boot is gemaakt om robuust te zijn, maar uw boot kan ernstig beschadigd raken bij onjuist gebruik. Pas altijd de snelheid en richting van de boot aan uw omgeving aan. De bemanning moet vertrouwd zijn met alle veiligheids- en noodprocedures (man overboord, slepen, enz.). Zeilscholen en clubs organiseren regelmatig trainingssessies om u indien nodig te ondersteunen.

In sommige landen is het dragen van een reddingsvest of drijfhulpmiddel dat voldoet aan de nationale regelgeving te allen tijde verplicht.

Deze handleiding maakt gebruik van de volgende veiligheidssymbolen:

#warning[Duidt op een mogelijk gevaarlijke situatie die, als zij niet wordt vermeden, tot letsel of overlijden kan leiden.]

#danger[Duidt op een dreigende gevaarlijke situatie die, als zij niet wordt vermeden, tot ernstig of dodelijk letsel zal leiden.]

#caution[Duidt op een mogelijk gevaarlijke situatie die, als zij niet wordt vermeden, tot licht of matig letsel of materiële schade kan leiden. Kan ook waarschuwen tegen onveilige handelingen.]

#note[Bewaar deze handleiding op een veilige plaats en geef deze door aan de nieuwe eigenaar als u uw DinghyGo doorverkoopt.]

== 1.2 CE Categorie

Uw DinghyGo is bedoeld voor gebruik als een *Categorie D* vaartuig:

Categorie D. Een vaartuig ontworpen voor gebruik bij wind tot en met windkracht 4 op de schaal van Beaufort, en de bijbehorende significante golfhoogte tot en met 0,3 meter, met incidentele golven van maximaal 0,5 m hoogte. Dergelijke omstandigheden komen voor in beschutte kust- en binnenwateren, waaronder kleine baaien, kleine meren, rivieren en kanalen bij gunstige weersomstandigheden.

#advice[De golfhoogte is de gemiddelde hoogte van het hoogste derde deel van de golven, wat ongeveer overeenkomt met de golfhoogte zoals geschat door een ervaren waarnemer. Sommige golven kunnen echter twee keer zo hoog zijn.]

#warning[
  Neem de juiste voorzorgsmaatregelen als het vaartuig wordt gebruikt vanaf een moederschip op open zee. Verlies het moederschip nooit uit het oog!

  *Draag altijd een reddingsvest!*
]

== 1.3 ABYC Standard

Uw DinghyGo voldoet aan de American Boat & Yacht Council (ABYC) H-28 Type 1 Inflatable Boats standaard.

== 1.4 Capaciteitsplaatje

Het capaciteitsplaatje met informatie van DinghyGo fabrikant Aquacrafts B.V. bevindt zich aan de binnenzijde van de spiegel van de boot.

#figure(
  image("../mkdocs/docs/images/image_02.png", width: 80%),
  caption: [Afbeelding van het capaciteitsplaatje (Orca 325)],
  supplement: none,
)

Toelichting op het capaciteitsplaatje:

- a. Naam van de fabrikant
- b. Bootmodel, type en versie
- c. Bootcategorie — zie Tabel 2.1
- d. CE-markering
- e. ISO 6185 onderdeel & type
- f. Maximale belasting (personen + buitenboordmotor + brandstof + uitrusting)
- g. Maximaal vermogen en gewicht buitenboordmotor
- h. Maximale capaciteit / aantal personen
- i. Maximaal zeiloppervlak
- j. Maximale druk van de luchtkamers en bodem

== 1.5 Nationale regelgeving

Controleer vóór gebruik de lokale regelgeving om te zien of er beperkingen gelden voor het water waarop u wilt varen. Wees extra alert op beperkingen met betrekking tot zeilen, snelheid, het gebruik van het zeiltuig of de buitenboordmotor, geluidsbeperkingen op het water, enz.

== 1.6 Algemene veiligheidsinformatie

#advice[Advies voor veilig varen

Om veilig van de wateren te genieten, dient u vertrouwd te zijn met lokale en andere overheidsregelingen en beperkingen voor de pleziervaart. Houd rekening met de volgende aanbevelingen:]

- Gebruik reddingsvesten of drijfhulpmiddelen. Zorg ervoor dat voor elke persoon aan boord een geschikt reddingsvest of drijfhulpmiddel beschikbaar en gemakkelijk bereikbaar is (in sommige landen wettelijk verplicht).
- Overschrijd de maximale aanbevolen belasting niet. Neem bij twijfel contact op met uw DinghyGo leverancier.
- Voer veiligheidscontroles en vereist onderhoud uit. Volg een vast schema en zorg ervoor dat alle reparaties correct worden uitgevoerd.
- Zorg ervoor dat u alle toepasselijke vaar- en scheepvaartregels kent en deze naleeft.

#advice[Zorg ervoor dat iedereen in de boot correct zit. Ga niet zitten op enig deel van de boot of het zeiltuig dat niet bedoeld is als zitplaats.]

Dit geldt voor de randen van de spiegel, de boeg en het dek, waar plotselinge onverwachte versnelling iemand uit zijn evenwicht kan brengen. Plotseling stoppen, onverwacht controleverlies over de boot of het zeiltuig, en plotselinge bootbewegingen kunnen ertoe leiden dat een persoon overboord of in de boot wordt geslingerd.

#advice[Zorg ervoor dat u NOOIT onder invloed bent van alcohol of drugs tijdens het varen (wettelijk verplicht). Alcohol- en drugsgebruik beïnvloeden uw oordeelsvermogen negatief en verminderen uw reactievermogen op het water aanzienlijk.]

Bereid, indien mogelijk, anderen in de boot voor op het geval dat de bestuurder arbeidsongeschikt raakt of overboord valt: instrueer ten minste één andere persoon in de basisbeginselen van het zeilen, starten en bedienen van de buitenboordmotor en het sturen van de boot.

#advice[Zet de buitenboordmotor altijd uit wanneer passagiers aan boord gaan, uitstappen of zich achter in de boot bevinden. Het zetten van de buitenboordmotor in de vrije stand is niet veilig genoeg.]

Let goed op. De bestuurder van de boot is wettelijk verantwoordelijk voor goed uitkijken en luisteren. De bestuurder moet een onbelemmerd zicht hebben, met name naar voren. De passagiers en lading mogen het zicht van de bestuurder niet belemmeren wanneer de boot in beweging is.

#advice[Stuur uw boot nooit direct achter een waterski-er (of wakeboarder), omdat deze kan vallen. Als de waterski-er 61 m (200 ft.) voor u vaart en uw boot rijdt met een snelheid van 20 km/u (12,5 mph), duurt het maar tien seconden om hem in te halen.]

Wees alert op vallende waterski-ers. De bestuurder moet de gevallen ski-er altijd kunnen zien en mag nooit achteruit naar de ski-er of naar iemand in het water rijden. Meld alle ongelukken.

// ─────────────────────────────────────────────
// HOOFDSTUK 2: SPECIFICATIES
// ─────────────────────────────────────────────

= 2. Specificaties, beschrijving en functies

== 2.1 Specificaties

De DinghyGo modellen vallen onder de bescherming van de Richtlijn Recreatievaartuigen 2013/53/EU. Een voorbeeld van een conformiteitsverklaring is als bijlage aan deze handleiding toegevoegd.

#text(size: 8.5pt)[
  #table(
    columns: (2fr, 1fr, 1fr, 1fr),
    inset: (x: 6pt, y: 4pt),
    stroke: 0.4pt + rgb("#CCCCCC"),
    fill: (col, row) => if row == 0 { rgb("#ED1C24") } else if calc.odd(row) { rgb("#FAFAFA") } else { white },

    table.cell(fill: rgb("#ED1C24"))[#text(weight: "bold", fill: white)[Model]],
    table.cell(fill: rgb("#ED1C24"))[#text(weight: "bold", fill: white)[Orca 280]],
    table.cell(fill: rgb("#ED1C24"))[#text(weight: "bold", fill: white)[Orca 325]],
    table.cell(fill: rgb("#ED1C24"))[#text(weight: "bold", fill: white)[Orca 375]],

    table.cell(colspan: 4, fill: rgb("#E8E8E8"))[#text(weight: "bold")[Boot — Specificaties]],
    [CE categorie], [D], [D], [D],
    [Aantal luchtkamers], [3], [3], [3],

    table.cell(colspan: 4, fill: rgb("#E8E8E8"))[#text(weight: "bold")[Afmetingen en gewicht \*]],
    [Lengte (ft/cm)], [9'2"/280], [10'7"/325], [12'3"/375],
    [Breedte (ft/cm)], [4'9"/150], [4'9"/150], [4'9"/150],
    [Diepgang (ft/cm)], [2'8"/85], [2'8"/85], [2'8"/85],
    [Tube diameter (in/cm)], [16"/40], [16"/40], [16"/40],
    [Gewicht (lbs/kg)], [60/27], [64/29], [71/32],

    table.cell(colspan: 4, fill: rgb("#E8E8E8"))[#text(weight: "bold")[Capaciteit (maximaal)]],
    [Personen (zonder/met zeiltuig)], [3/2], [4/2,5], [5/3],
    [Draagvermogen (lbs/kg)], [660/300], [880/400], [1.100/500],
    [Buitenboordmotor (kW/pk)], [4,5/6,0], [4,5/6,0], [4,5/6,0],
    [Druk drijvers/bodem (psi)], [3,6/10,2], [3,6/10,2], [3,6/10,2],
    [Pakmaten \*\* (LxBxH in)], [40"x21"x13"], [40"x28"x13"], [40"x28"x15"],
    [Pakmaten \*\* (LxBxH cm)], [100x54x32], [100x72x32], [100x72x38],

    table.cell(colspan: 4, fill: rgb("#E8E8E8"))[#text(weight: "bold")[Zeiltuig — Specificaties]],
    table.cell(colspan: 4, fill: rgb("#F4F4F4"))[#text(style: "italic")[Afmetingen en gewicht \*]],
    [Mastlengte (ft/cm)], [14'1"/430], [14'1"/430], [14'1"/430],
    [Gieklengte (ft/cm)], [7'4"/225], [7'4"/225], [7'4"/225],
    [Zeiloppervlak (sq.ft/m²)], [52/4,8], [60/5,6], [64/5,9],
    [Gewicht (lbs/kg)], [32/14], [33/15], [37/17],
    [Pakmaten \*\* (LxBxH in)], [47"x18"x7"], [47"x18"x7"], [47"x18"x8"],
    [Pakmaten \*\* (LxBxH cm)], [120x45x17], [120x45x18], [120x45x20],
  )
]

#v(3mm)
#text(size: 8pt, fill: rgb("#666666"))[\*) Specificaties kunnen 5% afwijken \ \*\*) Gewichten en pakmaten exclusief karton, verpakkingsmateriaal en tas.]

== 2.2 Bootmodel

DinghyGo is een opblaasbare drie-in-één zeilboot die zijn vorm, sterkte en drijfvermogen verkrijgt door met lucht gevuld te worden. De boot is ontworpen voor kleine tochten in beschutte en open wateren, zoals aangegeven in de sectie "CE Categorie". De verschillende DinghyGo modellen zijn gespecificeerd in de tabel modelspecificaties.

== 2.3 Aantal personen

#warning[Overschrijd het maximale aantal personen niet. Ongeacht het aantal personen aan boord mag het totale gewicht van personen en uitrusting de maximale aanbevolen belasting nooit overschrijden. Gebruik altijd de zitting.]

== 2.4 Draagvermogen

#warning[Overschrijd bij het laden van het vaartuig nooit de maximale aanbevolen belasting. Wees altijd voorzichtig bij het laden en verdeel de lading op de juiste wijze om het drijfvermogen te handhaven. Vermijd het plaatsen van zwaar gewicht op hoge plaatsen.]

De maximale aanbevolen belasting omvat uitsluitend:

- a. Het aantal personen van 75 kg elk. Als kinderen als bemanning meevaren, mag het maximale aantal personen worden verhoogd, mits het gewicht van elk kind niet meer dan 37,5 kg bedraagt en het totale gewicht niet wordt overschreden;
- b. Basisuitrusting inclusief zeiltuig en roeispaan onderdelen;
- c. Lading (indien aanwezig), droge faciliteiten, verbruiksvloeistoffen [niet vermeld onder d.] en diverse uitrusting die geen deel uitmaakt van het gewicht van de boot of vermeld is onder b., inclusief buitenboordmotor;
- d. Nuttige vloeistoffen (zoet water, brandstof) gevuld tot maximale capaciteit in draagbare tanks.

== 2.5 Zeiltuig

Het maximale zeiloppervlak van het zeiltuig (sailkit) is weergegeven in de "tabel modelspecificaties" en op het capaciteitsplaatje.

De installatie en het gebruik van het zeiltuig worden beschreven in de hoofdstukken "Montage en demontage", "Aanbevelingen voor veiligheid en gebruik" en de bijlage "Montage roer/Orca giek …" in deze handleiding.

#warning[Het gebruik van een te groot of niet-origineel zeiltuig kan het vaartuig ernstig beschadigen of persoonlijk letsel veroorzaken, met name bij te veel wind. Gebruik altijd het originele en bijpassende DinghyGo zeiltuig, waarvan het oppervlak kleiner dan of gelijk is aan het opgegeven maximale zeiloppervlak. Zeil nooit bij meer wind dan de opgegeven maximale windsterkte in de sectie "CE Categorie".]

== 2.6 Buitenboordmotor

Het maximale vermogen van deze boot is weergegeven in de "tabel modelspecificaties" en op het capaciteitsplaatje.

De installatie van de buitenboordmotor en verdere bedieningsinstructies worden beschreven in het hoofdstuk "Montage en demontage" in deze handleiding.

#danger[Het gebruik van een binnenboordmotor op maximaal vermogen kan leiden tot ernstig letsel, overlijden of schade aan het vaartuig.]

#danger[U kunt de controle over de boot verliezen bij het gebruik van de binnenboordmotor op volle snelheid. Er kunnen ongelukken gebeuren. De leverancier (Aquacrafts B.V.) kan niet verantwoordelijk worden gehouden voor deze handelingen.]

#warning[Wees voorzichtig bij het tanken: rook niet en verwijder gemorste brandstof onmiddellijk. Wees voorzichtig bij het installeren van de buitenboordmotor om schade aan de brandstofslang te voorkomen. Zorg ervoor dat geen brandbare materialen in contact kunnen komen met motoronderdelen.]

// ── 2.7 Tekeningen ─────────────────────────────
#pagebreak()
== 2.7 Tekeningen

// ── 2.7.1 ───────────────────────────────────────
#block(breakable: false)[
  === 2.7.1 Orca 280 — Zijaanzicht

  #figure(
    image("../mkdocs/docs/images/image_04.png", height: 195mm),
    caption: [Orca 280 — Zijaanzicht],
    supplement: none,
    placement: none,
  )
]

#pagebreak()
*Legenda*

#legenda((
  (1, "Masthoes"),
  (18, "Mast vergrendeling"),
  (2, "Zeillat"),
  (19, "Dek"),
  (3, "Windvaan"),
  (20, "Mast klem"),
  (4, "Schootoog"),
  (21, "Klitteband"),
  (5, "Achterlijkstrekker"),
  (22, "Voorlijkoog"),
  (6, "Giekeind"),
  (23, "Mastvoet"),
  (7, "Schootblok"),
  (24, "Mastvoethouder"),
  (8, "Schoot"),
  (25, "D-ring/sleepoog"),
  (9, "Schootblok met snelkoppeling"),
  (26, "Midzwaard"),
  (10, "Klitteband"),
  (27, "Zwaardkast"),
  (11, "Giek klem"),
  (28, "Flexibele zwaardkast"),
  (12, "Achterste giekdeel"),
  (29, "Zelfozer"),
  (13, "Zeilschootblok"),
  (30, "Roer"),
  (14, "Voorste giekdeel"),
  (31, "Roerpin"),
  (15, "Neerhaler pin"),
  (32, "Roerhouder"),
  (16, "Neerhaler"),
  (33, "Spiegel"),
  (17, "Giekkop"),
  (34, "Borgingsclip"),
))

// ── 2.7.2 ───────────────────────────────────────
#pagebreak()
#block(breakable: false)[
  === 2.7.2 Orca 375 — Zijaanzicht

  #figure(
    image("../mkdocs/docs/images/image_05.png", height: 195mm),
    caption: [Orca 375 — Zijaanzicht],
    supplement: none,
    placement: none,
  )
]

#pagebreak()
*Legenda* — Extra onderdelen (want & mastondersteuning)

#legenda((
  (60, "Masthoes opening"),
  (63, "Want"),
  (61, "Mastoog"),
  (64, "Wantklem (zwevend)"),
  (62, "Wantharpsluiting"),
  (65, "Want/davits D-ring"),
))

*Legenda* — Extra onderdelen (fok)

#legenda((
  (66, "Val"),
  (72, "Harpsluiting fok (schootoog)"),
  (67, "Valharpsluiting"),
  (73, "Boeg D-ring"),
  (68, "Fok bovenkant voorlijk"),
  (74, "Fokkeschoot oog"),
  (69, "Fok"),
  (75, "Fokkeschoot"),
  (70, "Valklem"),
  (76, "Fokkeschoot D-ring"),
  (71, "Fok onderkant voorlijk"),
  (0, ""),
))

// ── 2.7.3 ───────────────────────────────────────
#pagebreak()
#block(breakable: false)[
  === 2.7.3 Orca 280 — Bovenaanzicht

  #figure(
    image("../mkdocs/docs/images/image_06.png", width: 100%),
    caption: [Orca 280 — Bovenaanzicht],
    supplement: none,
    placement: none,
  )
]

#pagebreak()
*Legenda*

#legenda((
  (35, "Vloer ventiel (nr. 4)"),
  (48, "Roeidol"),
  (36, "Ventiel (nr. 1)"),
  (49, "Roeispaan"),
  (37, "Dek"),
  (50, "Ventiel (nr. 3)"),
  (38, "Handvat boeg"),
  (51, "Handvat achter"),
  (39, "Mast kraag"),
  (52, "Overloop"),
  (40, "Afstandshouder mastvoethouder"),
  (53, "Voorste spiegelplaat motor"),
  (41, "Overdrukventiel"),
  (54, "Achterste spiegelplaat motor"),
  (42, "Hijs-oog"),
  (55, "Helmstok"),
  (43, "Overdrukventiel bodem"),
  (56, "Carabijnhaak"),
  (44, "Zitting/zwaardkast"),
  (57, "Hijs- en overloopoog"),
  (45, "Lijn"),
  (58, "Ventiel (nr. 2)"),
  (46, "Bevestigingspees zitting"),
  (59, "Handvat achter"),
  (47, "3D bodem"),
  (0, ""),
))

// ── 2.7.4 ───────────────────────────────────────
#pagebreak()
#block(breakable: false)[
  === 2.7.4 Opklapbaar roer — Zij-/achteraanzicht

  #figure(
    image("../mkdocs/docs/images/image_07.png", height: 195mm),
    caption: [Opklapbaar roer — Zijaanzicht (links) en achteraanzicht (rechts)],
    supplement: none,
    placement: none,
  )
]

#pagebreak()
*Legenda*

#legenda((
  (1, "Roerblad"),
  (11, "Pinhouder (onder)"),
  (2, "Bouthouder"),
  (12, "Pin"),
  (3, "Helmstokhouder (achter)"),
  (13, "Boutbeschermer"),
  (4, "Helmstok"),
  (14, "Bout"),
  (5, "Helmstok spring veer"),
  (15, "Vleugelmoer"),
  (6, "Helmstokhouder (voor)"),
  (18, "Boutkop"),
  (7, "Pinhouder (boven)"),
  (20, "Boutkop"),
  (8, "Pin"),
  (0, ""),
  (9, "Borgingsclip"),
  (0, ""),
  (10, "Roerkop"),
  (0, ""),
))

// ─────────────────────────────────────────────
// HOOFDSTUK 3: MONTAGE EN DEMONTAGE
// ─────────────────────────────────────────────

= 3. Montage en demontage

#advice[Bekijk de DinghyGo instructievideo's over het monteren en demonteren van het vaartuig goed. U ontvangt deze instructievideo's bij uw DinghyGo. U kunt deze ook bestellen bij uw DinghyGo leverancier.]

== 3.1 Opblaasbare bodem

De DinghyGo boten zijn uitgerust met een opblaasbare bodem die goed gevuld moet worden. Het gebruik van de boot zonder een correct opgepompte bodem is onveilig, oncomfortabel en kan leiden tot schade aan de boot. Raadpleeg de sectie "Vullen van de opblaasbare bodem" voor instructies over het vullen van de opblaasbare bodem.

== 3.2 Ventielen

De ventielen van de boot zijn speciaal ontworpen voor veilig en comfortabel gebruik. De vlakke ventielen zijn ontworpen om het comfort in de boot te vergroten en schade aan de boot te voorkomen.

#align(center)[
  #image("../mkdocs/docs/images/image_08.png", width: 50%)
  #text(style: "italic", size: 9pt)[Afbeelding van een ventiel]
]

=== 3.2.1 Gebruik van het ventiel

- Verwijder de buitenste dop. Het ventiel is gesloten wanneer de middelste schroefdop bovenop staat.
- Om het ventiel te openen, plaatst u uw vinger op het midden van het ventiel en drukt u de middelste schroefdop naar beneden. Draai uw vinger ¼ slag met de klok mee totdat de knop vergrendelt.
- Om het ventiel te sluiten, drukt u de knop in en draait u uw vinger ¼ slag met de klok mee totdat de knop omhoogkomt.

=== 3.2.2 Pompaansluitingen

- Bevestig de mondstuk van de pomp (het uiteinde) aan het ventiel.
- Draai het naar rechts (met de klok mee) totdat het vastzit en begin te pompen.
- Blijf pompen totdat de boot volledig gevuld is.
- Koppel de pomp los als u klaar bent.
- Zorg ervoor dat de dop teruggeplaatst wordt (ter bescherming tegen vuil en schade).

=== 3.2.3 Controle bij ontsnappen van lucht

Als er lucht ontsnapt:

- Haal de ventielsleutel uit de reparatieset.
- Steek de sleutel in het ventiel en draai de sleutel met de klok mee. Controleer of het probleem is opgelost.
- Neem bij het ontdekken van een lek contact op met uw DinghyGo leverancier en raadpleeg de garantievoorwaarden.
- Neem de achterkant van het ventiel in uw handen en draai de ventielsteel naar links met de sleutel (tegen de klok in) en verwijder de steel.
- Controleer het ventiel op schade.
- Als er schade is (zie bijlage "Garantie"), neem het defecte ventiel dan mee naar uw DinghyGo leverancier. U ontvangt binnen de garantieperiode een nieuw ventiel.
- Smeer de ventielsteel in met silicone of zeepsop en installeer deze opnieuw.

== 3.3 Roeien uitrusting

Bij de boot worden twee roeispanen geleverd. De bladen kunnen van de schachten worden verwijderd voor gemakkelijk transport. De roeispanen moeten correct in de roeidollen worden geplaatst. Houd de roeispaan parallel aan de drijver met het blad naar voren gericht en steek de pin zo diep mogelijk in de roeidol. Draai de roeispaan vervolgens 180 graden naar buiten om deze in de roeidol te vergrendelen.

== 3.4 Zeiltuig

Uw DinghyGo wordt geleverd met een zeiltuig (sailkit), bestaande uit:

- Zitting (Orca 375 inclusief 2 fokkeschootklemmen) / zwaardkast
- Mastvoethouder
- Midzwaard
- Roer
- Sectionele mast
- Sectionele giek
- Zeil
- Lijnenset (schoten, want met klemmen, harpsluiting, elastiek midzwaard)
- Zeiltuig tas

De installatie en het optuigen van de zeiluitrusting wordt later in de handleiding inclusief de bijlagen beschreven.

== 3.5 Zitting

DinghyGo is uitgerust met een speciale zitting en een "bevestigingspees zitting" op beide drijvers, waarop de zitting wordt geschoven. De zitting fungeert tevens als bovenste sleuf voor de zwaardkast.

#advice[U moet de zitting installeren voordat u de boot volledig opblaast.]

== 3.6 Vullen van de drijvers

Rol de boot op de grond uit om deze met lucht te vullen. Verwijder scherpe voorwerpen van het oppervlak waarop de boot wordt opgeblazen.

- Controleer na het uitpakken van de boot of alle onderdelen aanwezig zijn.
- Controleer of de ventielen gesloten zijn. Dit doet u door een vinger in het ventiel te steken, de kleine grijze schroefdop in te drukken en deze iets naar rechts te draaien.
- Als de knop een beetje omhoogspringt, kunt u de boot met lucht vullen. (Om lucht uit de boot te laten, moet u de knop naar links draaien!)
- Gebruik de pomp die bij de boot is geleverd. Druk het mondstuk (het uiteinde) tegen het ventiel en draai naar rechts. De pomp vergrendelt op het ventiel.
- Pomp voldoende lucht in de boot om de juiste vorm te verkrijgen.

#advice[Alle luchtkamers moeten gelijkmatig worden opgepompt om schade aan de tussenschotten te voorkomen.]

#advice[Uw boot op de juiste manier op- en afblazen is essentieel voor de duurzaamheid van uw boot.]

=== 3.6.1 Volgorde van het vullen

Blaas de boot op in de oplopende volgorde van de nummers op de ventielplaatjes:

+ Voorste luchtkamer (nr. 1)
+ Zij-luchtkamers (nr. 2 & 3)
+ Bodem (nr. 4)

=== 3.6.2 Vullen van de luchtkamers

Stap 1: Pomp lucht in de voorste luchtkamer via het opblaasventiel totdat de opgegeven druk is bereikt.

Stap 2: Pomp lucht in de twee zij-luchtkamers in de juiste volgorde totdat de opgegeven druk is bereikt.

Als het opblazen in de juiste volgorde wordt uitgevoerd, heeft de boot de juiste druk en zal er geen vervorming van de drijvers optreden.

Stap 3: Sluit alle ventielen door de afsluitdoppen te plaatsen en met de klok mee te draaien.

#advice[Overschrijd nooit de waarden op het capaciteitsplaatje en de ventielplaatjes! Blaas de drijvers op tot 0,25 bar = 3,6 psi = 25 kPa en de bodem op 0,19 bar = 2,75 psi = 19 kPa (tolerantie ±20%). Blaas de Orca bodem op tot 0,7 bar = 10,2 psi = 70 kPa.]

#advice[Gebruik geen mechanische compressoren om uw boot op te blazen. De meegeleverde handpomp is afgesteld op de perfecte druk voor uw boot. U kunt desgewenst een elektrische pomp gebruiken die als optie verkrijgbaar is bij uw DinghyGo leverancier. Gebruik de juiste drukinstelling om correct op te blazen.]

#caution[Onjuist opblazen kan structurele schade aan uw vaartuig veroorzaken. Haal uw vaartuig uit direct zonlicht wanneer het buiten het water is. Direct zonlicht zorgt ervoor dat de lucht in het vaartuig uitzet, wat schade aan uw vaartuig veroorzaakt (behalve bij correct gebruik en onderhoud van het overdrukventiel).]

== 3.7 Vullen van de opblaasbare bodem

Als u de opblaasbare bodem volledig opblaast, klemmt deze zich vast tussen de drijvers en de spiegel.

Stap 1: Pomp lucht in de bodem via het ventiel, net als bij de drijvers, totdat de opgegeven druk is bereikt.

Stap 2: Sluit het ventiel door de afsluitdop te plaatsen en met de klok mee te draaien.

== 3.8 Op- en aftuigen van het zeiltuig

De zeiltuig tas bevat de complete zeiluitrusting. Leg alle zeilonderdelen uit om de installatie en het optuigen te vergemakkelijken.

=== 3.8.1 Installeren van de mastvoethouder, zitting en overloop

- Blaas de boeg en zij-drijvers gedeeltelijk op (lees de sectie "vullen van de luchtkamers"), zodat ze enige vorm hebben maar nog niet volledig op druk zijn. Blaas de bodem nog niet op.
- Schuif de mastvoethouder onder de drijvers totdat deze voor de afstandshouders van de mastvoethouder op de bodem (aan de voorkant van de boot) vastzit.
- Schuif de zitting / zwaardkast op de bevestigingspezen op de drijvers, totdat deze direct boven de opening van de zwaardkast in de bodem zit.
- Bevestig één uiteinde van de overloop aan het overloopoog van de spiegel en bevestig het andere uiteinde aan het andere overloopoog van de spiegel met de carabijnhaak.

=== 3.8.2 Opblazen van de boot

- Blaas de drijvers en de bodem volledig op (lees de sectie "vullen van de luchtkamers" en "vullen van de opblaasbare bodem"), zodat de mastvoethouder en de zitting / zwaardkast stevig worden ingeklemd.
- Bevestig vervolgens het flexibele deel van de zwaardkast met het klitteband aan de onderkant van de zitting / zwaardkast.
- Bevestig de roeispanen (lees de sectie "installeren van de roeispanen").

=== 3.8.3 Optuigen

- Zorg ervoor dat het roer en de Orca giek na uitpakken correct zijn gemonteerd conform de bijlage.
- Schuif de mast- en giekdelen in elkaar.
- Neem het zeil en steek de zeillaten erin.
- Schuif de mast in de masthoes van het zeil.
- Bevestig het want via de masthoes opening met de wantharpsluiting aan het oog van het bovenste mastdeel.
- Leid de fok val door de fokring aan het bovenste mastoog, bevestig de carabijnhaak aan de vallus boven de wantharpsluiting (alleen Orca 375).
- Plaats de mast in de mastvoet, door de mast kraag.
- Bevestig het want aan beide zijden van de drijvers door het want door de D-ring van de drijver te leiden en vast te zetten in de wantklem. Zorg ervoor dat de mast recht staat met slechts een kleine wantspanning.
- Bevestig de fok onderkant voorlijk met een harpsluiting aan de boeg D-ring en bevestig de carabijnhaak aan de fok bovenkant voorlijk. Hijs de fok, leid de val door de boeg D-ring, door de klem en maak strak (alleen Orca 375).
- Bevestig de giek aan de mast door het voorste uiteinde van de giek op de mast te klikken.
- Bevestig beide klittenbanden van het zeil aan de giek.
- Breng de neerhaler en achterlijkstrekker op de juiste spanning aan.
- Bevestig het schootblok met snelkoppeling aan de overloop.
- Bevestig de fokkeschoot aan het fokkeschoot oog, leid de schoot door de fokringen op de drijvers en maak een achtknoop. De schoot kan tijdens het zeilen diagonaal worden vastgezet in de zittingklemmen (Orca 375).

#warning[Zorg ervoor dat het zeiltuig recht door de mast kraag in de mastvoet tot op de bodem is gestoken.]

#warning[Zorg ervoor dat de mast recht staat en correct wordt ondersteund door het want dat aan de mast en beide kanten van de drijvers is bevestigd. Het onjuist bevestigen van het want kan leiden tot het loslaten van het zeiltuig, waardoor het vaartuig onbestuurbaar kan worden en de bemanning letsel kan oplopen.]

=== 3.8.4 Vaarklaar maken

- Bevestig het roer aan de spiegel. Zorg ervoor dat het roer is vergrendeld met de borgingsclip.
- Schuif het midzwaard door de zitting in de zwaardkast.
- Sluit de zelfozer.

#advice[Het midzwaard moet met het stompe profiel gericht naar de boeg in de zwaardkast worden gestoken. Een nat midzwaard maakt het gemakkelijker om in de zwaardkast te schuiven. Het meegeleverde elastiek, met de uiteinden tot een lus samengebonden, kan om het midzwaard en de zitting worden gelegd om het midzwaard in de gewenste positie te houden.]

#advice[De overloop moet over de helmstok van het roer worden bevestigd.]

#warning[Bevestig het roer met de borgingsclip. Onjuiste vergrendeling kan leiden tot verlies van het roer en daarmee controleverlies over de richting van het vaartuig, wat kan leiden tot levensgevaarlijke situaties.]

#warning[Vergrendel de helmstok altijd in de roerkop vóór het zeilen. Het roer kan anders beschadigd raken en leiden tot controleverlies over de richting van het vaartuig, wat levensgevaarlijke situaties kan veroorzaken.]

=== 3.8.5 Zeilen

Deze handleiding biedt geen zeiltechnieken en gaat ervan uit dat de bestuurder en passagiers over voldoende zeil-ervaring en kwalificaties beschikken. Uw DinghyGo leverancier of zeilclub kan u informeren over trainingsmogelijkheden, zoals zeilcursussen.

#warning[Zeil pas wanneer u en uw bemanning over voldoende zeilervaring beschikken en u kunt garanderen dat u weet hoe u moet reageren op de (verwachte) omstandigheden, veiligheidsrisico's, de prestaties van individuen en de werking van het vaartuig. Zorg ervoor dat de uitrusting van de bemanning en het vaartuig in orde is. Oneigenlijk gebruik, defecte uitrusting en ongeschikte omstandigheden kunnen levensgevaarlijke situaties veroorzaken.]

=== 3.8.6 Aftuigen

- Verwijder het roer van de spiegel door de borgingsclip in te drukken/los te maken.
- Verwijder het midzwaard uit de zwaardkast en zitting.
- Strijk de fok door de val uit de klem te trekken, strijk de fok en maak de fok bovenkant voorlijk los van de carabijnhaak. Maak de carabijnhaak los van de vallus, trek de val uit de fokring op de mast en de boeg D-ring (Orca 375).
- Ontkoppel het schootblok van de overloop door de snelkoppeling te openen.
- Maak het want los van de D-rings aan beide kanten van de drijvers door het want uit de wantklemmen te bevrijden.
- Til het zeiltuig recht omhoog uit de mastvoet door de mast kraag.
- Maak de achterlijkstrekker en neerhaler los en verwijder de giek van de mast.
- Neem de giekdelen uit elkaar.
- Verwijder de zeillaten uit het zeil, maak het want los van de mast door de wantharpsluiting te openen en schuif de masthoes van de mast.
- Neem de mastdelen uit elkaar.

=== 3.8.7 Deïnstalleren van de mastvoethouder en zitting

- Laat de bodem en drijvers gedeeltelijk leeglopen (lees de sectie "leeg laten lopen van de boot"), zodanig dat deze nog vorm hebben maar niet meer onder druk staan.
- Maak het flexibele deel van de zwaardkast los van de onderkant van de zitting.
- Schuif de zitting achteruit van de bevestigingspezen op de drijvers.
- Trek de mastvoethouder uit de afstandshouders vanuit de boeg van de boot. Het optillen van de boeg met één hand maakt het gemakkelijker om deze te verwijderen.
- Verwijder de roeispanen uit de roeidollen na ze 180 graden te draaien met het blad naar voren parallel aan de drijver en neem de roeispanen uit elkaar.

=== 3.8.8 Inpakken en opbergen van het zeiltuig

- Zorg ervoor dat alle onderdelen van het zeiltuig schoon en droog zijn. Onderdelen die in contact zijn geweest met (zout) zeewater moeten na gebruik onmiddellijk worden gewassen en gereinigd met zoet water.
- Leg de zeiltuig tas op de grond met de opening naar u toe gericht.
- Leg eerst het midzwaard en het roer in de zeiltuig tas en stapel vervolgens de losse mast- en giekdelen erop.
- Voeg de losse roeispaan-onderdelen toe aan de tas.
- Voeg de zitting en mastvoethouder toe aan de tas.
- Voeg het gevouwen zeil, de zeillaten en de lijnenset toe aan de tas.
- Voeg de gevouwen fok en de foklijnset toe aan de tas.
- Voeg als laatste de handpomp toe.
- Sluit de tas stevig met de riemen en gespen.
- Draag de tas aan de handgrepen.
- Draag en bewaar de tas op een beschutte, droge plek bij normale temperaturen, vrij van zware belasting, ongedierte, gevaarlijke stoffen en straling.

#advice[Bij het inpakken blijven de achterlijkstrekker, neerhaler en schoot met blokken aan de giek bevestigd. De overloop blijft aan de overloopogen in de spiegel van de boot bevestigd.]

== 3.9 Installeren van de roeispanen

De DinghyGo boten zijn uitgerust met deelbare roeispanen, roeidollen en een gecombineerde zitting en zwaardkast.

- Zorg ervoor dat de zitting correct is geïnstalleerd (lees de sectie "Installeren van de mastvoethouder, zitting en overloop").
- Om de roeispanen in de roeidollen te installeren, houdt u de roeispanen parallel aan de drijvers met het blad naar voren gericht (niet naar achteren, dat lukt niet) en steek de metalen bevestigingspin zo diep mogelijk in de roeidol.
- Draai vervolgens de roeispanen met de bladen naar buiten, zodat ze in de roeidol zijn vergrendeld en correct kunnen worden gebruikt.
- Wanneer de roeispanen niet worden gebruikt, kunnen ze langs de drijvers worden opgeborgen, vastgezet door de roeidollen en de elastische roeispaan-houders aan het achtereinde van de zij-drijvers.

#advice[Houd rekening met lokale omstandigheden voordat u met uw DinghyGo het water op gaat, of het nu met het zeiltuig, roeispanen of een buitenboordmotor is. Het is mogelijk dat het voortstuwingsvermogen van de boot niet sterk genoeg is om tegen een sterke getijden- of rivierstroming in te varen.]

#caution[Onjuiste bevestiging van de roeispanen kan schade veroorzaken aan de bevestigingspinnen en roeidollen. Verwijder indien nodig overtollig plastic van de onderkant van de roeidol-opening.]

== 3.10 Installeren van een buitenboordmotor

#advice[Raadpleeg de "tabel modelspecificaties" in deze handleiding voor het maximale vermogen en gewicht van de buitenboordmotor.]

#advice[Het gebruik van een buitenboordmotor die het maximale vermogen of gewicht overschrijdt, kan de volgende gevolgen hebben:
- Problemen met de manoeuvreerbarheid en/of de stabiliteit van de boot
- Wijzigingen in de ontworpen drijf- of vaareigenschappen van de boot
- Schade aan de boot, met name aan de gebieden rondom de spiegel]

#advice[Gebruik een noodstopschakelaar. Deze schakelt de buitenboordmotor uit als de bestuurder van de boot om welke reden dan ook de bediening heeft verlaten.]

#danger[Het gebruik van een buitenboordmotor met te veel vermogen of gewicht kan leiden tot ernstig letsel, overlijden of schade aan het vaartuig.]

=== 3.10.1 Monteren van de buitenboordmotor

- Zorg ervoor dat u in een veilige en stabiele positie staat.
- Vergrendel de buitenboordmotor zodat de beugel kan worden gekanteld, monteer vervolgens de buitenboordmotor op de spiegel met de knevelbouten.
- De buitenboordmotor moet in het midden van de spiegel worden gemonteerd voor correct gebruik. Zorg er bij het neerleggen van de buitenboordmotor op de spiegel voor dat de roerhouders niet worden beschadigd.
- De bevestigingsbeugel moet stevig op de spiegelplaten van de spiegel worden aangedraaid. Controleer dit periodiek, omdat bij sommige motoren de knevelbouten door trillingen kunnen losraken tijdens gebruik.

#caution[Er zijn mogelijk buitenboordmotoren die de roerhouders beschadigen bij bevestiging aan de spiegel. Controleer of uw buitenboordmotor past en laat deze indien nodig aanpassen door een specialist. U kunt ook contact opnemen met uw DinghyGo leverancier voor hulp.]

=== 3.10.2 Positie van de buitenboordmotor

De buitenboordmotor moet zodanig worden geïnstalleerd dat deze verticaal in het water staat in de normale bedieningspositie. Dit betekent dat de "cavitatieplaat" aan de onderkant van de buitenboordmotor horizontaal in het water staat wanneer de boot in de normale positie is. Op de meeste buitenboordmotoren is er een mogelijkheid om de hoek van de schacht ten opzichte van de bevestigingsbeugel aan te passen; raadpleeg uw buitenboordmotor leverancier als u niet zeker weet hoe u dit moet doen.

=== 3.10.3 Starten van de buitenboordmotor

- Trek de boot het water in.
- Vergrendel de buitenboordmotor in de juiste positie met de knevelbouten.
- Zorg ervoor dat u stevig staat en start dan de buitenboordmotor.
- Vermijd hoge snelheden bij het achteruitrijden met de boot. Water kan over de spiegel in de boot stromen.

#advice[Zorg ervoor dat de zelfozer in de spiegel gesloten is voordat u de boot het water in neemt.]

== 3.11 Leeg laten lopen van de boot

#advice[Zorg ervoor dat de boot schoon en droog is voordat u deze oprolt voor opslag. Verwijder zand en vuil dat aan het buitenste materiaal kan kleven.]

#advice[Laat de boot niet luchtkamer voor luchtkamer leeglopen. Laat de luchtkamers gelijkmatig leeglopen; dit voorkomt schade aan de tussenschotten in de boot.]

Leeg laten lopen:

- Leg de boot op de grond.
- Steek uw vinger in het ventiel en draai de grijze schroefdop naar rechts (voor meer informatie over ventielen, zie "de ventielen").
- Laat wat lucht uit de drijvers en de bodem.
- Zorg ervoor dat de binnenkant van de ventielkappen open is (zodat de lucht tijdens het vouwen naar buiten kan).
- Druk gelijkmatig op de hele boot om zoveel mogelijk lucht te verwijderen.

== 3.12 Opvouwen en inpakken van de boot

- Leg de boot op de grond.
- Verwijder alle zeil- en roeispaan-onderdelen, inclusief de zitting, mastvoethouder en roeispanen.
- Vouw de zij-drijvers naar het midden, zodat de hele boot even breed is als de spiegel.
- Vouw de boeg over het dek.
- Trek de boeg en het dek achterwaarts naar het einde van de zwaardkast.
- Vouw de ronde achterkanten van de drijvers naar het midden van de spiegel.
- Til de spiegel op en trek deze naar voren over het al gevouwen deel.
- Leg het compact gevouwen pakket op de uitgespreide boottas.
- Vouw de twee kleine en dan de twee grote tasdelen om het pakket en bevestig ze met de riemen en gespen.

== 3.13 Transport

=== 3.13.1 De boot uit het water tillen

Zorg ervoor dat er geen scherpe randen aanwezig zijn op de plek waar u de boot uit het water wilt tillen. Gebruik bij voorkeur de hijs-ogen of handvatten voor het tillen, en niet de lijnen.

=== 3.13.2 Slepen van de boot

#advice[Als de opblaasboot moet worden gesleept door een andere boot, moet deze leeg zijn:
- Verwijder het zeiltuig, de buitenboordmotor, de brandstoftank, de accu's en andere uitrusting.
- Sluit de zwaardkast in de bodem af met het meegeleverde flexibele inzetstuk (gemaakt van zwart EVA-materiaal), rol het flexibele deel van de zwaardkast op en sluit af voordat u het dichtmaakt.]

#advice[Belangrijk: Het handvat aan de boeg mag niet worden gebruikt voor slepen, ankeren of afmeren.
- Gebruik de metalen ringen aan bakboord en stuurboord van de boeg voor het slepen. Hierdoor blijft de boot stabiel achter het slepende jacht en voorkomt u schade aan uw boot.
- Bevestig een lijn tussen de sleepringen om een kruis te vormen. Bevestig een sleeplijn hieraan en sleep de boot op lage snelheid.]

#warning[
  - Sleep het vaartuig nooit met personen aan boord.
  - Controleer de sleeplijn regelmatig.
  - Controleer periodiek de sleepomstandigheden en zorg ervoor dat er geen water in het vaartuig komt.
]

// ─────────────────────────────────────────────
// HOOFDSTUK 4: VEILIGHEID EN GEBRUIK
// ─────────────────────────────────────────────

= 4. Aanbevelingen voor veiligheid en gebruik

== 4.1 Belangrijke veiligheidsinformatie

#advice[Noodstopschakelaar en koord

Het doel van het noodstopschakelaar-koord is om de buitenboordmotor uit te schakelen wanneer de bestuurder ver genoeg van zijn positie verwijderd raakt waardoor de schakelaar wordt geactiveerd. Dit is het geval wanneer de bestuurder per ongeluk overboord valt of te ver van zijn stuurstoel in de boot beweegt. Overboord vallen of per ongeluk van de stoel worden geslingerd zijn beide scenario's die waarschijnlijk optreden na onjuist gebruik, bijvoorbeeld door op de gangboordrand te zitten bij planersnelheden, opstaan bij planersnelheden, varen op planersnelheden in ondiep water of water met veel obstakels, door de greep op een helmstok die naar één kant trok los te laten, het gebruik van alcohol of drugs, of door bootmanoeuvres uit te voeren op gevaarlijk hoge snelheden.]

#align(center)[
  #image("../mkdocs/docs/images/image_09.png", width: 60%)
  #text(style: "italic", size: 9pt)[Tekening van de noodstopschakelaar]
]

Buitenboordmotoren met een helmstok en sommige afstandsbedieningseenheden zijn uitgerust met een noodstopschakelaar. Het koord van de noodstopschakelaar is gewoonlijk tussen 122 en 152 cm (4'-5') lang wanneer uitgestrekt. Het eerste deel moet aan één kant van de schakelaar worden bevestigd (zie "Tekening van de noodstopschakelaar", onderdeel b.) en een snelkoppeling (onderdeel a.) die aan het andere uiteinde aan de bestuurder moet worden bevestigd. Het koord is een spiraalkoord zodat het zo kort mogelijk is wanneer het niet uitgetrokken is, en zodat de kans op verstrengeling met nabijgelegen objecten zo klein mogelijk is.

De lengte van het uitgestrekte koord is zo afgestemd dat het risico op onbedoelde activering tot een minimum wordt beperkt. Als in een bepaalde situatie een korter koord gewenst is, kan het koord om de pols of het been van de bestuurder worden gewikkeld, of de bestuurder kan een knoop in het koord leggen. Hoewel de buitenboordmotor onmiddellijk wordt uitgeschakeld door de noodstopschakelaar te activeren, zal de boot blijven varen of uitlopen afhankelijk van de snelheid en de scherpte van de bocht. De boot zal echter geen volledige cirkel maken.

Wij raden sterk aan dat andere passagiers worden geïnstrueerd over de juiste start- en bedieningsprocedures, mochten zij de buitenboordmotor in een noodsituatie moeten bedienen.

#warning[Als de bestuurder van het vaartuig valt, dient u er rekening mee te houden dat het onmiddellijk uitschakelen van de buitenboordmotor de kans op overlijden of ernstig letsel door overrijden kan verkleinen. Bevestig de twee uiteinden van het noodstopschakelaar-koord stevig aan de noodstopschakelaar aan één kant en aan de bestuurder aan het andere uiteinde.]

#advice[Per ongeluk of onbedoeld activeren van de schakelaar tijdens normaal gebruik kan ook voorkomen. Dit kan één of meer van de volgende potentieel gevaarlijke situaties veroorzaken:
- Passagiers kunnen naar voren worden geslingerd door onverwacht stoppen.
- Verlies van vermogen en verlies van koerscontrole kunnen optreden bij zware zee, sterke stroming of harde wind.
- Verlies van stuurcontrole bij het aanleggen.]

#warning[Vermijd ernstig letsel of overlijden door sterke vertragingskrachten als gevolg van onbedoelde activering van de noodstopschakelaar. De bestuurder van het vaartuig mag zijn stuurpost nooit verlaten zonder eerst het noodstopschakelaar-koord van zijn lichaam los te koppelen.]

== 4.2 Controlelijst vóór gebruik

- Controleer de druk in de luchtkamers.
- Verwijder eventuele obstakels uit de zelfozer in de spiegel.
- Sluit de zelfozer van de spiegel.
- Zorg ervoor dat de mastvoethouder, zitting / zwaardkast en overloop correct zijn gemonteerd.
- Zorg ervoor dat de boot correct is opgetuigd en dat de mast in de mastvoet is geplaatst en met het veerslot onder het dek is vergrendeld.
- Zorg ervoor dat het midzwaard in de zwaardkast is geplaatst met de stompe kant gericht naar de boeg.
- Zorg ervoor dat het roer in de spiegel is vergrendeld en dat de helmstok in de roerkop is bevestigd.
- Zorg ervoor dat de overloop is bevestigd aan de overloopogen, dat deze over de helmstok gaat en is bevestigd aan het schootblok met de snelkoppeling.
- Zorg ervoor dat het want stevig is bevestigd met de wantharpsluiting aan het bovenste mastoog en aan de D-rings aan beide zijden van de drijvers met de wantklemmen.
- Zorg ervoor dat de harpsluiting van de fok onderkant voorlijk is bevestigd aan de boeg D-ring en dat de val stevig is bevestigd met de carabijnhaak aan de fok bovenkant voorlijk en door de fokring in de klem (alleen Orca 375).
- Zorg ervoor dat de buitenboordmotor stevig op de spiegel is gemonteerd en dat de zwaardkast is afgesloten met het meegeleverde inzetstuk als u met een buitenboordmotor wilt speedvaren of de boot wilt slepen.
- Zorg ervoor dat u de inhoud van de brandstoftank kent en de snelheid van de boot weet.
- Controleer of de noodstopschakelaar voor de buitenboordmotor correct werkt.
- Zorg ervoor dat de boot niet overbeladen is. Let erop dat het maximale aantal passagiers en de maximale belasting niet worden overschreden. Controleer het capaciteitsplaatje op de boot.
- Zorg ervoor dat er voor elke persoon aan boord een goedgekeurd en geschikt reddingsvest aanwezig is en dat deze gemakkelijk bereikbaar is.
- Controleer of de roeispanen aanwezig zijn en aan de boot zijn bevestigd in geval van problemen.
- De gebruiker is op de hoogte van veilige navigatie-, zeil- en bedieningsprocedures.
- Er is een reddingsband of drijvend kussen aan boord.
- Verdeel het gewicht van de passagiers en de lading gelijkmatig en zorg ervoor dat iedereen veilig is gezeten.
- Instrueer ten minste één passagier in de basisbeginselen van het varen voor het geval de bestuurder arbeidsongeschikt raakt of overboord valt.
- Vertel bij uw vertrek iemand waar u naartoe gaat en wanneer u verwacht terug te zijn.
- Gebruik geen alcohol of drugs.
- Zorg ervoor dat u vertrouwd bent met het weer, het water en het gebied waar u gaat varen.

#warning[
  - Het maximale voortstuwingsvermogen van het vaartuig (kW) is vermeld in de "tabel modelspecificaties" van deze handleiding.
  - Gebruik het vaartuig niet met een buitenboordmotor waarvan het vermogen groter is dan aangegeven op het capaciteitsplaatje van het vaartuig.
  - Gebruik het vaartuig niet met negatieve trim-instellingen van de buitenboordmotor (boeg omlaag) bij hoge snelheid.
  - Gebruik het vaartuig niet bij hoge snelheden op drukke vaarwegen of wanneer het zicht beperkt is, bij sterke wind of bij hoge golven.
  - Volg de vaarregels zoals vastgesteld door het COLREG.
  - Houd altijd voldoende afstand om te kunnen stoppen of uitwijken om aanvaringen te vermijden.
]

#warning[Bilgewater moet tot een minimum worden beperkt.]

== 4.3 Stabiliteit en drijfvermogen

=== 4.3.1 Plaatsen van passagiers en persoonlijke spullen

Voor de veiligheid raden wij aan dat passagiers zo dicht mogelijk bij het midden van de boot zitten. De positie van de passagiers heeft een directe invloed op de stabiliteit en de trim van de boot. U kunt aan de zijkant van de boot zitten, mits er tegenwicht wordt geboden aan de andere zijde, of als dit noodzakelijk is voor zeilmanoeuvres. Zorg ervoor dat losse uitrusting stevig is vastgemaakt.

=== 4.3.2 Zeilen

Het gebruik van de zeiluitrusting (het zeiltuig) beïnvloedt de bewegingsvrijheid van de passagiers en de stabiliteit van het vaartuig. De bestuurder moet achter de zitting op de bodem plaatsnemen, zodat hij het roer en de schoot correct kan bedienen. Bij hogere windsnelheden kan het noodzakelijk zijn dat de bestuurder op de bovenwindse drijver gaat zitten om de boot in evenwicht te houden en omslaan te voorkomen.

Passagiers moeten achter of voor de zitting op de bodem zitten, zodat de bediening van de zeilboot niet wordt gehinderd en de persoonlijke veiligheid niet in gevaar wordt gebracht.

Passagiers dragen een gedeelde verantwoordelijkheid voor het handhaven van de stabiliteit van de zeilboot, zoals het helpen voorkomen van omslaan door hun zitposities aan te passen.

#warning[Misbruik van het zeiltuig, plotselinge veranderingen in zeilgedrag of gevaarlijke omstandigheden kunnen leiden tot onverwachte bewegingen van het zeiltuig, waardoor onderdelen van het tuig (met name de giek) hoofdletsel of dodelijk letsel kunnen veroorzaken.]

=== 4.3.3 Roeien

De positie van de roeispanen zorgt voor een comfortabele roeipositie. Gebruik de meegeleverde roeizitting / zwaardkast om optimaal gebruik te maken van de roeimogelijkheden.

#warning[Op de gecombineerde roeizitting en zwaardkast mag maximaal één volwassene van maximaal 75 kg of twee kinderen van 37,5 kg zitten. Meer gewicht dan gespecificeerd, of staan of springen op de zitting kan schade aan de zitting en het vaartuig veroorzaken en daarmee (ernstig) letsel veroorzaken.]

=== 4.3.4 Buitenboordmotor

De bodem van DinghyGo is ontworpen in een "V"-vorm. Dit verbetert de vaareigenschappen (met name bij aan de wind zeilen) en het gebruik van de buitenboordmotor. Het is daarom ook mogelijk om met uw DinghyGo over het water te planeren.

#caution[Vermijd bij het varen op hoge snelheden of bij (aqua)planeren abrupte bochten en hoge golven; dit kan de passagiers in gevaar brengen. Zorg ervoor dat iedereen zich vasthoudt aan de veiligheidslijnen. Verminder voor comfort en veiligheid uw snelheid bij hoge golven. Kleine kinderen moeten binnen in het vaartuig zitten. Een brekende golf vormt een ernstig gevaar voor de stabiliteit van het vaartuig. *Draag altijd een reddingsvest!*]

#advice[Springen over golven en kielzog: Bij het varen met een plezierboot is het onvermijdelijk dat u golven en kielzog tegenkomt. Wanneer dit echter met zo'n hoge snelheid wordt gedaan dat de boot gedeeltelijk of volledig uit het water wordt gedrukt, ontstaan er bepaalde gevaren, met name op het moment dat de boot het water weer raakt.]

#advice[Het grootste gevaar is dat de boot van richting verandert tijdens de sprong. Een scherpe koersverandering kan passagiers uit de boot of van hun plaatsen slingeren.]

#advice[Een andere gevaarlijke situatie kan ontstaan doordat de boeg van de boot ver genoeg in de lucht komt en onder het wateroppervlak komt wanneer deze het water raakt. Dit brengt de boot onmiddellijk tot stilstand en kan passagiers naar voren slingeren.]

#advice[Als de snelheid wordt verhoogd zal de boeg vaak een opwaartse beweging maken. Dit kan het zicht van de bestuurder tijdelijk belemmeren. Als u tijdens het varen sterke wind tegenkomt en de boeg omhoog wijst, kan de wind de boot verder omhoog blazen (en in extreme gevallen omslaan).]

#warning[Vermijd ernstig of dodelijk letsel als gevolg van vallen in het vaartuig wanneer het neerkomt na het springen over een golf of kielzog. Vermijd zoveel mogelijk het springen over golven en kielzog. Instrueer alle passagiers om te bukken en zich vast te houden aan de handgrepen van het vaartuig wanneer het vaartuig over een golf of kielzog springt.]

#advice[Een enkele bestuurder: Als u de boot zonder passagiers gebruikt, ga dan niet op de zij-drijvers zitten. Uw gewicht moet zo ver mogelijk naar voren en naar het midden worden geplaatst.]

#advice[Vermijd zware belasting aan de spiegel. Snelle acceleratie moet worden vermeden om te voorkomen dat de bestuurder achterover wordt geslingerd.]

#advice[Wind- en golfomstandigheden kunnen zeer gevaarlijk zijn voor uw DinghyGo. U kunt omslaan als de lading niet gelijkmatig is verdeeld, met name als er te weinig gewicht aan de boeg is en wind en getij tegen de boot in werken.]

#advice[De anticavitatieplaat van de motor moet ongeveer 20 mm onder de onderkant van de spiegel zitten. Als uw buitenboordmotor te hoog is ingesteld, ervaart u veel cavitatie. Als uw buitenboordmotor te laag is ingesteld, zal dit weerstand veroorzaken en zal er water in de boot komen. Raadpleeg uw DinghyGo leverancier of buitenboordmotor leverancier.]

#advice[Wij raden aan de boot op alle snelheden horizontaal te houden. Gebruik het gewicht van de passagiers om ervoor te zorgen dat de boot horizontaal ligt.]

#advice[Bochten nemen: Verminder de snelheid bij het maken van een scherpe bocht. De boot zal aanzienlijk kantelen naar het midden van de rotatie.]

== 4.4 Gevaren en risico's

#advice[Gevaren in het water: Wrakken, riffen, rotsen, zandbanken en ondiep water moeten worden vermeden of zeer voorzichtig worden benaderd. Als u niet vertrouwd bent met het gebied, vraag dan informatie over lokale risico's voordat u de boot gebruikt. Wees voorzichtig met aflandige winden en stroming.]

#advice[Defecte luchtkamers en beschadigde drijvers: Uw DinghyGo is ontworpen om te werken met meer dan één luchtkamer. Daarom behoudt de boot altijd ten minste 50% van het drijfvermogen, zelfs als er een lek ontstaat in één van de luchtkamers. Verschuif in dat geval het gewicht naar de andere kant. Zeker de lekkende luchtkamer indien nodig en ga onmiddellijk naar de dichtstbijzijnde oever of het moederschip. Wees voorzichtig voor ondiep water of riffen.]

#advice[Strandlanding: Het is niet aan te raden op het strand te varen of de boot over rotsen, zand, grind of verharding te slepen met de buitenboordmotor draaiend of met de complete zeiluitrusting operationeel. De boot en onderdelen van het zeiltuig zoals het midzwaard en het roer kunnen beschadigd raken.]

#advice[Davits: Als de boot in davits is opgehangen, moet u de zelfozer openen zodat de boot zich niet met water kan vullen en te zwaar wordt. Zorg ervoor dat er geen verstoppingen optreden.]

#advice[Zonlicht: Zorg ervoor dat de boot niet te lang aan de zon wordt blootgesteld. De veranderende luchtdruk in de drijvers en de bodem kan schade aan de boot veroorzaken. Langdurige extreme zonblootstelling kan het verouderingsproces van de materialen versnellen. Als de boot voor langere tijd uit het water wordt gehaald, dek de boot dan af om blootstelling aan direct zonlicht te voorkomen.]

#advice[Roken: Rook niet, met name niet bij het tanken.]

#advice[Brandstoftank: Plaats draagbare tanks op een zachte ondergrond en bevestig ze stevig aan de boot met een riem. Verwijder draagbare tanks uit de boot bij het vullen ervan. Vul de tanks in de open lucht, uit de buurt van warmte, vonken of open vuur. Vul de tanks niet volledig tot de rand.]

#advice[Gebruik op grote hoogte: De normale druk van de drijvers/bodem is 0,25/0,70 bar. Als de boot op zeeniveau wordt opgeblazen en vervoerd boven zeeniveau, bijv. voor gebruik in een bergmeer, moet de druk worden verlaagd om te voorkomen dat de druk te hoog wordt. Een correct functionerend overdrukventiel regelt dit vanzelf.]

#danger[Zet uw buitenboordmotor uit en stop de schroef wanneer mensen in de buurt van uw vaartuig zwemmen. De schroef kan zeer gevaarlijk zijn voor mensen of objecten in het water. *Zet de buitenboordmotor onmiddellijk uit als u zwemmers in de buurt van uw vaartuig ziet.*]

// ─────────────────────────────────────────────
// HOOFDSTUK 5: ONDERHOUD
// ─────────────────────────────────────────────

= 5. Onderhoud

== 5.1 Algemeen onderhoud

Reinigingsproducten / schoonmaakmiddelen

Gebruik huishoudelijke schoonmaakmiddelen spaarzaam en gooi ze nooit in het water. Meng nooit verschillende soorten schoonmaakmiddelen en zorg voor voldoende ventilatie in afgesloten ruimtes. Gebruik nooit sterke reinigingsmiddelen, oplosmiddelen of producten die fosfaten, chloor, oplosmiddelen, niet-biologisch afbreekbare producten of op aardolie gebaseerde producten bevatten. Op citroenzuur gebaseerde reinigingsmiddelen zijn uitstekend voor maritieme reiniging en veilig voor u en het milieu. Uw DinghyGo reinigt u het beste met zoet water en een normaal huishoudelijk reinigingsmiddel.

#advice[Reinigingsmiddelen die alcohol of koolwaterstoffen bevatten mogen niet worden gebruikt op het buitenmateriaal van de boot. Deze producten zullen het buitenmateriaal voortijdig uitdrogen of beschadigen.]

#warning[Vermijd ernstig/dodelijk letsel door brand, explosies of vergiftiging. De lijm en oplosmiddelen die worden gebruikt voor de reparatie van de opblaasbare delen zijn giftig en zeer ontvlambaar. Als voorzorgsmaatregel is het belangrijk dat u altijd buiten of in een goed geventileerde ruimte werkt en uit de buurt van open vuur, vonken of apparaten met een waakvlam. Inademing van dampen en blootstelling aan de huid kunnen schadelijk zijn voor uw gezondheid. Vermijd het inademen van dampen en contact met de huid en ogen door een koolstoffilter ademhalingsmasker en beschermende kleding te dragen over alle blootgestelde lichaamsdelen.]

== 5.2 Reparaties

=== 5.2.1 Kleine reparaties

Wij raden u sterk aan contact op te nemen met uw DinghyGo leverancier als uw boot beschadigd is.

Als de schade bestaat uit een klein gaatje, kunt u het reparatiemateriaal uit de reparatieset gebruiken.

Voor grotere schade of in gevallen waarbij de plakkers over een naad moeten worden aangebracht, moet een professionele reparateur de schade herstellen. Neem contact op met uw DinghyGo leverancier voor het dichtstbijzijnde reparatieadres.

De beste resultaten bij het lijmen worden bereikt wanneer de relatieve luchtvochtigheid minder dan 60% is, de omgevingstemperatuur tussen 18°C en 25°C (65°F-77°F) ligt en er geen direct zonlicht is.

Algemene procedure:

- Snijd een plakker die groot genoeg is om de schade aan alle zijden met 30 mm te overlappen.
- Leg de overlappende plakker over het beschadigde gebied en teken de omtrek van de plakker af met een potlood.
- Schuur het gemarkeerde gebied met schuurpapier glad (niet zo veel dat de draden van het materiaal zichtbaar worden).
- Reinig de plakker en het gebied rondom het gaatje met een oplosmiddel (bijv. MEK).
- Breng met een korte borstel twee dunne lagen lijm in cirkels aan op de achterkant van de plakker en op het gebied van de boot waar de plakker zal worden aangebracht. Laat de eerste laag volledig drogen (ongeveer 15 minuten) voordat u de tweede laag aanbrengt. De tweede laag moet drogen tot hij iets kleverig aanvoelt en breng dan de plakker aan door deze stevig aan te drukken. Gebruik een glad object om eventuele luchtbellen onder de plakker te verwijderen, werkend van het midden naar buiten.
- Wacht 24 uur voordat u de boot opnieuw opblaast.

=== 5.2.2 Luchtlek in drijver of bodem als gevolg van een scheur

I. Luchtlek als gevolg van een L-vormige scheur

- Beoordeel de grootte van de scheur met uw vingers en schat in of u een kleine borstel aan de binnenkant van de scheur kunt gebruiken. Als u uw vingers niet in de scheur kunt steken, maak de scheur dan groter met een mes zodat u voldoende ruimte heeft. Maak een plakker van versterkt PVC-materiaal van 0,7 mm dikte (uit de reparatieset) en zorg ervoor dat deze groot genoeg is om de scheur volledig te bedekken.
- Reinig één kant van de plakker en de binnenkant van de scheur met een oplosmiddel (bijv. MEK). Breng vervolgens lijm aan op de gereinigde gebieden.
- Wacht 15-20 minuten en controleer of de eerste laag lijm droog is. Breng een tweede laag lijm aan op dezelfde plaatsen en wacht nog eens 15-20 minuten totdat de lijm droog is.
- Steek de plakker in de scheur en leg deze onder de scheur. Druk zachtjes op het bijbehorende bovendeel en oefen druk uit met een stevig drukhulpmiddel, als de plakker op de juiste plaats zit, om een sterke hechting te verkrijgen.
- Laat de luchtkamer leeg tot 70-80% van de aanbevolen luchtdruk en breng zeepsop aan op het afgesloten gebied om luchtlekken te detecteren.
- Als er geen lek is, droog de gebieden dan volledig. U brengt nu een plakker aan op de buitenkant van de scheur.
- Maak een plakker van hetzelfde formaat van PVC-materiaal (0,9 mm, inbegrepen in de reparatieset) en herhaal de bovenstaande procedure.

#caution[Een gerepareerde luchtkamer moet ten minste 24 uur drogen bij een luchtdruk van minder dan 80% van de aanbevolen luchtdruk. Volledig opblazen dat te vroeg na de reparatie plaatsvindt, kan leiden tot slechte hechting van de plakkers.]

II. Luchtlek als gevolg van een rechte snede of een klein gaatje

- Beoordeel de grootte van de scheur met uw vingers en schat in of u een kleine borstel aan de binnenkant van het gaatje kunt gebruiken. Als u uw vingers niet in het gaatje kunt steken, maak de scheur dan groter met een mes zodat u voldoende ruimte heeft. Maak vervolgens een plakker van versterkt PVC-materiaal (0,7 mm dik) die iets langer is dan het gaatje en een breedte heeft van ongeveer 20-30 mm, zodat de snede volledig kan worden bedekt.
- Volg de hierboven beschreven procedure. Blaas de luchtkamer op tot minder dan 80% van de aanbevolen luchtdruk en laat deze 24 uur drogen op een droge plek.

Neem contact op met uw lokale DinghyGo leverancier bij problemen.

== 5.3 (Winter-)opslag

#advice[Om verkleuring van de romp of luchtkamers als gevolg van aanslag of vervuild water te voorkomen, laat u de boot niet langdurig in het water liggen.]

- Na het varen moeten de boot en alle onderdelen worden gewassen met zachte zeep en vervolgens worden afgespoeld met zoet water. Droog alle onderdelen voordat u ze opbergt in de draagtas. Dit voorkomt schimmel.
- Onderdelen met een houten kern (bijv. spiegel, dek, zitting en mastvoethouder) moeten worden geïnspecteerd op schade aan de beschermlaag. Krassen, schuren en andere schade die het onderliggende houtwerk in contact met water kan brengen, moeten worden bijgewerkt en afgedicht met PVC of polyester.
- Om de boot er als nieuw uit te laten zien, bewaart u hem op een koele, droge plek en zorgt u ervoor dat hij niet te lang wordt blootgesteld aan direct zonlicht.
- Een bootzeil is als accessoire beschikbaar om uw boot tijdens de opslag te beschermen.
- Als u van plan bent uw boot voor langere tijd op te slaan, moet u hem uit de meegeleverde tas halen. De boot is te strak gevouwen in de tas, wat scherpe vouwen in het materiaal veroorzaakt.
- In plaats van de boot in de tas op te slaan, rolt of vouwt u de boot los en bewaart u hem in een droge omgeving voor langdurige opslag.
- Plaats geen zware voorwerpen op de boot om schade tijdens de opslag te voorkomen.
- Vermijd de aanwezigheid van knaagdieren, insecten en andere ongedierte die schade veroorzaken.

// ─────────────────────────────────────────────
// HOOFDSTUK 6: MILIEU
// ─────────────────────────────────────────────

= 6. Milieu

Houd u aan milieuwetten, -procedures en -verantwoordelijkheden.

== 6.1 Afvoeren van verontreinigende stoffen

Zorg ervoor dat er geen verontreinigingen in het water rondom de boot terechtkomen. Houd er rekening mee dat het gebruik van het water voor watersport u de verantwoordelijkheid geeft om een schone omgeving te waarborgen.

== 6.2 Verwijderen en afvoeren van afval

"Afval" is de verzamelnaam voor alle soorten waterverontreiniging, afvoer van plastic, verpakkingen, voedsel, hout, schoonmaakmiddelen, riolering en zelfs stukken vis — kortom, bijna alles. Wij raden u aan ervoor te zorgen dat u al uw afval mee terugneemt naar land en dit op verantwoorde wijze afvoert. In veel gebieden is het lozen van afvalwater in waterwegen strikt verboden.

== 6.3 Aanbevolen snelheden

Wees voorzichtig bij het varen op hoge snelheden, omdat deze:

- Uzelf en anderen, of mensen en objecten die zich in het water bevinden, in gevaar kunnen brengen;
- Aanzienlijke golven achter de boot kunnen veroorzaken, wat schade kan veroorzaken;
- Onnodige geluidsoverlast voor medevaarders kunnen veroorzaken.

== 6.4 Geluidshinder

"Geluid" kan het geluid van de buitenboordmotor zijn, maar ook de stemmen van mensen. Op veel vaarwegen geldt een geluidslimiet. Muziek en luide gesprekken zijn op het water veel verder hoorbaar dan op het land, met name 's nachts. Vermijd geluidshinder.

== 6.5 Uitlaatemissies

Verhoogde uitlaatemissies (koolwaterstoffen) veroorzaken verontreiniging van water en lucht. Houd uw buitenboordmotor goed afgesteld en houd de romp van de boot schoon voor optimale prestaties. Raadpleeg de handleiding van de buitenboordmotor voor informatie of neem contact op met uw DinghyGo leverancier.

// ─────────────────────────────────────────────
// BIJLAGE: INSTRUCTIEVIDEO'S
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Bijlage — Instructievideo's
]

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 6pt, y: 4pt),
  stroke: 0.3pt + rgb("#CCCCCC"),
  fill: (col, row) => if row == 0 { rgb("#E8E8E8") } else if calc.odd(row) { rgb("#FAFAFA") } else { white },
  table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 9pt)[Nr.]],
  table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 9pt)[Video]],
  table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 9pt)[Duur]],
  [1], [#link("https://www.youtube.com/watch?v=zxRh_Q_bZgk")[Uitpakken tassen]], [0:49 min],
  [2], [#link("https://www.youtube.com/watch?v=oUOsj_yCgS0")[Opblazen]], [1:39 min],
  [3], [#link("https://www.youtube.com/watch?v=gg9_5FmfOgU")[Monteren]], [2:42 min],
  [4], [#link("https://www.youtube.com/watch?v=w_W0ky6Qbvc")[Installeren]], [1:32 min],
  [5a], [#link("https://www.youtube.com/watch?v=_40ACnecYRE")[Optuigen]], [2:42 min],
  [5b], [#link("https://www.youtube.com/watch?v=xHW386UeXBk")[Optuigen fok]], [2:15 min],
  [5c], [#link("https://www.youtube.com/watch?v=bDZj2TI22kE")[Rif aanbrengen]], [0:48 min],
  [6a], [#link("https://www.youtube.com/watch?v=4Nv_KuIP8kc")[Vaarklaar maken]], [0:43 min],
  [6b], [#link("https://www.youtube.com/watch?v=nhVdMYadaSI")[Zwaardkast afdichten (optioneel)]], [0:46 min],
  [7a], [#link("https://www.youtube.com/watch?v=y6SufQDWvW4")[Aftuigen]], [2:21 min],
  [7b], [#link("https://www.youtube.com/watch?v=AsbNRM45bjU")[Aftuigen fok]], [1:22 min],
  [8], [#link("https://www.youtube.com/watch?v=x4nvKOW4H1c")[Deïnstalleren en leeg laten lopen]], [1:17 min],
  [9], [#link("https://www.youtube.com/watch?v=h08_MPSnieg")[Inpakken boot]], [2:35 min],
  [10], [#link("https://www.youtube.com/watch?v=3k8-jmAr4XQ")[Inpakken sailkit]], [1:36 min],
)

// ─────────────────────────────────────────────
// BIJLAGE: GARANTIE
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Bijlage — Garantie
]

_Deze garantiebepalingen maken deel uit van de Algemene Voorwaarden van Aquacrafts B.V._

=== Artikel 16 GARANTIE

*16.1.* De leverancier garandeert dat het geleverde product de eigenschappen heeft die nodig zijn voor normaal gebruik, vrij van gebreken, rekening houdend met alle omstandigheden.

*16.2.* Rekening houdend met de hierboven vermelde garanties, garandeert de leverancier de afwezigheid van constructiefouten die ontstaan na de levering van het product aan klanten gedurende een periode van 12 maanden. Voor leveringen aan klanten in EU-landen garandeert de leverancier een aanvullende periode van 12 maanden.

*16.3.* De garantie is geldig na registratie van de contact- en adresgegevens van de klant bij de leverancier of diens vertegenwoordiger, samen met het serienummer (vaartuigidentificatienummer) van het geleverde product.

*16.4.* De klant heeft recht op kosteloos herstel van constructiefouten van het product door de leverancier binnen de toepasselijke garantieperiode. De garantie dekt scheuren, porositeit, rot en delaminatie van het materiaal en loslatende naden. Eventuele transportkosten zijn voor rekening van de klant.

*16.5.* De klant heeft recht op kosteloos herstel van constructiefouten en heeft recht op vervanging van gerelateerde componenten van het product, inclusief maar niet beperkt tot het zeiltuig, de zitting, de mastvoethouder, het midzwaard, het roer, de handpomp en de tassen; dit geldt binnen de eerste 12 maanden van de geldige garantieperiode. Eventuele transportkosten zijn voor rekening van de klant.

*16.6.* De volgende producten vallen niet onder de garantie van de leverancier: buitenboordmotoren, generatoren, accu's, automatische opblaasstystemen, klimaatsystemen, spiegelwielen en alle andere onderdelen en accessoires die niet zijn vervaardigd of geleverd door de leverancier.

*16.7.* De leverancier is niet aansprakelijk voor gebreken die voortvloeien uit de aard en kwaliteit van de gebruikte materialen, maar die het gebruik van het product niet beïnvloeden, inclusief maar niet beperkt tot cosmetische verkleuring en schade aan de materiaaloppervlakken zoals scheuren, krassen, vochtblaasjes, hobbels, putjes, andere vervormingen, corrosie, verkleuring, dof worden, weersinvloeden, schimmel, groei van onderwaterorganismen, textuurwijzigingen en het loslaten van randen.

*16.8.* De leverancier is niet verantwoordelijk voor gebreken (na levering van het product) die worden veroorzaakt door:

- Normale slijtage, onjuiste behandeling of het negeren van gebruikersinstructies, voorwaarden en waarschuwingen.
- Misbruik, nalatigheid, inclusief maar niet beperkt tot onjuist afmeren, slepen, varen, te hoge en te lage druk van de luchtkamers.
- Onnauwkeurig, onvoldoende en achterstallig onderhoud en het gebruik van onjuiste reinigings- en onderhoudsproducten.
- Gebruik van een buitenboordmotor, zeiltuig of andere voortstuwingssystemen die een hoger vermogen of gewicht hebben dan gespecificeerd op het capaciteitsplaatje.
- Overmatige belasting, inclusief het aantal passagiers en het laadgewicht hoger dan gespecificeerd op het capaciteitsplaatje.
- Onjuiste (de-)installatie van de buitenboordmotor, zeil- en roeien uitrusting.
- Oneigenlijk gebruik van aanhangwagens, davits, garage of andere methoden voor opslag en transportfaciliteiten.
- Deelname aan of voorbereiding op races of andere competitieve sporten, de verhuur en het uitlenen van het vaartuig en andere commerciële activiteiten.
- Schade veroorzaakt door abnormale milieuomstandigheden, inclusief maar niet beperkt tot water- en luchtvervuiling, osmose, brandstoffen, zuren, zouten, harsen, chemicaliën, straling, verbranding, regen, hagel, storm en bliksem.
- Verlies, diefstal, botsing, ongedierte en ongelukken.
- Schade veroorzaakt door overmacht.
- Wijzigingen aan het product aangebracht door derden of door de klant, of het toevoegen van componenten of accessoires die niet zijn goedgekeurd door de leverancier.

*16.9.* De leverancier is evenmin aansprakelijk voor enige schade als gevolg van kosten gemaakt door het uit het water halen van het vaartuig, het te water laten van het vaartuig, slepen, afmeren, reinigen, onderhoud, opslag, transport, reizen, wachten, verzekering, huur, onderzoek, communicatie, noodsituatie of verlies van inkomsten en tijd, en alle andere soorten indirecte of gevolgschade.

=== Artikel 17 GARANTIECLAIMS

*17.1.* Garantieclaims moeten worden ingediend binnen de toepasselijke garantieperiode zo snel mogelijk en uiterlijk 7 dagen na het voorval van een mogelijk gebrek van het product door de klant, gerapporteerd via telecommunicatiemiddelen aan de leverancier of diens vertegenwoordiger.

*17.2.* Een garantieclaim voor een product bevat de contactgegevens, inclusief woonplaats of adres en e-mailadres van de klant, het vaartuigidentificatienummer, een duidelijke omschrijving van het/de probleem/problemen inclusief gedetailleerde foto's en/of video's van het gebrek.

*17.3.* De leverancier beoordeelt de garantieclaim zo spoedig mogelijk en antwoordt uiterlijk binnen 7 dagen via telecommunicatiemiddelen.

*17.4.* Het gebruik van het product na ontdekking van een gebrek is de verantwoordelijkheid en het risico van de klant.

*17.5.* Na beoordeling van de garantieclaim kan de klant de leverancier toestemming vragen om een product met kleine gebreken tijdelijk te blijven gebruiken.

*17.6.* Indien mogelijk kan de klant de leverancier of diens vertegenwoordiger verzoeken het noodzakelijke transport voor garantie-inspectie en/of reparaties te verzorgen op kosten van de klant.

*17.7.* De gevolgen van late klachten zijn voor het risico en de rekening van de klant.

// ─────────────────────────────────────────────
// BIJLAGE: ROER MONTAGE
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Bijlage — Roer montage (na uitpakken)
]

#figure(
  image("../mkdocs/docs/images/image_07.png", height: 148mm),
  caption: [Opklapbaar roer — Componenten],
  supplement: none,
  placement: none,
)

#v(6pt)
#text(size: 9pt)[*Roer montage instructies*]
#v(6pt)
#grid(
  columns: (1fr, 1fr),
  column-gutter: 20pt,
  row-gutter: 6pt,
  text(size: 9pt, fill: rgb("#0066cc"))[*a.* Schuif de roerkop (10) op het roerblad (1).],
  text(size: 9pt, fill: rgb("#0066cc"))[*b.* Plaats de bout (14) in de bouthouder (2).],
  text(size: 9pt, fill: rgb("#0066cc"))[*c.* Steek de bout (14) in de roerkop (10) door de gaten in het roerblad (1) en de roerkop. Zorg ervoor dat de bouthouder (2) vergrendelt in de 2 kleinere gaten van de roerkop.],
  text(size: 9pt, fill: rgb("#0066cc"))[*d.* Schroef de vleugelmoer (15) op de bout (14).],
  text(size: 9pt, fill: rgb("#0066cc"))[*e.* Plaats de boutbeschermer (13) op het bouteinde ter bescherming.],
  text(size: 9pt, fill: rgb("#0066cc"))[*f.* Steek de helmstok (4) door de helmstokhouders (3 en 6) door de helmstok spring veer (5) in te drukken en los te laten.],
)

// ─────────────────────────────────────────────
// BIJLAGE: ORCA ZEILTUIG GIEK MONTAGE
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Bijlage — Orca zeiltuig giek montage (na uitpakken)
]

#figure(
  image("../mkdocs/docs/images/image_11.png", height: 130mm),
  caption: [Orca giek montage],
  supplement: none,
  placement: none,
)

#v(6pt)
#text(size: 9pt)[*Legenda*]
#v(4pt)
#legenda((
  (1, "Giek deel 1"),
  (3, "Giekkop"),
  (2, "Neerhaler pin"),
  (4, "Mast deel 1"),
))

#v(8pt)
#text(size: 9pt)[*Orca zeiltuig giek montage instructies*]
#v(6pt)
#grid(
  columns: (1fr, 1fr),
  column-gutter: 20pt,
  row-gutter: 6pt,
  text(size: 9pt, fill: rgb("#0066cc"))[*a.* Leg mast deel 1 (4) op de grond.],
  text(size: 9pt, fill: rgb("#0066cc"))[*b.* Klik de ongemonteerde giekkop (3) op de mast (4).],
  text(size: 9pt, fill: rgb("#0066cc"))[*c.* Neem giek deel 1 (1) en positioneer de voorkant (het dichtst bij de neerhaler pin (2)) op de giekkop (3). Zorg ervoor dat de neerhaler pin (2) omhoog wijst, parallel aan het mastdeel (4).],
  text(size: 9pt, fill: rgb("#0066cc"))[*d.* Druk giek deel 1 (1) stevig naar beneden totdat het buisvormige deel van de giekkop (3) volledig in de giek is gestoken.],
)

// ─────────────────────────────────────────────
// BIJLAGE: CONFORMITEITSVERKLARING
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Bijlage — Conformiteitsverklaring
]

_Voorbeeld Conformiteitsverklaring — DinghyGo Orca 375 V1.1_

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

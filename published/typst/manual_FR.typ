// ─────────────────────────────────────────────
// DinghyGo Manuel d'utilisation — Manuel complet
// Orca 280 · Orca 325 · Orca 375
// v5.0 mai 2026
// ─────────────────────────────────────────────

#set document(
  title: "DinghyGo Manuel d'utilisation",
  author: "Aquacrafts B.V.",
)

#set page(
  paper: "a4",
  margin: (top: 25mm, bottom: 25mm, left: 22mm, right: 22mm),
  header: context {
    if counter(page).get().first() > 1 {
      grid(
        columns: (1fr, 1fr),
        align(left)[#text(8pt, gray)[DinghyGo Manuel d'utilisation]],
        align(right)[#text(8pt, gray)[v5.0 mai 2026]]
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
      text(8pt, gray)[v5.0 mai 2026],
      text(8pt, gray)[#counter(page).display() / #counter(page).final().first()],
      text(8pt, gray)[© Aquacrafts B.V.],
    )
  }
)

#set text(
  font: "Verdana",
  size: 10pt,
  lang: "fr",
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
  [#text(weight: "bold", fill: rgb("#1D4ED8"))[📌 REMARQUE] \ #body]
)

#let warning(body) = block(
  fill: rgb("#FFF7ED"),
  stroke: (left: 3pt + rgb("#F97316")),
  inset: (left: 10pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 3pt),
  width: 100%,
  below: 8pt,
  above: 8pt,
  [#text(weight: "bold", fill: rgb("#C2410C"))[⚠️ AVERTISSEMENT] \ #body]
)

#let danger(body) = block(
  fill: rgb("#FEF2F2"),
  stroke: (left: 3pt + rgb("#EF4444")),
  inset: (left: 10pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 3pt),
  width: 100%,
  below: 8pt,
  above: 8pt,
  [#text(weight: "bold", fill: rgb("#991B1B"))[⛔ DANGER] \ #body]
)

#let caution(body) = block(
  fill: rgb("#FEFCE8"),
  stroke: (left: 3pt + rgb("#EAB308")),
  inset: (left: 10pt, right: 10pt, top: 7pt, bottom: 7pt),
  radius: (right: 3pt),
  width: 100%,
  below: 8pt,
  above: 8pt,
  [#text(weight: "bold", fill: rgb("#A16207"))[⚠️ ATTENTION] \ #body]
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
  table_cells.push(table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 8pt)[Description]])
  table_cells.push(table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 8pt)[Nr.]])
  table_cells.push(table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 8pt)[Description]])
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
// COUVERTURE
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
        #text(size: 24pt, weight: "bold", fill: rgb("#111111"))[Manuel d'utilisation]
        #v(8pt)
        #text(size: 11pt, fill: rgb("#555555"))[Orca 280 · Orca 325 · Orca 375]
        #v(16pt)
        #line(length: 55%, stroke: 0.75pt + rgb("#DDDDDD"))
        #v(10pt)
        #text(size: 9pt, fill: rgb("#999999"))[Aquacrafts B.V. — v5.0 mai 2026]
        #v(24pt)
        #image("../mkdocs/docs/images/orca325_cover.png", height: 200pt)
      ]
    ]
  ]
]

// ─────────────────────────────────────────────
// TABLE DES MATIÈRES
// ─────────────────────────────────────────────
#pagebreak()
= Table des matières
#outline(title: none, depth: 3, indent: 1em)

// ─────────────────────────────────────────────
// CHAPITRE 1 : INFORMATIONS GÉNÉRALES
// ─────────────────────────────────────────────

= 1. Informations générales

== 1.1 Introduction

Ce manuel d'utilisation a été rédigé afin de garantir la sécurité et le plaisir lors de l'utilisation de votre DinghyGo, le dériveur gonflable 3-in-1. Ce manuel contient des informations détaillées sur l'embarcation, son équipement, ses systèmes ainsi que des informations sur son utilisation et son entretien. Veuillez lire attentivement ce manuel et regarder avec soin les vidéos d'instruction DinghyGo ; il est important que vous soyez familiarisé avec l'embarcation avant toute utilisation.

Ce manuel d'utilisation n'est pas un cours de sécurité maritime ni de navigation. Si c'est votre première expérience avec une embarcation, ou si vous ne connaissez pas ce type particulier d'embarcation, veillez à assurer votre propre sécurité et confort en acquérant de l'expérience dans la conduite et l'utilisation d'une embarcation (voilier et bateau à moteur) avant d'utiliser votre DinghyGo.

Votre revendeur DinghyGo, la fédération nationale de voile ou votre yacht-club seront à même de vous conseiller sur les écoles de voile et les clubs de voile locaux avec des instructeurs qualifiés. Assurez-vous que votre DinghyGo est adapté aux conditions de vent et de mer prévues, et que vous et votre équipage êtes en mesure de maîtriser le bateau dans ces conditions.

Ce manuel ne fournit pas de guide détaillé pour l'entretien ou les réparations du bateau.

En cas de problèmes, veuillez contacter votre revendeur DinghyGo. Suivez les instructions d'entretien et de réparation fournies dans ce manuel pour un entretien correct de votre DinghyGo. Consultez toujours des spécialistes formés et compétents pour l'entretien, les réparations ou les modifications. Les modifications apportées au bateau susceptibles d'affecter la sécurité de l'embarcation ne peuvent être évaluées, exécutées et documentées que par des personnes compétentes. Votre revendeur, Aquacrafts B.V., ne peut être tenu responsable des modifications qui n'ont pas été approuvées par lui. Dans certains pays, une licence ou un permis est requis pour utiliser cette embarcation, et des règles spécifiques s'appliquent parfois. Assurez-vous toujours que votre embarcation est bien entretenue et tenez compte du fait que l'usure se produira avec le temps, notamment en raison d'une utilisation intensive ou d'une mauvaise utilisation. Chaque bateau est conçu pour être robuste, mais votre bateau peut être sérieusement endommagé en cas d'utilisation incorrecte. Adaptez toujours la vitesse et la direction du bateau à votre environnement. L'équipage doit être familiarisé avec toutes les procédures de sécurité et d'urgence (homme à la mer, remorquage, etc.). Les écoles de voile et les clubs organisent régulièrement des sessions de formation pour vous aider si nécessaire.

Dans certains pays, le port d'un gilet de sauvetage ou d'une aide à la flottabilité conforme à la réglementation nationale est obligatoire en permanence.

Ce manuel utilise les symboles de sécurité suivants :

#warning[Indique une situation potentiellement dangereuse qui, si elle n'est pas évitée, pourrait entraîner des blessures ou le décès.]

#danger[Indique une situation dangereuse imminente qui, si elle n'est pas évitée, entraînera des blessures graves ou le décès.]

#caution[Indique une situation potentiellement dangereuse qui, si elle n'est pas évitée, pourrait entraîner des blessures légères ou modérées ou des dommages matériels. Peut également mettre en garde contre des pratiques dangereuses.]

#note[Veuillez conserver ce manuel en lieu sûr et le remettre au nouveau propriétaire si vous choisissez de revendre votre DinghyGo.]

== 1.2 Catégorie CE

Votre DinghyGo est destiné à être utilisé comme embarcation de *Catégorie D* :

Catégorie D. Une embarcation conçue pour une utilisation par vent n'excédant pas la force 4 sur l'échelle de Beaufort, et la hauteur significative de vague correspondante n'excédant pas 0,3 mètre, avec des vagues occasionnelles d'une hauteur maximale de 0,5 m. Ces conditions se rencontrent dans les eaux côtières abritées et les eaux intérieures, notamment les petites baies, les petits lacs, les rivières et les canaux par bonnes conditions météorologiques.

#advice[La hauteur de vague correspond à la hauteur moyenne du tiers supérieur des vagues, ce qui correspond approximativement à la hauteur de vague telle qu'estimée par un observateur expérimenté. Certaines vagues peuvent cependant être deux fois plus hautes.]

#warning[
  Prenez les précautions nécessaires si l'embarcation est utilisée depuis un bateau mère en mer ouverte. Ne perdez jamais le contact avec le bateau mère !

  *Portez toujours un gilet de sauvetage !*
]

== 1.3 Norme ABYC

Votre DinghyGo est conforme à la norme American Boat & Yacht Council (ABYC) H-28 Type 1 Inflatable Boats.

== 1.4 Plaque constructeur (plaque de capacité)

La plaque constructeur avec les informations du fabricant DinghyGo Aquacrafts B.V. est située à l'intérieur du tableau arrière du bateau.

#figure(
  image("../mkdocs/docs/images/image_02.png", width: 80%),
  caption: [Représentation de la plaque constructeur (Orca 325)],
  supplement: none,
)

Explication de la plaque constructeur :

- a. Nom du fabricant
- b. Modèle, type et version du bateau
- c. Catégorie du bateau — voir Tableau 2.1
- d. Marquage CE
- e. ISO 6185 partie et type
- f. Charge maximale (personnes + moteur hors-bord + carburant + équipement)
- g. Puissance maximale et poids du moteur hors-bord
- h. Capacité maximale / nombre de personnes
- i. Surface de voile maximale
- j. Pression maximale des chambres à air et du fond

== 1.5 Réglementations nationales

Avant utilisation, vérifiez les réglementations locales pour voir si des restrictions s'appliquent aux eaux sur lesquelles vous souhaitez naviguer. Soyez particulièrement attentif aux restrictions concernant la voile, la vitesse, l'utilisation du kit de voile (sailkit) ou du moteur hors-bord, les restrictions de bruit sur l'eau, etc.

== 1.6 Informations générales de sécurité

#advice[Conseils pour une navigation sûre

Afin de profiter en toute sécurité des voies navigables, vous devez vous familiariser avec les réglementations et restrictions locales et gouvernementales relatives à la navigation de plaisance. Veuillez tenir compte des recommandations suivantes :]

- Utilisez des gilets de sauvetage ou des aides à la flottabilité. Assurez-vous qu'un gilet de sauvetage ou une aide à la flottabilité adapté est disponible pour chaque personne à bord et facilement accessible (obligatoire par la loi dans certains pays).
- Ne dépassez pas la charge maximale recommandée. En cas de doute, contactez votre revendeur DinghyGo.
- Effectuez les contrôles de sécurité et l'entretien requis. Suivez un calendrier régulier et assurez-vous que toutes les réparations sont effectuées correctement.
- Assurez-vous de connaître toutes les règles et lois nautiques applicables et de les respecter.

#advice[Assurez-vous que tous les passagers du bateau sont correctement assis. Ne vous asseyez sur aucune partie du bateau ou du gréement qui n'est pas destinée à servir de siège.]

Cela inclut les bords du tableau arrière, la proue et le pont, où une accélération soudaine et inattendue pourrait faire perdre l'équilibre. Un arrêt soudain, une perte de contrôle inattendue sur le bateau ou le gréement, et un mouvement brusque du bateau pourraient entraîner une personne par-dessus bord ou à l'intérieur du bateau.

#advice[Assurez-vous de ne JAMAIS être sous l'influence de l'alcool ou de drogues lors de la navigation (obligatoire par la loi). L'alcool et les drogues ont un effet néfaste sur votre jugement et réduisent considérablement votre capacité de réaction sur l'eau.]

Si possible, préparez d'autres personnes à bord au cas où l'opérateur serait incapacité ou tomberait par-dessus bord : instruisez au moins une autre personne dans les bases de la voile, du démarrage et de l'utilisation du moteur hors-bord, et de la conduite du bateau.

#advice[Arrêtez le moteur hors-bord lorsque des passagers embarquent, débarquent ou se trouvent à l'arrière du bateau. Mettre simplement le moteur hors-bord au point mort n'est pas suffisamment sûr.]

Restez attentif. L'opérateur du bateau est légalement responsable de surveiller et d'écouter correctement. L'opérateur doit avoir une vue dégagée, en particulier vers l'avant. Les passagers et la charge ne doivent pas obstruer la vue de l'opérateur lorsque le bateau est en mouvement.

#advice[Ne dirigez jamais votre bateau directement derrière un skieur nautique (ou un wakeboardeur), car il pourrait chuter. Si le skieur nautique se trouve à 61 m (200 pieds) devant vous et que votre bateau avance à une vitesse de 20 km/h (12,5 mph), il ne vous faudra que dix secondes pour le rattraper.]

Soyez attentif aux chutes de skieurs nautiques. L'opérateur doit toujours pouvoir voir le skieur tombé et ne jamais reculer vers le skieur ou vers quelqu'un dans l'eau. Signalez tous les accidents.

// ─────────────────────────────────────────────
// CHAPITRE 2 : SPÉCIFICATIONS
// ─────────────────────────────────────────────

= 2. Spécifications, description et fonctions

== 2.1 Spécifications

Les modèles DinghyGo relèvent de la Directive sur les bateaux de plaisance 2013/53/UE. Un exemple de déclaration de conformité est joint en annexe à ce manuel.

#text(size: 8.5pt)[
  #table(
    columns: (2fr, 1fr, 1fr, 1fr),
    inset: (x: 6pt, y: 4pt),
    stroke: 0.4pt + rgb("#CCCCCC"),
    fill: (col, row) => if row == 0 { rgb("#ED1C24") } else if calc.odd(row) { rgb("#FAFAFA") } else { white },

    table.cell(fill: rgb("#ED1C24"))[#text(weight: "bold", fill: white)[Modèle]],
    table.cell(fill: rgb("#ED1C24"))[#text(weight: "bold", fill: white)[Orca 280]],
    table.cell(fill: rgb("#ED1C24"))[#text(weight: "bold", fill: white)[Orca 325]],
    table.cell(fill: rgb("#ED1C24"))[#text(weight: "bold", fill: white)[Orca 375]],

    table.cell(colspan: 4, fill: rgb("#E8E8E8"))[#text(weight: "bold")[Bateau — Spécifications]],
    [Catégorie CE], [D], [D], [D],
    [Nombre de chambres à air], [3], [3], [3],

    table.cell(colspan: 4, fill: rgb("#E8E8E8"))[#text(weight: "bold")[Dimensions et poids \*]],
    [Longueur (ft/cm)], [9'2"/280], [10'7"/325], [12'3"/375],
    [Largeur (ft/cm)], [4'9"/150], [4'9"/150], [4'9"/150],
    [Tirant d'eau (ft/cm)], [2'8"/85], [2'8"/85], [2'8"/85],
    [Diamètre des boudins (in/cm)], [16"/40], [16"/40], [16"/40],
    [Poids (lbs/kg)], [60/27], [64/29], [71/32],

    table.cell(colspan: 4, fill: rgb("#E8E8E8"))[#text(weight: "bold")[Capacité (maximale)]],
    [Personnes (sans/avec gréement)], [3/2], [4/2,5], [5/3],
    [Charge utile (lbs/kg)], [660/300], [880/400], [1.100/500],
    [Moteur hors-bord (kW/cv)], [4,5/6,0], [4,5/6,0], [4,5/6,0],
    [Pression boudins/fond (psi)], [3,6/10,2], [3,6/10,2], [3,6/10,2],
    [Dimensions emballées \*\* (LxlxH in)], [40"x21"x13"], [40"x28"x13"], [40"x28"x15"],
    [Dimensions emballées \*\* (LxlxH cm)], [100x54x32], [100x72x32], [100x72x38],

    table.cell(colspan: 4, fill: rgb("#E8E8E8"))[#text(weight: "bold")[Gréement — Spécifications]],
    table.cell(colspan: 4, fill: rgb("#F4F4F4"))[#text(style: "italic")[Dimensions et poids \*]],
    [Longueur de mât (ft/cm)], [14'1"/430], [14'1"/430], [14'1"/430],
    [Longueur de bôme (ft/cm)], [7'4"/225], [7'4"/225], [7'4"/225],
    [Surface de voile (sq.ft/m²)], [52/4,8], [60/5,6], [64/5,9],
    [Poids (lbs/kg)], [32/14], [33/15], [37/17],
    [Dimensions emballées \*\* (LxlxH in)], [47"x18"x7"], [47"x18"x7"], [47"x18"x8"],
    [Dimensions emballées \*\* (LxlxH cm)], [120x45x17], [120x45x18], [120x45x20],
  )
]

#v(3mm)
#text(size: 8pt, fill: rgb("#666666"))[\*) Les spécifications peuvent différer de 5% \ \*\*) Poids et dimensions emballées hors carton, matériaux d'emballage et sac.]

== 2.2 Modèle

DinghyGo est un dériveur gonflable trois-en-un qui acquiert sa forme, sa solidité et sa flottabilité en étant rempli d'air. Le bateau est conçu pour de courtes sorties en eaux abritées et ouvertes, comme indiqué dans la section « Catégorie CE ». Les différents modèles DinghyGo sont spécifiés dans le tableau des spécifications du modèle.

== 2.3 Capacité

#warning[Ne dépassez pas le nombre maximum de personnes. Quel que soit le nombre de personnes à bord, le poids total des personnes et de l'équipement ne doit jamais dépasser la charge maximale recommandée. Utilisez toujours le banc/siège.]

== 2.4 Charge utile

#warning[Lors du chargement de l'embarcation, ne dépassez jamais la charge maximale recommandée. Faites toujours preuve de prudence lors du chargement et répartissez les charges de manière appropriée pour maintenir une flottabilité correcte. Évitez de placer des charges lourdes en hauteur.]

La charge maximale recommandée comprend exclusivement :

- a. Le nombre de personnes de 75 kg chacune. Si des enfants font partie de l'équipage, le nombre maximum de personnes peut être augmenté à condition que le poids de chaque enfant ne dépasse pas 37,5 kg et que le poids total ne soit pas dépassé ;
- b. L'équipement de base incluant le kit de voile (sailkit) et les équipements de rame ;
- c. La cargaison (le cas échéant), les équipements secs, les liquides consommables [non inclus dans d.] et divers équipements ne faisant pas partie du poids du bateau ou mentionnés en b., y compris le moteur hors-bord ;
- d. Les liquides utiles (eau douce, carburant) remplis à leur capacité maximale dans des réservoirs portables.

== 2.5 Kit de voile (sailkit)

La surface de voile maximale du gréement (kit de voile / sailkit) est indiquée dans le « tableau des spécifications du modèle » et sur la plaque de capacité.

L'installation et l'utilisation du kit de voile (sailkit) sont décrites dans les chapitres « Assemblage et démontage », « Recommandations de sécurité et d'utilisation » et dans l'annexe « Assemblage du gouvernail / bôme Orca… » de ce manuel.

#warning[L'utilisation d'un kit de voile (sailkit) trop grand ou non d'origine peut endommager sérieusement l'embarcation ou causer des blessures corporelles, surtout par vent trop fort. Utilisez toujours le kit de voile DinghyGo d'origine et correspondant, dont la surface est inférieure ou égale à la surface de voile maximale spécifiée. Ne naviguez jamais par vent supérieur à la vitesse maximale spécifiée dans la section « Catégorie CE ».]

== 2.6 Moteur hors-bord

La puissance maximale de ce bateau est indiquée dans le « tableau des spécifications du modèle » et sur la plaque de capacité.

L'installation du moteur hors-bord et les instructions de conduite supplémentaires sont décrites dans le chapitre « Assemblage et démontage » de ce manuel.

#danger[L'utilisation d'un moteur hors-bord à puissance maximale peut entraîner des blessures graves, le décès ou des dommages à l'embarcation.]

#danger[Vous pourriez perdre le contrôle du bateau en utilisant le moteur hors-bord à pleine vitesse. Des accidents peuvent survenir. Le revendeur (Aquacrafts B.V.) ne peut être tenu responsable de ces actions.]

#warning[Soyez prudent lors du ravitaillement en carburant : ne fumez pas et nettoyez tout carburant renversé. Faites attention lors de l'installation du moteur hors-bord pour éviter d'endommager le tuyau de carburant. Assurez-vous qu'aucun matériau combustible ne peut entrer en contact avec les pièces du moteur.]

// ── 2.7 Schémas ─────────────────────────────
#pagebreak()
== 2.7 Représentations visuelles

// ── 2.7.1 ───────────────────────────────────────
#block(breakable: false)[
  === 2.7.1 Orca 280 — Vue latérale

  #figure(
    image("../mkdocs/docs/images/image_04.png", height: 195mm),
    caption: [Orca 280 — Vue latérale],
    supplement: none,
    placement: none,
  )
]

#pagebreak()
*Légende*

#legenda((
  (1, "Fourreau de mât"),
  (18, "Verrou de mât"),
  (2, "Lattes de voile"),
  (19, "Pont"),
  (3, "Girouette"),
  (20, "Coinceur de mât"),
  (4, "Point d'écoute"),
  (21, "Velcro"),
  (5, "Hale-dehors de bordure"),
  (22, "Point d'amure"),
  (6, "Extrémité de bôme"),
  (23, "Pied de mât"),
  (7, "Poulie d'écoute avec maille"),
  (24, "Emplanture de mât"),
  (8, "Écoute de grand-voile"),
  (25, "Anneau en D / Anneau de remorquage"),
  (9, "Poulie d'écoute avec manille à déclenchement"),
  (26, "Dérive centrale"),
  (10, "Velcro"),
  (27, "Puits de dérive"),
  (11, "Coinceur de bôme"),
  (28, "Puits de dérive flexible"),
  (12, "Section arrière de bôme"),
  (29, "Auto-videur"),
  (13, "Poulie d'écoute de voile"),
  (30, "Gouvernail"),
  (14, "Section avant de bôme"),
  (31, "Aiguillot"),
  (15, "Arrêt de hale-bas"),
  (32, "Fémelot"),
  (16, "Hale-bas"),
  (33, "Tableau arrière"),
  (17, "Vit-de-mulet"),
  (34, "Clip de retenue"),
))

// ── 2.7.2 ───────────────────────────────────────
#pagebreak()
#block(breakable: false)[
  === 2.7.2 Orca 375 — Vue latérale

  #figure(
    image("../mkdocs/docs/images/image_05.png", height: 195mm),
    caption: [Orca 375 — Vue latérale],
    supplement: none,
    placement: none,
  )
]

#pagebreak()
*Légende* — Éléments supplémentaires (haubans et support de mât)

#legenda((
  (60, "Ouverture du fourreau de mât"),
  (63, "Hauban"),
  (61, "Œillet de mât"),
  (64, "Taquet de hauban (flottant)"),
  (62, "Manille de hauban"),
  (65, "Anneau en D hauban/davier"),
))

*Légende* — Éléments supplémentaires (foc)

#legenda((
  (66, "Drisse"),
  (72, "Manille de foc (point d'écoute)"),
  (67, "Manille de drisse"),
  (73, "Anneau en D de proue"),
  (68, "Tête de foc"),
  (74, "Point d'écoute de foc"),
  (69, "Foc"),
  (75, "Écoute de foc"),
  (70, "Coinceur de drisse"),
  (76, "Anneau en D d'écoute de foc"),
  (71, "Point d'amure de foc"),
  (0, ""),
))

// ── 2.7.3 ───────────────────────────────────────
#pagebreak()
#block(breakable: false)[
  === 2.7.3 Orca 280 — Vue de dessus

  #figure(
    image("../mkdocs/docs/images/image_06.png", width: 100%),
    caption: [Orca 280 — Vue de dessus],
    supplement: none,
    placement: none,
  )
]

#pagebreak()
*Légende*

#legenda((
  (35, "Valve de fond (n° 4)"),
  (48, "Dame de nage"),
  (36, "Valve (n° 1)"),
  (49, "Rame / Aviron"),
  (37, "Pont"),
  (50, "Valve (n° 3)"),
  (38, "Poignée de proue"),
  (51, "Poignée arrière"),
  (39, "Virole de mât"),
  (52, "Galhauban de chariot d'écoute"),
  (40, "Butée d'emplanture de mât"),
  (53, "Platine moteur avant"),
  (41, "Soupape de surpression"),
  (54, "Platine moteur arrière"),
  (42, "Œillet de hissage"),
  (55, "Barre"),
  (43, "Soupape de surpression du fond"),
  (56, "Mousqueton"),
  (44, "Banc/puits de dérive"),
  (57, "Œillet de hissage et de galhauban"),
  (45, "Bout"),
  (58, "Valve (n° 2)"),
  (46, "Sangle de fixation du banc"),
  (59, "Poignée arrière"),
  (47, "Fond 3D"),
  (0, ""),
))

// ── 2.7.4 ───────────────────────────────────────
#pagebreak()
#block(breakable: false)[
  === 2.7.4 Gouvernail relevable — Vue latérale/arrière

  #figure(
    image("../mkdocs/docs/images/image_07.png", height: 195mm),
    caption: [Gouvernail relevable — Vue latérale (gauche) et vue arrière (droite)],
    supplement: none,
    placement: none,
  )
]

#pagebreak()
*Légende*

#legenda((
  (1, "Pale de gouvernail"),
  (11, "Support d'aiguillot (bas)"),
  (2, "Support de boulon"),
  (12, "Aiguillot"),
  (3, "Support de barre (arrière)"),
  (13, "Protège-boulon"),
  (4, "Barre"),
  (14, "Boulon"),
  (5, "Ressort de barre"),
  (15, "Écrou papillon"),
  (6, "Support de barre (avant)"),
  (18, "Tête de boulon"),
  (7, "Support d'aiguillot (haut)"),
  (20, "Tête de boulon"),
  (8, "Aiguillot"),
  (0, ""),
  (9, "Clip de sécurité"),
  (0, ""),
  (10, "Tête de gouvernail"),
  (0, ""),
))

// ─────────────────────────────────────────────
// CHAPITRE 3 : ASSEMBLAGE ET DÉMONTAGE
// ─────────────────────────────────────────────

= 3. Assemblage et démontage

#advice[Regardez attentivement les vidéos d'instruction DinghyGo sur l'assemblage et le démontage de l'embarcation. Vous recevrez ces vidéos d'instruction avec votre DinghyGo. Vous pouvez également les commander auprès de votre revendeur DinghyGo.]

== 3.1 Fond gonflable

Les bateaux DinghyGo sont équipés d'un fond gonflable qui doit être correctement gonflé. L'utilisation du bateau sans un fond correctement gonflé est dangereuse, inconfortable et peut endommager le bateau. Consultez la section « Gonflage du fond gonflable » pour apprendre comment gonfler le fond gonflable.

== 3.2 Valves de gonflage

Les valves de gonflage du bateau sont spécialement conçues pour une utilisation sûre et confortable. Les valves plates sont conçues pour améliorer le confort à bord et prévenir les dommages au bateau.

#align(center)[
  #image("../mkdocs/docs/images/image_08.png", width: 50%)
  #text(style: "italic", size: 9pt)[Image d'une valve de gonflage]
]

=== 3.2.1 Utilisation des valves

- Retirez le capuchon extérieur. La valve est fermée lorsque le bouton central à vis est en position haute.
- Pour ouvrir la valve, placez votre doigt au centre de la valve et appuyez sur le bouton central à vis vers le bas. Tournez votre doigt d'un quart de tour dans le sens des aiguilles d'une montre jusqu'au verrouillage du bouton.
- Pour fermer la valve, appuyez sur le bouton et tournez votre doigt d'un quart de tour dans le sens des aiguilles d'une montre jusqu'à ce que le bouton remonte.

=== 3.2.2 Connexions de la pompe

- Fixez l'embout de la pompe (la partie en pointe) à la valve.
- Tournez-la vers la droite (dans le sens des aiguilles d'une montre) jusqu'au verrouillage, puis commencez à pomper.
- Continuez à pomper jusqu'à ce que le bateau soit complètement gonflé.
- Débranchez la pompe une fois terminé.
- Assurez-vous que le capuchon est remis en place (pour le protéger contre la saleté et les dommages).

=== 3.2.3 Vérification des fuites d'air

En cas de fuite d'air :

- Sortez la clé de valve de la trousse de réparation.
- Insérez la clé dans la valve et tournez-la dans le sens des aiguilles d'une montre. Vérifiez si le problème est résolu.
- En cas de découverte d'une fuite, contactez votre revendeur DinghyGo et vérifiez la garantie.
- Prenez l'arrière de la valve dans les mains et tournez la tige vers la gauche avec la clé (sens antihoraire) et retirez la tige.
- Inspectez la valve pour détecter tout dommage.
- En cas de dommage (voir annexe « Garantie »), apportez la valve défectueuse à votre revendeur DinghyGo. Vous recevrez une nouvelle valve dans le délai de garantie.
- Lubrifiez la tige avec de la silicone ou de l'eau savonneuse et réinstallez-la.

== 3.3 Équipement de rame

Deux rames / avirons sont fournis avec le bateau. Les pales peuvent être séparées des manches pour faciliter le transport. Les rames doivent être correctement placées dans les dames de nage. Tenez la rame parallèle au boudin avec la pale orientée vers l'avant et insérez la goupille aussi profondément que possible dans la dame de nage. Tournez ensuite la rame vers l'extérieur de 180 degrés pour la fixer dans la dame de nage.

== 3.4 Kit de voile (sailkit)

Votre DinghyGo est livré avec un kit de voile (sailkit), comprenant :

- Banc (l'Orca 375 inclut 2 coinceurs d'écoute de foc) / puits de dérive
- Emplanture de mât
- Dérive centrale
- Gouvernail
- Mât sectionnel
- Bôme sectionnelle
- Grand-voile
- Jeu de cordages (écoutes, haubans avec taquets, manille, élastique de dérive centrale)
- Sac du kit de voile

L'installation et le gréement de l'équipement de voile sont expliqués plus loin dans le manuel, y compris dans ses annexes.

== 3.5 Banc / siège

Le DinghyGo est équipé d'un banc spécial et d'une « sangle de fixation du banc » sur les deux boudins latéraux, sur laquelle le banc est glissé. Le banc fait également office de fente supérieure pour le puits de dérive.

#advice[Vous devez installer le banc avant de gonfler complètement le bateau.]

== 3.6 Gonflage des boudins

Déroulez le bateau sur le sol pour le gonfler. Retirez tout objet pointu de la surface sur laquelle le bateau est gonflé.

- Après avoir sorti le bateau de son emballage, vérifiez que tous les composants sont présents.
- Vérifiez que les valves sont fermées. Pour cela, placez un doigt dans la valve, appuyez sur le petit bouton gris à vis et tournez-le légèrement vers la droite.
- Si le bouton remonte légèrement, vous pouvez procéder au gonflage du bateau. (Pour dégonfler le bateau, tournez le bouton vers la gauche !)
- Utilisez la pompe fournie avec le bateau. Appuyez l'embout (la pointe) contre la valve et tournez vers la droite. La pompe se verrouille sur la valve.
- Pompez suffisamment d'air dans le bateau pour lui donner la forme correcte.

#advice[Toutes les chambres gonflables doivent être gonflées de façon égale pour éviter d'endommager les cloisons.]

#advice[Gonfler et dégonfler correctement votre bateau est essentiel à sa durabilité.]

=== 3.6.1 Ordre de gonflage

Gonflez le bateau dans l'ordre croissant des numéros figurant sur les étiquettes des valves :

+ Chambre avant (n° 1)
+ Chambres latérales (n° 2 et 3)
+ Fond (n° 4)

=== 3.6.2 Gonflage des boudins

Étape 1 : Pompez de l'air dans la chambre avant via la valve de gonflage jusqu'à atteindre la pression spécifiée.

Étape 2 : Pompez de l'air dans les deux chambres latérales dans l'ordre correct jusqu'à atteindre la pression spécifiée.

Si le gonflage est effectué dans le bon ordre, le bateau aura la pression correcte et il n'y aura pas de déformation des boudins.

Étape 3 : Fermez toutes les valves en insérant les capuchons de valve et en les tournant dans le sens des aiguilles d'une montre.

#advice[Ne dépassez jamais les valeurs indiquées sur la plaque constructeur et les étiquettes de valve ! Gonflez les boudins à 0,25 bar = 3,6 psi = 25 kPa et le fond à 0,19 bar = 2,75 psi = 19 kPa (tolérance ±20%). Gonflez le fond Orca à 0,7 bar = 10,2 psi = 70 kPa.]

#advice[N'utilisez pas de compresseurs mécaniques pour gonfler votre bateau. La pompe à main fournie est réglée pour créer la pression parfaite pour votre bateau. Si vous préférez, vous pouvez utiliser une pompe électrique disponible en option auprès de votre revendeur DinghyGo. Utilisez les réglages de pression corrects pour faciliter correctement le gonflage.]

#caution[Un gonflage incorrect peut causer des dommages structurels à votre embarcation. Retirez votre embarcation de l'exposition directe au soleil lorsqu'elle est hors de l'eau. Le soleil direct provoque la dilatation de l'air dans l'embarcation, ce qui peut l'endommager (sauf en cas d'utilisation et d'entretien corrects de la soupape de surpression).]

== 3.7 Gonflage du fond gonflable

Lorsque vous gonflez complètement le fond gonflable, il se coince entre les boudins latéraux et le tableau arrière.

Étape 1 : Pompez de l'air dans le fond via la valve, comme pour les boudins latéraux, jusqu'à atteindre la pression spécifiée.

Étape 2 : Fermez la valve en insérant le capuchon de valve et en le tournant dans le sens des aiguilles d'une montre.

== 3.8 Assemblage et démontage du gréement

Le sac du kit de voile contient l'équipement de voile complet. Disposez tous les composants de voile pour faciliter l'installation et le gréement.

=== 3.8.1 Installation de l'emplanture de mât, du banc et du galhauban de chariot

- Gonflez partiellement la proue et les boudins latéraux (voir la section « Gonflage des boudins »), de sorte qu'ils aient une certaine forme mais ne soient pas complètement sous pression. Ne gonflez pas encore le fond.
- Faites glisser l'emplanture de mât sous les boudins jusqu'à ce qu'elle se positionne devant les butées d'emplanture de mât sur le fond (à l'avant du bateau).
- Faites glisser le banc / puits de dérive sur les sangles de fixation du banc sur les boudins, jusqu'à ce qu'il soit positionné directement au-dessus de l'ouverture du puits de dérive dans le fond.
- Fixez une extrémité du galhauban de chariot à l'œillet du tableau arrière et fixez l'autre extrémité à l'autre œillet du tableau arrière avec le mousqueton.

=== 3.8.2 Gonflage du bateau

- Gonflez complètement les boudins et le fond (voir les sections « Gonflage des boudins » et « Gonflage du fond gonflable »), de façon à ce que l'emplanture de mât et le banc / puits de dérive soient solidement coincés.
- Fixez ensuite la partie flexible du puits de dérive avec le velcro sur la partie inférieure du banc / puits de dérive.
- Installez les rames / avirons (voir la section « Installation des rames »).

=== 3.8.3 Gréement

- Assurez-vous que le gouvernail et la bôme Orca sont correctement assemblés après déballage conformément à l'annexe.
- Assemblez les sections de mât et de bôme.
- Prenez la grand-voile et insérez les lattes de voile.
- Faites glisser le mât dans le fourreau de mât de la grand-voile.
- Fixez les haubans à travers l'ouverture du fourreau de mât avec la manille de hauban à l'œillet de la section supérieure du mât.
- Faites passer la drisse de foc à travers l'œillet de foc à l'œillet de la section supérieure du mât, fixez le mousqueton à la boucle de drisse au-dessus de la manille de hauban (Orca 375 uniquement).
- Placez le mât dans le pied de mât, à travers la virole de pont.
- Fixez les haubans des deux côtés des boudins en faisant passer le hauban à travers l'anneau en D du boudin et en le fixant dans le taquet de hauban. Assurez-vous que le mât est vertical avec seulement une légère tension de hauban.
- Fixez le point d'amure de foc avec la manille à l'anneau de proue et fixez le mousqueton à la tête de foc. Hissez le foc, passez la drisse dans l'anneau de proue, insérez-la dans le coinceur et serrez fermement (Orca 375 uniquement).
- Fixez la bôme au mât en enclenchant l'extrémité avant de la bôme sur le mât.
- Fixez les deux bandes velcro de la grand-voile à la bôme.
- Appliquez le hale-bas et le hale-dehors de bordure avec la tension correcte.
- Fixez la poulie d'écoute avec manille à déclenchement rapide au galhauban de chariot.
- Fixez l'écoute de foc au point d'écoute de foc, faites passer l'écoute à travers les anneaux de foc sur les boudins et faites un nœud en huit. L'écoute peut être fixée en diagonale dans les coinceurs du banc pendant la navigation (Orca 375).

#warning[Assurez-vous que le gréement est correctement inséré droit à travers la virole de pont dans le pied de mât jusqu'au fond.]

#warning[Assurez-vous que le mât est vertical et correctement maintenu et soutenu par les haubans fixés au mât et aux deux côtés des boudins. La fixation incorrecte des haubans peut entraîner le relâchement du gréement, ce qui peut faire perdre le contrôle de l'embarcation et causer des blessures à l'équipage.]

=== 3.8.4 Préparation avant la mise à l'eau

- Fixez le gouvernail au tableau arrière. Assurez-vous que le gouvernail est verrouillé avec le clip de retenue.
- Faites glisser la dérive centrale à travers le banc dans le puits de dérive.
- Fermez l'auto-videur.

#advice[La dérive centrale doit être insérée dans le puits de dérive avec le profil arrondi orienté vers la proue. Une dérive centrale mouillée facilite l'insertion dans le puits. L'élastique fourni, dont les extrémités sont nouées pour former une boucle, peut être passé autour de la dérive centrale et du banc pour maintenir la dérive dans la position requise.]

#advice[Le galhauban de chariot doit être fixé par-dessus la barre du gouvernail.]

#warning[Fixez le gouvernail avec le clip de retenue. Une fixation incorrecte peut entraîner la perte du gouvernail et la perte de direction de l'embarcation, ce qui peut entraîner des situations dangereuses.]

#warning[Fixez toujours la barre dans la tête de gouvernail avant de naviguer. Le gouvernail pourrait sinon être endommagé et entraîner la perte de direction de l'embarcation, ce qui pourrait provoquer des situations dangereuses.]

=== 3.8.5 Navigation à la voile

Ce manuel ne fournit pas d'instructions de navigation à la voile et suppose que l'opérateur et les passagers ont une expérience et des qualifications de navigation suffisantes. Votre revendeur DinghyGo ou votre club de voile est en mesure de vous informer sur les possibilités de formation, telles que les cours de voile.

#warning[Ne naviguez qu'après vous être assuré que vous et votre équipage avez une expérience de navigation suffisante et que vous savez comment réagir aux conditions (attendues), aux risques de sécurité, aux performances individuelles et au fonctionnement de l'embarcation. Assurez-vous que l'équipement de l'équipage et de l'embarcation est en bon état. Une utilisation incorrecte, un équipement défectueux et des conditions inadaptées peuvent entraîner des situations dangereuses.]

=== 3.8.6 Démontage du gréement

- Retirez le gouvernail du tableau arrière en appuyant/relâchant le clip de retenue.
- Retirez la dérive centrale du puits de dérive et du banc.
- Amenez le foc en tirant la drisse du coinceur, abaissez le foc et détachez la tête de foc du mousqueton de drisse. Détachez le mousqueton de la boucle de drisse, tirez la drisse de l'anneau de foc sur le mât et de l'anneau en D de la proue (Orca 375).
- Déconnectez la poulie d'écoute du galhauban en ouvrant la manille à déclenchement rapide.
- Détachez les haubans des deux côtés des anneaux en D des boudins en les libérant des taquets de hauban.
- Soulevez le gréement hors du pied de mât en ligne droite à travers la virole de pont.
- Relâchez le hale-dehors de bordure et le hale-bas et détachez la bôme du mât.
- Séparez les sections de bôme.
- Retirez les lattes de voile, détachez les haubans du mât en libérant la manille de hauban et faites glisser le fourreau de mât hors du mât.
- Séparez les sections de mât.

=== 3.8.7 Dépose de l'emplanture de mât et du banc

- Dégonflez partiellement le fond et les boudins (voir la section « Dégonflage du bateau »), de façon à ce qu'ils aient encore de la forme mais ne soient plus sous pression.
- Détachez la partie flexible du puits de dérive de la partie inférieure du banc.
- Faites glisser le banc vers l'arrière hors de ses sangles de fixation sur les boudins.
- Tirez l'emplanture de mât hors des butées depuis la proue du bateau. Soulever la proue d'une main facilite l'extraction.
- Retirez les rames des dames de nage après les avoir tournées de 180 degrés avec la pale vers l'avant parallèle au boudin et séparez les rames.

=== 3.8.8 Rangement et stockage du kit de voile

- Assurez-vous que tous les éléments du kit de voile sont propres et secs. Les pièces ayant été exposées à l'eau de mer (salée) doivent être lavées et nettoyées immédiatement à l'eau douce après utilisation.
- Posez le sac du kit de voile sur le sol avec l'ouverture face à vous.
- Commencez par mettre la dérive centrale et le gouvernail dans le sac du kit de voile, puis empilez les sections de mât et de bôme dessus.
- Ajoutez les composants des rames dans le sac.
- Ajoutez le banc et l'emplanture de mât dans le sac.
- Ajoutez la grand-voile pliée, les lattes de voile et le jeu de cordages dans le sac.
- Ajoutez le foc plié et le jeu de cordages de foc dans le sac.
- Ajoutez enfin la pompe à main.
- Fermez fermement le sac avec les sangles et les boucles.
- Portez le sac par les poignées.
- Transportez et stockez le sac dans un endroit abrité et sec, à température normale, à l'abri des charges lourdes, des nuisibles, des substances dangereuses et des rayonnements.

#advice[Lors du rangement, le hale-dehors de bordure, le hale-bas et l'écoute de grand-voile avec leurs poulies restent fixés à la bôme. Le galhauban de chariot reste fixé aux œillets du tableau arrière dans le bateau.]

== 3.9 Installation des rames / avirons

Les bateaux DinghyGo sont équipés de rames divisibles, de dames de nage et d'un banc combiné avec puits de dérive.

- Assurez-vous que le banc est correctement installé (voir la section « Installation de l'emplanture de mât, du banc et du galhauban de chariot »).
- Pour installer les rames dans les dames de nage, tenez les rames parallèles aux boudins avec la pale orientée vers l'avant (pas vers l'arrière, elles n'entreraient pas) et insérez la goupille de fixation métallique aussi profondément que possible dans la dame de nage.
- Tournez ensuite les rames avec les pales vers l'extérieur, de sorte qu'elles soient bien fixées dans les dames de nage et puissent être utilisées correctement.
- Lorsque les rames ne sont pas utilisées, elles peuvent être rangées le long des boudins, maintenues par les dames de nage et les porte-rames élastiques à l'arrière des boudins latéraux.

#advice[Tenez compte des conditions locales avant d'amener votre DinghyGo à l'eau, que ce soit avec le kit de voile (sailkit), les rames ou un moteur hors-bord. Il est possible que la puissance propulsive du bateau ne soit pas suffisante pour naviguer contre un fort courant de marée ou de rivière.]

#caution[Une fixation incorrecte des rames peut endommager les goupilles de fixation et les dames de nage. Retirez le plastique superflu du bas de l'ouverture de la dame de nage si nécessaire.]

== 3.10 Installation d'un moteur hors-bord

#advice[Consultez le « tableau des spécifications du modèle » de ce guide pour connaître la puissance et le poids maximaux du moteur hors-bord.]

#advice[L'utilisation d'un moteur hors-bord dépassant la puissance ou le poids maximal peut avoir ces conséquences :
- Difficultés de maniabilité et/ou de stabilité du bateau
- Modification des caractéristiques de flottabilité ou de navigation prévues du bateau
- Dommages au bateau, notamment dans les zones autour du tableau arrière]

#advice[Utilisez un coupe-circuit d'urgence. Celui-ci arrêtera le moteur hors-bord si, pour une raison quelconque, l'opérateur du bateau a quitté les commandes.]

#danger[L'utilisation d'un moteur hors-bord avec une puissance ou un poids excessif peut entraîner des blessures graves, le décès ou des dommages à l'embarcation.]

=== 3.10.1 Montage du moteur hors-bord

- Assurez-vous d'être dans une position sûre et stable.
- Déverrouillez le moteur hors-bord de sorte qu'il soit possible d'incliner l'étrier, puis montez le moteur hors-bord sur le tableau arrière en utilisant les vis d'étrier.
- Le moteur hors-bord doit être installé au centre du tableau arrière pour être utilisé correctement. Lors de la pose du moteur hors-bord sur le tableau arrière, veillez à ne pas endommager les fémelots du gouvernail.
- L'étrier de fixation doit être vissé fermement sur les platines moteur du tableau arrière. Vérifiez cela périodiquement car sur certains moteurs, les vis d'étrier peuvent se desserrer par vibration pendant l'utilisation.

#caution[Il peut exister des moteurs hors-bord qui endommagent les fémelots du gouvernail lors de la fixation au tableau arrière. Assurez-vous que votre moteur hors-bord est adapté et, si nécessaire, faites-le ajuster par un expert. Vous pouvez également demander de l'aide à votre revendeur DinghyGo.]

=== 3.10.2 Position du moteur hors-bord

Le moteur hors-bord doit être installé de façon à ce qu'il soit vertical dans l'eau en position de fonctionnement normale. Cela signifie que la « plaque anti-cavitation » au bas du moteur hors-bord est placée horizontalement dans l'eau lorsque le bateau est en position normale. Sur la plupart des moteurs hors-bord, il existe un moyen de régler l'angle de l'arbre par rapport à l'étrier ; consultez votre revendeur de moteur hors-bord si vous n'êtes pas sûr de la façon de procéder.

=== 3.10.3 Démarrage du moteur hors-bord

- Poussez le bateau dans l'eau.
- Fixez le moteur hors-bord dans la position correcte avec les vis d'étrier.
- Assurez-vous d'être bien stable et démarrez ensuite le moteur hors-bord.
- Évitez les vitesses élevées lors de la marche arrière avec le bateau. Il est possible que l'eau entre dans le bateau par-dessus le tableau arrière.

#advice[Assurez-vous que l'auto-videur dans le tableau arrière est fermé avant de mettre le bateau à l'eau.]

== 3.11 Dégonflage du bateau

#advice[Assurez-vous que le bateau est propre et sec avant de le rouler pour le ranger. Retirez tout sable et débris qui pourraient adhérer au matériau de revêtement.]

#advice[Ne laissez pas le bateau se dégonfler chambre par chambre. Dégonflez les chambres de façon égale ; cela empêchera les dommages aux cloisons du bateau.]

Dégonflage :

- Posez le bateau sur le sol.
- Placez votre doigt dans la valve et tournez le bouton gris à vis vers la droite (pour plus d'informations sur les valves, voir « Les valves »).
- Laissez sortir un peu d'air des boudins et du fond.
- Assurez-vous que l'intérieur des valves est ouvert (pour permettre à l'air de sortir pendant le pliage).
- Appuyez uniformément sur l'ensemble du bateau pour expulser autant d'air que possible.

== 3.12 Pliage et rangement du bateau

- Posez le bateau sur le sol.
- Retirez toutes les pièces de voile et de rame, y compris le banc, l'emplanture de mât et les rames.
- Repliez les boudins latéraux vers le milieu, de sorte que l'ensemble du bateau ait la même largeur que le tableau arrière.
- Repliez la proue sur le pont.
- Ramenez la proue et le pont vers l'arrière jusqu'à l'extrémité du puits de dérive.
- Repliez les extrémités arrondies arrière des boudins vers le milieu du tableau arrière.
- Soulevez et tirez le tableau arrière vers l'avant sur la partie déjà pliée.
- Placez le paquet plié compact sur le sac de transport étalé.
- Repliez les deux petits puis les deux grands morceaux du sac autour du paquet et fixez-les avec les sangles et les boucles.

== 3.13 Transport

=== 3.13.1 Sortie du bateau de l'eau

Assurez-vous qu'il n'y a pas de bords tranchants à l'endroit où vous souhaitez soulever le bateau hors de l'eau. Utilisez de préférence les œillets de hissage ou les poignées pour soulever, et non les cordages.

=== 3.13.2 Remorquage du bateau

#advice[Si le bateau gonflable doit être remorqué par un autre bateau, il doit être vide :
- Retirez le gréement, le moteur hors-bord, le réservoir de carburant, les batteries et autres équipements.
- Fermez le puits de dérive dans le fond avec l'insert flexible fourni (en matériau EVA noir), roulez la partie flexible du puits de dérive et attachez-la avant de fermer.]

#advice[Important : La poignée à la proue ne doit pas être utilisée pour le remorquage, l'ancrage ou l'amarrage.
- Utilisez les anneaux métalliques situés sur les côtés bâbord et tribord de la proue pour le remorquage. Cela permet au bateau de rester stable derrière le bateau remorqueur et prévient les dommages à votre bateau.
- Fixez un bout entre les anneaux de remorquage pour former une croix. Fixez un bout de remorquage à celui-ci et remorquez le bateau à faible vitesse.]

#warning[
  - Ne remorquez jamais l'embarcation avec des personnes à bord.
  - Vérifiez régulièrement le bout de remorquage.
  - Vérifiez périodiquement les conditions de remorquage et assurez-vous qu'aucune eau n'entre dans l'embarcation.
]

// ─────────────────────────────────────────────
// CHAPITRE 4 : SÉCURITÉ ET UTILISATION
// ─────────────────────────────────────────────

= 4. Recommandations de sécurité et d'utilisation

== 4.1 Instructions importantes de sécurité

#advice[Coupe-circuit d'urgence et cordon

Le but du cordon du coupe-circuit d'urgence est d'arrêter le moteur hors-bord lorsque l'opérateur du bateau s'éloigne suffisamment de sa position d'opération, ce qui active le commutateur. C'est le cas lorsque l'opérateur tombe accidentellement par-dessus bord ou s'éloigne trop de son poste de pilotage dans le bateau. Tomber par-dessus bord ou être projeté accidentellement du siège sont des scénarios susceptibles de se produire après une utilisation incorrecte, par exemple en s'asseyant sur le plat-bord à des vitesses de planage, en se levant à des vitesses de planage, en opérant à des vitesses de planage en eau peu profonde ou dans des eaux avec de nombreux obstacles, en relâchant la barre qui tirait d'un côté, l'utilisation d'alcool ou de drogues, ou en effectuant des manœuvres à des vitesses dangereusement élevées.]

#align(center)[
  #image("../mkdocs/docs/images/image_09.png", width: 60%)
  #text(style: "italic", size: 9pt)[Schéma du coupe-circuit d'urgence]
]

Les moteurs hors-bord à barre et certaines télécommandes sont équipés d'un coupe-circuit d'urgence. Le cordon du coupe-circuit d'urgence mesure généralement entre 122 et 152 cm (4'-5') de long lorsqu'il est tendu. La première partie doit être placée à une extrémité du commutateur (voir « Schéma du coupe-circuit d'urgence », élément b.) et un système d'accrochage rapide (élément a.) doit être fixé à l'opérateur à l'autre extrémité. Le cordon est un cordon hélicoïdal afin qu'il soit aussi court que possible lorsqu'il n'est pas tendu, et pour que le risque d'enchevêtrement avec des objets proches soit le plus faible possible.

La longueur du cordon tendu est coordonnée de façon à ce que le risque d'activation accidentelle soit réduit au minimum. Si un cordon plus court est souhaité, il peut être enroulé autour du poignet ou de la jambe de l'opérateur, ou l'opérateur peut faire un nœud dans le cordon. Bien que le moteur hors-bord s'arrête immédiatement par l'activation du coupe-circuit d'urgence, le bateau continuera à naviguer ou à avancer sur son erre selon la vitesse et la netteté du virage.

Nous recommandons vivement que les autres passagers soient instruits des procédures correctes de démarrage et de fonctionnement, au cas où ils devraient faire fonctionner le moteur hors-bord en cas d'urgence.

#warning[Si l'opérateur tombe de l'embarcation, veuillez noter que l'arrêt immédiat du moteur hors-bord peut réduire la probabilité de décès ou de blessures graves par écrasement. Fixez solidement les deux extrémités du cordon du coupe-circuit d'urgence au coupe-circuit d'un côté et à l'opérateur de l'autre côté.]

#advice[Une activation accidentelle ou involontaire du commutateur pendant une utilisation normale peut également se produire. Cela peut causer une ou plusieurs des situations potentiellement dangereuses suivantes :
- Les passagers pourraient être projetés vers l'avant en raison d'un arrêt inattendu.
- La perte de puissance et la perte de contrôle directionnel peuvent survenir lors de fortes houles, de forts courants ou de vents violents.
- Perte de contrôle directionnel lors de l'accostage.]

#warning[Évitez les blessures graves ou le décès dus aux forces de décélération violentes résultant d'une activation accidentelle ou involontaire du coupe-circuit d'urgence. L'opérateur de l'embarcation ne doit jamais quitter son poste de pilotage sans avoir d'abord déconnecté le cordon du coupe-circuit d'urgence de son corps.]

== 4.2 Liste de contrôle essentielle avant utilisation

- Vérifiez la pression dans les chambres à air.
- Retirez tout obstacle de l'auto-videur dans le tableau arrière.
- Fermez l'auto-videur du tableau arrière.
- Assurez-vous que l'emplanture de mât, le banc / puits de dérive et le galhauban de chariot sont correctement installés.
- Assurez-vous que le bateau est correctement gréé et que le mât est positionné dans le pied de mât et fixé sous le pont avec le système de verrouillage à ressort.
- Assurez-vous que la dérive centrale est installée dans le puits de dérive avec le côté arrondi orienté vers la proue.
- Assurez-vous que le gouvernail est verrouillé dans le tableau arrière et que la barre est fixée dans la tête de gouvernail.
- Assurez-vous que le galhauban de chariot est fixé aux œillets du tableau arrière, qu'il passe par-dessus la barre et qu'il est attaché à la poulie d'écoute avec la manille à déclenchement rapide.
- Assurez-vous que les haubans sont solidement fixés avec la manille de hauban à l'œillet de la section supérieure du mât et aux anneaux en D des deux côtés du boudin avec les taquets de hauban.
- Assurez-vous que la manille du point d'amure de foc est fixée à l'anneau en D de la proue et que la drisse est solidement fixée avec le mousqueton à la tête de foc d'un côté et à travers l'anneau de foc dans le coinceur de l'autre côté (Orca 375 uniquement).
- Assurez-vous que le moteur hors-bord est solidement monté sur le tableau arrière et que le puits de dérive est fermé avec l'insert fourni si vous souhaitez naviguer à grande vitesse ou remorquer le bateau.
- Assurez-vous de connaître le contenu du réservoir de carburant et la vitesse du bateau.
- Vérifiez que le coupe-circuit d'urgence pour le moteur hors-bord fonctionne correctement.
- Assurez-vous que le bateau n'est pas surchargé. Veillez à ne pas dépasser le nombre maximum de passagers et la charge maximale. Vérifiez la plaque constructeur sur le bateau.
- Assurez-vous qu'il y a un gilet de sauvetage approuvé et approprié à bord pour chaque personne et qu'ils sont facilement accessibles.
- Vérifiez la présence des rames fixées au bateau en cas de problème avec le moteur hors-bord ou le gréement.
- L'utilisateur est conscient des procédures de navigation, de voile et d'exploitation en toute sécurité.
- Il y a une bouée de sauvetage ou un coussin flottant à bord en cas de personne tombée à l'eau.
- Répartissez le poids des passagers et de la charge de façon égale et assurez-vous que tout le monde est assis en sécurité.
- Instruisez au moins un passager dans les bases de la conduite du bateau au cas où l'opérateur serait incapacité ou tomberait par-dessus bord.
- Avant votre départ, dites à quelqu'un où vous allez et quand vous espérez revenir.
- Ne consommez pas d'alcool ni de drogues.
- Assurez-vous d'être familiarisé avec le temps, l'eau et la zone où vous allez naviguer.

#warning[
  - La propulsion maximale de l'embarcation (kW) est indiquée dans le tableau « Spécifications du modèle » de ce manuel.
  - N'utilisez pas l'embarcation avec un moteur hors-bord dont la puissance est supérieure à celle indiquée sur la plaque constructeur de l'embarcation.
  - N'utilisez pas l'embarcation avec des réglages de trim négatifs du moteur hors-bord (proue vers le bas) à grande vitesse.
  - N'utilisez pas l'embarcation à grande vitesse sur des voies navigables encombrées ou lorsque la visibilité est réduite, par vents forts, ou par fortes vagues.
  - Suivez les règles de navigation telles qu'établies par le COLREG.
  - Maintenez toujours une distance suffisante pour pouvoir vous arrêter ou vous déporter afin d'éviter les collisions.
]

#warning[L'eau de cale doit être réduite au minimum.]

== 4.3 Stabilité et flottabilité

=== 4.3.1 Placement des passagers et des effets personnels

Pour des raisons de sécurité, nous recommandons que les passagers soient assis aussi près que possible du milieu du bateau. La position des passagers a une incidence directe sur la stabilité et l'assiette du bateau. Vous pouvez vous asseoir sur le côté du bateau, à condition qu'un contrepoids soit assuré de l'autre côté, ou si cela est nécessaire pour des raisons de navigation à la voile. Assurez-vous que l'équipement non fixé est bien arrimé.

=== 4.3.2 Navigation à la voile

L'utilisation de l'équipement de voile (le kit de voile / sailkit) a une influence sur la liberté de mouvement des passagers et la stabilité de l'embarcation. L'opérateur doit prendre place derrière le banc sur le fond, de façon à pouvoir manœuvrer correctement le gouvernail et l'écoute de grand-voile. Par vents plus forts, il peut être nécessaire que l'opérateur s'assoie sur le boudin au vent pour contrebalancer le bateau et éviter le chavirement.

Les passagers doivent s'asseoir derrière ou devant le banc sur le fond, de façon à ne pas gêner la conduite du voilier et à ne pas mettre en danger leur sécurité personnelle.

Les passagers ont une responsabilité partagée pour maintenir la stabilité du voilier, notamment en aidant à prévenir le chavirement en adaptant leurs positions assises.

#warning[Une mauvaise utilisation du gréement, des changements soudains de comportement à la voile ou des conditions dangereuses peuvent entraîner un mouvement inattendu du gréement, permettant à des parties du gréement (la bôme en particulier) de causer des blessures à la tête ou des blessures mortelles.]

=== 4.3.3 Aviron / rame

La position des rames garantit une position de rame confortable. Utilisez le banc / puits de dérive fourni pour utiliser au mieux les possibilités de rame.

#warning[Sur le banc de rame combiné avec le puits de dérive, un seul adulte d'un poids maximum de 75 kg ou deux enfants de 37,5 kg peuvent être assis. Un poids supérieur à celui spécifié, ou le fait de se tenir debout ou de sauter sur le siège peut endommager le siège et l'embarcation et causer ainsi des blessures (graves).]

=== 4.3.4 Moteur hors-bord

Le fond du DinghyGo est conçu en forme de « V ». Cela améliore les caractéristiques de navigation à la voile (en particulier lors de la navigation au plus près du vent) et l'utilisation du moteur hors-bord. Il est donc également possible de faire planer votre DinghyGo sur l'eau.

#caution[Lors de la navigation à grande vitesse ou lors du planage, évitez les virages brusques et les fortes vagues ; cela peut mettre en danger les passagers. Assurez-vous que tout le monde tient les cordages de sécurité. Pour le confort et la sécurité, réduisez votre vitesse dans les fortes vagues. Les jeunes enfants doivent rester à l'intérieur de l'embarcation. Une vague déferlante constitue un danger sérieux pour la stabilité de l'embarcation. *Portez toujours un gilet de sauvetage !*]

#advice[Saut par-dessus les vagues et les sillages : Lors de la navigation avec une embarcation de plaisance, il est inévitable de rencontrer des vagues et des sillages. Cependant, lorsque cela est fait à des vitesses telles que le bateau est partiellement ou complètement soulevé hors de l'eau, certains dangers se présentent, en particulier au moment où le bateau rentre dans l'eau.]

#advice[La plus grande préoccupation est que le bateau change de direction pendant le saut. Un changement de direction brusque peut faire tomber des passagers du bateau ou de leur place.]

#advice[Il existe une autre situation dangereuse pouvant résulter du fait de laisser le bateau se soulever d'une vague ou d'un sillage. Si la proue monte suffisamment haut dans les airs, elle pourrait passer sous la surface de l'eau et être submergée quand elle touche l'eau. Cela arrêtera immédiatement le bateau et pourrait projeter les passagers vers l'avant.]

#advice[Si la vitesse est augmentée, la proue effectuera souvent un mouvement ascendant. Cela peut momentanément obstruer la vue de l'opérateur. Si vous rencontrez un vent fort en naviguant à moteur et que la proue est inclinée vers le haut, le vent peut soulever davantage le bateau (et dans des cas extrêmes le faire chavirer).]

#warning[Évitez les blessures graves ou mortelles résultant d'une chute dans l'embarcation lors de l'atterrissage après un saut par-dessus une vague ou un sillage. Évitez autant que possible de sauter par-dessus les vagues et les sillages. Instruisez tous les passagers de se baisser et de s'accrocher aux poignées de l'embarcation lorsque l'embarcation saute par-dessus une vague ou un sillage.]

#advice[Un seul opérateur : Si vous utilisez le bateau sans passagers, ne vous asseyez pas sur les boudins latéraux. Votre poids doit être placé aussi loin vers l'avant et le milieu que possible.]

#advice[Évitez les charges lourdes près du tableau arrière. Une accélération rapide doit être évitée pour empêcher l'opérateur d'être projeté vers l'arrière.]

#advice[Les conditions de vent et de vagues peuvent être très dangereuses pour votre DinghyGo. Vous risquez de chavirer si la charge n'est pas répartie uniformément, en particulier s'il y a trop peu de poids à la proue du bateau et que le vent et la marée travaillent contre le bateau.]

#advice[La plaque anti-cavitation du moteur doit être environ 20 mm sous le bas du tableau arrière. Si votre moteur hors-bord est réglé trop haut, vous ferez l'expérience de beaucoup de cavitation. Si votre moteur hors-bord est réglé trop bas, cela créera une résistance et de l'eau entrera dans le bateau. Consultez votre revendeur DinghyGo ou votre revendeur de moteur hors-bord.]

#advice[Nous recommandons de maintenir le bateau horizontal à toutes les vitesses. Utilisez le poids des passagers pour s'assurer que le bateau est horizontal.]

#advice[Virages : Réduisez la vitesse lors d'un virage serré. Le bateau s'inclinera considérablement vers le centre de rotation.]

== 4.4 Dangers, risques et aléas

#advice[Dangers dans l'eau : Les épaves, les récifs, les rochers, les bancs de sable et les eaux peu profondes doivent être évités ou abordés avec extrême prudence. Si vous ne connaissez pas la zone, obtenez des informations sur les risques locaux avant d'utiliser le bateau. Méfiez-vous des vents de terre et des courants.]

#advice[Chambres à air défectueuses et boudins endommagés : Votre DinghyGo est conçu pour fonctionner avec plus d'une chambre à air. Par conséquent, le bateau conserve toujours au moins 50% de sa flottabilité, même en cas de fuite dans l'une des chambres à air. Dans ce cas, déplacez le poids de l'autre côté. Sécurisez la chambre qui fuit si nécessaire et procédez immédiatement vers le rivage le plus proche ou le bateau mère. Méfiez-vous des eaux peu profondes ou des récifs.]

#advice[Plage d'échouage : Il n'est pas recommandé de naviguer sur la plage ou de tirer le bateau sur des rochers, du sable, du gravier ou un revêtement avec le moteur hors-bord en marche ou avec l'équipement de voile complet opérationnel. Le bateau et les composants du kit de voile tels que la dérive centrale et le gouvernail pourraient être endommagés.]

#advice[Daviers : Si le bateau est suspendu dans des daviers, vous devez ouvrir l'auto-videur afin que le bateau ne puisse pas se remplir d'eau et devenir trop lourd. Assurez-vous que des obstructions ne se produisent pas.]

#advice[Lumière solaire : Assurez-vous que le bateau n'est pas exposé trop longtemps au soleil. La pression d'air changeante à l'intérieur des boudins et du fond peut endommager le bateau. Des périodes prolongées de lumière solaire extrême peuvent accélérer le vieillissement des matériaux. Si le bateau doit être sorti de l'eau pour une longue période, couvrez-le pour éviter toute exposition directe au soleil.]

#advice[Tabagisme : Ne fumez pas, surtout lors du ravitaillement en carburant.]

#advice[Réservoir de carburant : Placez les réservoirs portables sur une surface souple et fixez-les solidement au bateau avec une sangle. Retirez les réservoirs portables du bateau pour les remplir. Remplissez les réservoirs en plein air, à l'écart de la chaleur, des étincelles ou des flammes nues. Ne remplissez pas les réservoirs complètement jusqu'au bord.]

#advice[Utilisation en altitude : La pression normale des boudins/fond est de 0,25/0,70 bar. Si le bateau est gonflé au niveau de la mer et transporté au-dessus du niveau de la mer, par exemple pour une utilisation dans un lac de montagne, la pression doit être réduite. Une soupape de surpression correctement fonctionnelle réglera cela par elle-même.]

#danger[Éteignez votre moteur hors-bord et arrêtez l'hélice lorsque des personnes nagent près de votre embarcation. L'hélice peut être très dangereuse pour les personnes ou les objets dans l'eau. *Éteignez immédiatement le moteur hors-bord si vous apercevez des nageurs à proximité de votre embarcation.*]

// ─────────────────────────────────────────────
// CHAPITRE 5 : ENTRETIEN
// ─────────────────────────────────────────────

= 5. Entretien

== 5.1 Entretien général

Produits de nettoyage / détergents

Utilisez les produits de nettoyage ménagers avec parcimonie et ne les rejetez jamais dans les voies navigables. Ne mélangez jamais différents types de produits de nettoyage et assurez-vous d'avoir une bonne ventilation dans les espaces fermés. N'utilisez jamais de détergents puissants, de solvants ou de produits contenant des phosphates, du chlore, des solvants, des produits non biodégradables ou des produits à base de pétrole. Les nettoyants à base d'acide citrique sont excellents pour le nettoyage maritime et sans danger pour vous et l'environnement. Votre DinghyGo se nettoie le mieux avec de l'eau douce et un détergent ménager ordinaire.

#advice[Les détergents et produits de nettoyage contenant de l'alcool ou des hydrocarbures ne doivent pas être utilisés sur le tissu du bateau. Ces produits dessécheront prématurément ou endommageront le bateau.]

#warning[Évitez les blessures graves/mortelles dues au feu, aux explosions ou à l'empoisonnement. Les adhésifs et solvants utilisés pour la réparation des parties gonflables sont toxiques et très inflammables. Par précaution, il est important de toujours travailler à l'extérieur ou dans un espace bien ventilé et loin de toute flamme nue, étincelle ou appareil avec brûleur pilote. L'inhalation de vapeurs et l'exposition cutanée peuvent être dangereuses pour votre santé. Évitez d'inhaler les vapeurs et tout contact avec la peau et les yeux en portant un respirateur à filtre à charbon et des équipements de protection sur toutes les parties exposées du corps.]

== 5.2 Réparations

=== 5.2.1 Petites réparations

Nous vous encourageons vivement à contacter votre revendeur DinghyGo si votre bateau est endommagé.

Si le dommage consiste en un petit trou, vous pouvez utiliser le matériau de réparation de la trousse de réparation.

Pour tout dommage plus important ou dans les cas où les pièces doivent être appliquées sur une couture, un technicien de réparation professionnel doit réparer les dommages. Contactez votre revendeur DinghyGo pour obtenir l'adresse la plus proche pour les réparations.

Les meilleurs résultats lors du collage sont obtenus lorsque l'humidité relative est inférieure à 60%, la température ambiante est comprise entre 18°C et 25°C (65°F-77°F) et il n'y a pas d'exposition directe au soleil.

Procédure générale :

- Découpez une pièce suffisamment grande pour déborder du dommage de 30 mm de chaque côté.
- Placez la pièce chevauchante sur la zone endommagée et tracez le contour de la pièce avec un crayon.
- Lissez la zone marquée avec du papier de verre (pas au point de rendre les fils du matériau visibles).
- Nettoyez la pièce et la zone autour du trou avec un solvant (par ex. MEK).
- À l'aide d'une brosse à poils courts, appliquez deux fines couches de colle en cercles sur l'envers de la pièce et sur la zone du bateau où la pièce sera placée. Laissez la première couche sécher complètement (environ 15 minutes) avant d'appliquer la seconde couche. La seconde couche doit sécher jusqu'à ce qu'elle soit légèrement collante, puis appliquez la pièce en appuyant fermement. Utilisez un objet lisse pour enlever les bulles d'air sous la pièce, en travaillant du centre vers l'extérieur.
- Attendez 24 heures avant de regonfler le bateau.

=== 5.2.2 Fuite d'air dans les boudins ou le fond due à une déchirure

I. Fuite d'air résultant d'une déchirure en L

- Évaluez la taille de la déchirure avec vos doigts et estimez si vous pouvez utiliser une petite brosse à l'intérieur de la déchirure. Si vous ne pouvez pas insérer vos doigts dans la déchirure, agrandissez-la avec un couteau pour avoir suffisamment d'espace. Préparez une pièce en matériau PVC renforcé de 0,7 mm d'épaisseur (de la trousse de réparation) et assurez-vous qu'elle est suffisamment grande pour couvrir complètement la déchirure.
- Nettoyez un côté de la pièce et l'intérieur de la déchirure avec un solvant (par ex. MEK). Puis appliquez de la colle sur les zones nettoyées.
- Attendez 15-20 minutes et vérifiez si la première couche de colle est sèche. Appliquez une seconde couche de colle aux mêmes endroits et attendez encore 15-20 minutes jusqu'à ce que la colle sèche.
- Insérez la pièce dans la déchirure et placez-la sous la déchirure. Appuyez doucement sur la partie supérieure correspondante et exercez une pression ferme afin d'obtenir une forte adhérence.
- Dégonflez la chambre à air à 70-80% de la pression d'air recommandée et appliquez de l'eau savonneuse sur la zone scellée pour détecter les fuites d'air.
- S'il n'y a pas de fuite, séchez complètement les zones. Vous allez maintenant appliquer une pièce sur l'extérieur de la déchirure.
- Préparez une pièce de la même taille en matériau PVC (0,9 mm, inclus dans la trousse de réparation) et répétez la procédure ci-dessus.

#caution[Une chambre à air réparée doit être laissée à sécher pendant au moins 24 heures avec une pression d'air inférieure à 80% de la pression d'air recommandée. Un gonflage complet trop tôt après la réparation peut entraîner une mauvaise adhérence des pièces.]

II. Fuite d'air causée par une coupure droite ou un petit trou

- Évaluez la taille de la déchirure avec vos doigts et estimez si vous pouvez utiliser une petite brosse à l'intérieur du trou. Si vous ne pouvez pas insérer vos doigts dans le trou, agrandissez la déchirure avec un couteau pour avoir suffisamment d'espace. Créez ensuite une pièce en matériau PVC renforcé (0,7 mm d'épaisseur) légèrement plus longue que le trou et d'une largeur d'environ 20-30 mm.
- Suivez la procédure décrite ci-dessus. Gonflez la chambre à moins de 80% de la pression d'air recommandée et laissez-la sécher pendant 24 heures dans un endroit sec.

Consultez votre revendeur DinghyGo local en cas de problème.

== 5.3 Stockage (hivernal)

#advice[Afin de prévenir la décoloration de la coque ou des chambres à air due aux dépôts ou à l'eau contaminée, évitez de laisser le bateau dans l'eau pendant une longue période.]

- Après la navigation, le bateau et tous ses composants doivent être lavés avec un savon doux puis rincés à l'eau douce. Séchez toutes les pièces avant de les ranger dans le sac de transport. Cela prévient les moisissures.
- Les composants avec un noyau en bois (par ex. tableau arrière, pont, banc et emplanture de mât) doivent être inspectés pour détecter tout dommage au revêtement. Les rayures et autres dommages susceptibles de mettre l'œuvre en bois sous-jacente en contact avec l'eau doivent être mis à jour et scellés avec du PVC ou du polyester.
- Pour conserver l'apparence neuve du bateau, rangez-le dans un endroit frais et sec et assurez-vous qu'il n'est pas exposé trop longtemps à la lumière directe du soleil.
- Une bâche de protection est disponible comme accessoire pour couvrir votre bateau pendant le stockage.
- Si vous prévoyez de ranger votre bateau pour une longue période, vous devez le sortir du sac fourni. Le bateau est replié trop serré dans le sac, ce qui provoque des plis nets dans le matériau.
- Au lieu de le ranger dans le sac, roulez ou pliez le bateau sans serrer et rangez-le dans un environnement sec pour le stockage à long terme.
- Ne placez pas d'objets lourds sur le bateau pour éviter les dommages pendant le stockage.
- Évitez la présence de rongeurs, d'insectes et d'autres nuisibles susceptibles de causer des dommages.

// ─────────────────────────────────────────────
// CHAPITRE 6 : L'ENVIRONNEMENT
// ─────────────────────────────────────────────

= 6. L'environnement

Respectez les lois, procédures et responsabilités environnementales.

== 6.1 Élimination des substances polluantes

Veillez à ce qu'aucun contaminant n'entre dans l'eau autour du bateau. Veuillez noter que l'utilisation de l'eau pour les sports nautiques vous donne la responsabilité d'assurer un environnement propre.

== 6.2 Élimination et gestion des déchets

Les « déchets » désignent collectivement tous les types de détritus aquatiques, l'élimination des plastiques, des emballages, de la nourriture, du bois, des détergents, des eaux usées et même des morceaux de poisson — en bref, presque tout. Nous vous recommandons de vous assurer de ramener tous vos déchets à terre et de les éliminer de façon responsable. Dans de nombreuses zones, le déversement d'eaux usées dans les voies navigables est strictement interdit.

== 6.3 Limites de vitesse recommandées

Soyez prudent lors de la navigation à grande vitesse, car elle peut :

- Mettre en danger vous-même et les autres, ou les personnes et les objets qui se trouvent dans l'eau ;
- Causer des vagues considérables derrière le bateau, pouvant causer des dommages ;
- Causer une nuisance sonore inutile aux autres plaisanciers.

== 6.4 Pollution sonore

Le « bruit » peut désigner le son du moteur hors-bord mais aussi les voix des personnes. Dans de nombreuses voies navigables, une limite de bruit est appliquée. La musique et les conversations animées s'entendent beaucoup plus loin sur l'eau que sur terre, particulièrement la nuit. Évitez la pollution sonore.

== 6.5 Émissions d'échappement

L'augmentation des émissions d'échappement (hydrocarbures) provoque la pollution de l'eau et de l'air. Gardez votre moteur hors-bord bien réglé et gardez la coque du bateau propre pour des performances optimales. Consultez le manuel du moteur hors-bord pour plus d'informations ou contactez votre revendeur DinghyGo.

// ─────────────────────────────────────────────
// ANNEXE : VIDÉOS D'INSTRUCTION
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Annexe — Vidéos d'instruction
]

_Remarque : les vidéos sont actuellement disponibles uniquement en anglais._

#v(4pt)

#table(
  columns: (auto, 1fr, auto),
  inset: (x: 6pt, y: 4pt),
  stroke: 0.3pt + rgb("#CCCCCC"),
  fill: (col, row) => if row == 0 { rgb("#E8E8E8") } else if calc.odd(row) { rgb("#FAFAFA") } else { white },
  table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 9pt)[Nr.]],
  table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 9pt)[Vidéo]],
  table.cell(fill: rgb("#E8E8E8"))[#text(weight: "bold", size: 9pt)[Durée]],
  [1], [#link("https://www.youtube.com/watch?v=zxRh_Q_bZgk")[Déballage des sacs]], [0:49 min],
  [2], [#link("https://www.youtube.com/watch?v=oUOsj_yCgS0")[Gonflage]], [1:39 min],
  [3], [#link("https://www.youtube.com/watch?v=gg9_5FmfOgU")[Assemblage]], [2:42 min],
  [4], [#link("https://www.youtube.com/watch?v=w_W0ky6Qbvc")[Installation]], [1:32 min],
  [5a], [#link("https://www.youtube.com/watch?v=_40ACnecYRE")[Gréement]], [2:42 min],
  [5b], [#link("https://www.youtube.com/watch?v=xHW386UeXBk")[Gréement du foc]], [2:16 min],
  [5c], [#link("https://www.youtube.com/watch?v=bDZj2TI22kE")[Prise de ris]], [0:48 min],
  [6a], [#link("https://www.youtube.com/watch?v=4Nv_KuIP8kc")[Préparation au départ]], [0:43 min],
  [6b], [#link("https://www.youtube.com/watch?v=nhVdMYadaSI")[Étanchéité du puits de dérive (optionnel)]], [0:46 min],
  [7a], [#link("https://www.youtube.com/watch?v=y6SufQDWvW4")[Dégréement]], [2:21 min],
  [7b], [#link("https://www.youtube.com/watch?v=AsbNRM45bjU")[Dégréement du foc]], [1:22 min],
  [8], [#link("https://www.youtube.com/watch?v=x4nvKOW4H1c")[Désinstallation et dégonflage]], [1:17 min],
  [9], [#link("https://www.youtube.com/watch?v=h08_MPSnieg")[Rangement du dériveur]], [2:35 min],
  [10], [#link("https://www.youtube.com/watch?v=3k8-jmAr4XQ")[Rangement du kit de voile]], [1:36 min],
)

// ─────────────────────────────────────────────
// ANNEXE : GARANTIE
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Annexe — Garantie
]

_Ces clauses de garantie font partie des Conditions Générales d'Aquacrafts B.V._

=== Article 16 GARANTIE

*16.1.* Le fournisseur garantit que le Produit livré présente les propriétés nécessaires à une utilisation normale, exempt de défauts, en tenant compte de toutes les circonstances.

*16.2.* Compte tenu des garanties énumérées ci-dessus, le fournisseur garantit l'absence de défauts structurels qui apparaissent après la livraison du Produit aux Clients pendant une période de 12 mois. Pour les livraisons aux Clients dans les pays de l'UE, le fournisseur garantit une période supplémentaire de 12 mois.

*16.3.* La garantie est valable après l'enregistrement des coordonnées du Client auprès du fournisseur ou de son représentant, ainsi que du numéro de série (numéro d'identification de l'embarcation) du Produit livré.

*16.4.* Le Client a droit à la réparation gratuite des défauts structurels du Produit par le fournisseur dans la période de garantie applicable. La garantie couvre les déchirures, la porosité, la pourriture et le délaminage du matériau ainsi que les coutures se décollant. Les frais de transport sont à la charge du Client.

*16.5.* Le Client a droit à la réparation gratuite des défauts structurels et au remplacement des composants associés du Produit, y compris mais sans s'y limiter le gréement, le banc, l'emplanture de mât, la dérive centrale, le gouvernail, la pompe à main et les sacs, valable dans les 12 premiers mois de la période de garantie valide. Les frais de transport sont à la charge du Client.

*16.6.* Les Produits suivants ne sont pas couverts par la garantie du fournisseur : moteurs hors-bord, générateurs, batteries, systèmes de gonflage automatiques, systèmes climatiques, roues de tableau arrière et toutes autres pièces et accessoires non fabriqués ou fournis par le fournisseur.

*16.7.* Le fournisseur n'est pas responsable des défauts découlant de la nature et de la qualité des matériaux utilisés, mais qui n'affectent pas l'utilisation du Produit, notamment mais sans s'y limiter la décoloration cosmétique et les dommages aux surfaces du matériau tels que les déchirures, les rayures, les bulles d'humidité, les bosses, les nids-de-poule, autres déformations, la corrosion, la décoloration, l'ternissement, les intempéries, les moisissures, la croissance d'organismes sous-marins, les modifications de texture et le décollement des bords.

*16.8.* Le fournisseur n'est pas responsable des défauts (après la livraison du Produit) causés par :

- L'usure normale, une manipulation incorrecte ou le non-respect des instructions d'utilisation, des conditions et des avertissements figurant dans le manuel d'utilisation et les supports d'instruction.
- Une mauvaise utilisation, un abus, une négligence, notamment mais sans s'y limiter un amarrage incorrect, des remorquages, une navigation, une pression excessive et insuffisante des chambres à air.
- Un entretien inexact, insuffisant et en retard et l'utilisation de produits de nettoyage et d'entretien inappropriés pour les pièces gonflables.
- L'utilisation d'un moteur hors-bord, d'un gréement, d'une installation de rame ou d'autres systèmes de propulsion dont la puissance ou le poids est supérieur à celui spécifié sur la plaque constructeur.
- Une surcharge, notamment et sans s'y limiter le nombre de passagers et le poids de chargement supérieur à celui spécifié sur la plaque constructeur.
- Une installation ou désinstallation incorrecte du moteur hors-bord, de l'équipement de voile et de rame.
- Une utilisation incorrecte de remorques, de daviers, de garage ou d'autres méthodes de stockage et de transport.
- La participation ou la préparation à des courses ou à d'autres sports de compétition, la location et le prêt de l'embarcation et d'autres activités commerciales.
- Les dommages, l'usure, la corrosion et la pourriture causés par des conditions environnementales anormales.
- La perte, le vol, la collision, les nuisibles et les accidents.
- Les dommages causés par des cas de force majeure.
- Les modifications du Produit apportées par des tiers ou par le Client, ou l'ajout de composants ou d'accessoires non approuvés par le fournisseur.

*16.9.* Le fournisseur n'est pas non plus responsable des dommages résultant des coûts engendrés par la sortie de l'eau de l'embarcation, la mise à l'eau de l'embarcation, le remorquage, l'amarrage, le nettoyage, l'entretien, le stockage, le chargement et le déchargement, le transport, les déplacements, l'attente, l'assurance, la location, la recherche, les communications, la médiation, les urgences ou la perte de revenus et de temps, et tous les autres types de dommages accessoires ou consécutifs.

=== Article 17 RÉCLAMATIONS AU TITRE DE LA GARANTIE

*17.1.* Les réclamations au titre de la garantie doivent être effectuées dans la période de garantie applicable aussi rapidement que possible et au plus tard 7 jours après l'événement d'un défaut possible du Produit par le Client, signalé par des moyens de communication à distance au fournisseur ou à son représentant.

*17.2.* Une réclamation au titre de la garantie pour un Produit contient les coordonnées, y compris le lieu de résidence ou l'adresse et l'adresse e-mail du Client, le numéro d'identification de l'embarcation, une définition claire du/des problème(s) incluant des photographies et/ou des vidéos détaillées du défaut.

*17.3.* Le fournisseur évaluera la réclamation au titre de la garantie dès que possible et répondra au plus tard 7 jours via des moyens de communication à distance.

*17.4.* L'utilisation du Produit après la découverte d'un défaut est la responsabilité et le risque du Client.

*17.5.* Après évaluation de la réclamation au titre de la garantie, le Client peut demander au fournisseur l'autorisation de continuer à utiliser temporairement un Produit présentant des défauts mineurs.

*17.6.* Si possible, le Client peut demander au fournisseur ou à son représentant de fournir le transport nécessaire pour l'inspection au titre de la garantie et/ou les réparations aux frais du Client.

*17.7.* Les conséquences des réclamations tardives sont aux risques et frais du Client.

// ─────────────────────────────────────────────
// ANNEXE : MONTAGE DU GOUVERNAIL
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Annexe — Montage du gouvernail (après déballage)
]

#figure(
  image("../mkdocs/docs/images/image_07.png", height: 148mm),
  caption: [Gouvernail relevable — Composants],
  supplement: none,
  placement: none,
)

#v(6pt)
#text(size: 9pt)[*Instructions de montage du gouvernail*]
#v(6pt)
#grid(
  columns: (1fr, 1fr),
  column-gutter: 20pt,
  row-gutter: 6pt,
  text(size: 9pt, fill: rgb("#0066cc"))[*a.* Faites glisser la tête de gouvernail (10) sur la pale de gouvernail (1).],
  text(size: 9pt, fill: rgb("#0066cc"))[*b.* Placez le boulon (14) dans le support de boulon (2).],
  text(size: 9pt, fill: rgb("#0066cc"))[*c.* Insérez le boulon (14) dans la tête de gouvernail (10) à travers la pale de gouvernail (1) et les trous de la tête. Assurez-vous que le support de boulon (2) se verrouille dans les 2 petits trous de la tête de gouvernail.],
  text(size: 9pt, fill: rgb("#0066cc"))[*d.* Vissez l'écrou papillon (15) sur le boulon (14).],
  text(size: 9pt, fill: rgb("#0066cc"))[*e.* Placez le protège-boulon (13) sur l'extrémité du boulon pour le protéger.],
  text(size: 9pt, fill: rgb("#0066cc"))[*f.* Insérez la barre (4) à travers les supports de barre (3 et 6) en appuyant et en relâchant le ressort de barre (5).],
)

// ─────────────────────────────────────────────
// ANNEXE : MONTAGE DE LA BÔME ORCA
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Annexe — Montage de la bôme Orca (après déballage)
]

#figure(
  image("../mkdocs/docs/images/image_11.png", height: 130mm),
  caption: [Montage de la bôme Orca],
  supplement: none,
  placement: none,
)

#v(6pt)
#text(size: 9pt)[*Légende*]
#v(4pt)
#legenda((
  (1, "Section de bôme 1"),
  (3, "Vit-de-mulet"),
  (2, "Arrêt de hale-bas"),
  (4, "Section de mât 1"),
))

#v(8pt)
#text(size: 9pt)[*Instructions de montage de la bôme Orca*]
#v(6pt)
#grid(
  columns: (1fr, 1fr),
  column-gutter: 20pt,
  row-gutter: 6pt,
  text(size: 9pt, fill: rgb("#0066cc"))[*a.* Posez la section de mât 1 (4) sur le sol.],
  text(size: 9pt, fill: rgb("#0066cc"))[*b.* Enclenchez le vit-de-mulet non monté (3) sur le mât (4).],
  text(size: 9pt, fill: rgb("#0066cc"))[*c.* Prenez la section de bôme 1 (1) et positionnez la face avant (la plus proche de l'arrêt de hale-bas (2)) sur le vit-de-mulet (3). Assurez-vous que l'arrêt de hale-bas (2) pointe vers le haut, parallèlement à la section de mât (4).],
  text(size: 9pt, fill: rgb("#0066cc"))[*d.* Appuyez fermement sur la section de bôme 1 (1) vers le bas jusqu'à ce que la section tubulaire du vit-de-mulet (3) soit complètement insérée dans la bôme.],
)

// ─────────────────────────────────────────────
// ANNEXE : DÉCLARATION DE CONFORMITÉ
// ─────────────────────────────────────────────

#pagebreak()
#[
  #show heading.where(level: 1): it => {
    v(2mm)
    block(fill: rgb("#ED1C24"), inset: (x: 8pt, y: 6pt), radius: 3pt, width: 100%,
      text(weight: "bold", size: 14pt, fill: white, it.body))
    v(4mm)
  }
  = Annexe — Déclaration de conformité
]

_Exemple de déclaration de conformité — DinghyGo Orca 375 V1.1_

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

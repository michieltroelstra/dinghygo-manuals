# DinghyGo Manuals — Project Context

## Doel
De DinghyGo owner's manual onderhouden en vertalen, en publiceren als
website (manual.dinghygo.com) + downloadbare PDF per taal.

## Bedrijfscontext
- **Merk**: DinghyGo (watersport / opblaasbare zeilboten)
- **Eigenaar**: Aquacrafts B.V. (KvK 74051396)
- **Modellen**: XS (Orca 375), MS (Orca 280), LS (Orca 325)

## Talen
| Code | Taal       | Markt          | Status |
|------|------------|----------------|--------|
| en   | Engels     | Internationaal | ✅ bron |
| nl   | Nederlands | Primair (NL)   | ✅ live |
| de   | Duits      | DE/AT/CH       | ✅ live |
| fr   | Frans      | FR/BE          | ✅ live |
| es   | Spaans     | ES             | ✅ live |

## Hoe het echt werkt (2026)

Twee outputs uit één set Markdown-bronnen in `published/`:

```
published/mkdocs/docs/manual{,_DE,_NL,_FR,_ES}.md   ← de bron
    │
    ├─→ mkdocs-material ──→ public/{en,de,nl,fr,es}/   ← de website
    └─→ Typst ────────────→ published/typst/*.pdf      ← de PDF-downloads
                                    │
                                    └─→ public/downloads/
```

`build.sh` draait beide: het begint met `rm -rf public/` en bouwt alle 5
taalsites opnieuw, kopieert daarna de Typst-PDF's naar `public/downloads/`.
`public/` is dus **build-output** — nooit committen (staat in `.gitignore`).

## Mapstructuur
```
DinghyGo_Manuals/
├── published/
│   ├── mkdocs/
│   │   ├── docs/           ← de Markdown-bronnen + images/ + stylesheets/
│   │   └── mkdocs_*.yml    ← 1 config per taal
│   ├── typst/              ← Typst-templates + gerenderde manual*.pdf
│   ├── subtitles/          ← ondertitels instructievideo's
│   └── improvements_*.md   ← reviewnotities per taal
├── glossary/terms.md       ← DinghyGo-terminologie NL/EN/DE/FR
├── source/                 ← originele 2020 owner's manual (.pages / .docx)
├── build.sh                ← bouwt public/ (5 sites + PDF's)
├── Dockerfile              ← draait build.sh, serveert public/ via nginx
└── TRANSLATION_GUIDE.md    ← stappenplan voor een nieuwe taal
```

## Deploy
Push naar `main` → GitHub Actions (`.github/workflows/coolify-deploy.yml`)
→ Coolify op de VPS (49.13.72.89) → manual.dinghygo.com.

## Terminologie
- `glossary/terms.md` — basis NL/EN/DE/FR-tabel in deze repo.
- De **autoritatieve** merkterminologie staat in de gedeelde
  Claude-memory `dinghygo_nl_terminology_glossary` (o.a. Giekkop,
  Aero-klemmen, oranje koker) plus de cross-taalmap gooseneck →
  NL Giekkop · DE Gooseneck-Beschlag · FR vit-de-mulet · IT snodo del boma ·
  ES cuello de cisne. De owner's manual is bij conflicten de bron van
  waarheid — AI-reviewers "corrigeren" merkeigen termen graag ten onrechte.
- De storefront + support-agent gebruiken dezelfde termen; wijk hier niet
  van af zonder ze mee te nemen.

## Afbeeldingen — aanpak
- Foto's / illustraties zonder tekst → hergebruiken as-is
- Diagrammen met tekstlabels → labels zijn vervangbaar
- Technische tekeningen met nummers → nummers in bijschrift vertalen,
  afbeelding hergebruiken

## Vertaal-instructies voor Claude
- Behoud alle Markdown-syntax exact (##, **, tabellen, lijsten)
- Behoud afbeeldingsreferenties: `![alt](images/foto.png)` — vertaal alleen
  de alt-tekst
- Behoud ankers voor de inhoudsopgave
- Gebruik de glossary hierboven; check bij twijfel de owner's manual
- Toon: helder, technisch maar toegankelijk (eindgebruiker = zeiler)

## Historie
Tot ~mei 2026 liep dit project via een pandoc round-trip
(`source/*.docx` → `markdown/` → `output/{nl,en,de,fr}/`). Die pipeline is
vervangen door mkdocs + Typst hierboven. De restanten (`public/` build-output,
`markdown/` pandoc-tussenbestanden, lege `output/`-mappen) zijn op
2026-08-14 opgeruimd; ze stonden 4 maanden untracked in de working tree.
`source/` is bewaard — dat zijn de originele 2020-documenten.

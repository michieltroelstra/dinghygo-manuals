# DinghyGo Manual — Translation Guide

How to add a new language version to the manual system.  
Follow steps a–g in order. Each language is fully independent.

---

## Language queue

| Priority | Language | Code | Source manual | Instruction video PDF | Status |
|---|---|---|---|---|---|
| 1 | 🇳🇱 Nederlands | `nl` | ✅ Available | ✅ Available | ⏳ To do |
| 2 | 🇫🇷 Français | `fr` | ❓ Check | ❓ Check | ⏳ To do |
| 3 | 🇪🇸 Español | `es` | ❓ Check | ❓ Check | ⏳ To do |

---

## Step-by-step process per language

### a. Source check
Locate the existing translated manual (PDF) to use as a **terminology reference** — not for copying text, but for correct nautical/product terms in the target language.

| Language | Source file location |
|---|---|
| 🇩🇪 German (done) | `/Users/Michiel/Documents/Aquacrafts B.V./DinghyGo/Documentation/Owner's manual/DinghyGo_Betriebsanleitung_May2020.pdf` |
| 🇳🇱 Nederlands | *(confirm path to Dutch 2020 manual before starting)* |
| 🇫🇷 Français | *(confirm path or note: not available)* |
| 🇪🇸 Español | *(confirm path or note: not available)* |

> If no source manual exists, translate directly from `manual.md` (English source). Native speaker review in step f becomes extra important.

---

### b. Video check
Locate the instruction video document for the language. This provides the **correct video titles, durations, and YouTube links** for the `Appendix — Instruction videos` section.

| Language | Video document location |
|---|---|
| 🇩🇪 German (done) | `/Users/Michiel/Documents/Aquacrafts B.V./DinghyGo/Documentation/Instructionvideo/DinghyGo Orca Anleitungsvideo 2022.pdf` |
| 🇳🇱 Nederlands | *(confirm path to Dutch instruction video PDF before starting)* |
| 🇫🇷 Français | *(confirm path or note: not available — use EN links)* |
| 🇪🇸 Español | *(confirm path or note: not available — use EN links)* |

> If no language-specific video document exists, use the English YouTube links from `manual.md` as a fallback.

---

### c. Translate
Create three new files using the English source (`manual.md`, `index.md`, `contents.md`) as the base.  
Use the source manual (step a) for terminology and the formal address form of the target language.

Replace `XX` with the language code (e.g. `NL`, `FR`, `ES`):

| File | Description |
|---|---|
| `trial/mkdocs/docs/index_XX.md` | Cover page — translate title, footer date |
| `trial/mkdocs/docs/contents_XX.md` | Table of contents — translate all chapter/section titles |
| `trial/mkdocs/docs/manual_XX.md` | Full manual — translate all content, admonitions, legenda tables |
| `trial/typst/manual_XX.typ` | Typst PDF source — mirrors `manual.typ`, translated content |

**Key settings to change in `manual_XX.typ`:**
- `#set text(lang: "XX")` — for correct hyphenation (e.g. `"nl"`, `"fr"`, `"es"`)
- Header: language-specific title and date (e.g. `Gebruiksaanwijzing`, `v5.0 mei 2026`)
- Callout labels: translate WARNING/DANGER/CAUTION/NOTE to target language
- Legenda table headers: translate `Nr.` / `Bezeichnung` equivalents

**Formal address form per language:**
| Language | Form | Example |
|---|---|---|
| 🇩🇪 German (done) | Sie (formal) | „Stellen Sie sicher, dass…" |
| 🇳🇱 Nederlands | u (formal) | „Zorg ervoor dat u…" |
| 🇫🇷 Français | vous (formal) | „Assurez-vous que vous…" |
| 🇪🇸 Español | usted/ustedes | „Asegúrese de que…" |

---

### d. Compile PDF
Run from the `trial/typst/` directory:

```bash
/Users/Michiel/bin/typst compile \
  --root "/Users/Michiel/Documents/Neoventures B.V./AI/DinghyGo_Manuals" \
  manual_XX.typ
```

Output: `trial/typst/manual_XX.pdf`

Check the compiled PDF in Preview for:
- Correct hyphenation
- Legenda tables formatting
- Callout boxes (VORSICHT/GEVAAR/etc.)
- Cover page date and title
- Instruction video links (clickable)

---

### e. Create MkDocs config
Create `trial/mkdocs/mkdocs_XX.yml` by copying `mkdocs_EN.yml` and updating:

```yaml
site_name: DinghyGo [Title in target language]
site_description: [Description in target language]
copyright: "© Aquacrafts B.V. — v5.0 [Month in target language] 2026"

nav:
  - [Cover in target language]: index_XX.md
  - [Contents in target language]: contents_XX.md
  - [Manual in target language]: manual_XX.md
```

**Nav labels per language:**

| Language | Cover | Contents | Manual |
|---|---|---|---|
| 🇬🇧 English (done) | Cover | Index | Manual |
| 🇩🇪 German (done) | Umschlag | Inhaltsverzeichnis | Betriebsanleitung |
| 🇳🇱 Nederlands | Omslag | Inhoudsopgave | Gebruiksaanwijzing |
| 🇫🇷 Français | Couverture | Table des matières | Manuel |
| 🇪🇸 Español | Portada | Índice | Manual |

**Dev server port per language** (for local preview):

| Language | Port | Command |
|---|---|---|
| 🇬🇧 English | 8000 | `mkdocs serve -f mkdocs_EN.yml --dev-addr=127.0.0.1:8000` |
| 🇩🇪 German | 8001 | `mkdocs serve -f mkdocs_DE.yml --dev-addr=127.0.0.1:8001` |
| 🇳🇱 Nederlands | 8002 | `mkdocs serve -f mkdocs_NL.yml --dev-addr=127.0.0.1:8002` |
| 🇫🇷 Français | 8003 | `mkdocs serve -f mkdocs_FR.yml --dev-addr=127.0.0.1:8003` |
| 🇪🇸 Español | 8004 | `mkdocs serve -f mkdocs_ES.yml --dev-addr=127.0.0.1:8004` |

---

### f. Review checklist
Create `trial/improvements_XX.md` — same format as `improvements_DE.md`.

This document lists:
- Grammar and address form issues found during translation
- Terminology decisions (especially nautical terms)
- Items requiring native speaker confirmation before sign-off

**Before approving, a native speaker with nautical background should confirm:**
- Nautical terminology in legenda tables
- Safety symbol labels (WARNING / DANGER / CAUTION equivalents)
- Formal address form used consistently throughout

---

### g. Git push → auto-deploy
Once Michiel has approved the translation:

```bash
cd "/Users/Michiel/Documents/Neoventures B.V./AI/DinghyGo_Manuals"
git add trial/mkdocs/docs/manual_XX.md
git add trial/mkdocs/docs/index_XX.md
git add trial/mkdocs/docs/contents_XX.md
git add trial/mkdocs/mkdocs_XX.yml
git add trial/typst/manual_XX.typ
git add trial/typst/manual_XX.pdf
git add trial/improvements_XX.md
git commit -m "Add XX language manual (vX.0)"
git push
```

Coolify auto-deploys → `manual.dinghygo.com/XX/` goes live.

---

## Files created per language (summary)

```
trial/
├── mkdocs/
│   ├── mkdocs_XX.yml              ← MkDocs config (new)
│   └── docs/
│       ├── index_XX.md            ← Cover page (new)
│       ├── contents_XX.md         ← Table of contents (new)
│       └── manual_XX.md           ← Full manual (new)
└── typst/
    ├── manual_XX.typ              ← Typst PDF source (new)
    └── manual_XX.pdf              ← Compiled PDF (new)
```

---

## Deployed site structure

```
manual.dinghygo.com/
├── en/    ← English (mkdocs_EN.yml)
├── de/    ← German  (mkdocs_DE.yml)
├── nl/    ← Dutch   (mkdocs_NL.yml)   ← next
├── fr/    ← French  (mkdocs_FR.yml)
└── es/    ← Spanish (mkdocs_ES.yml)
```

---

*Last updated: May 2026 — Aquacrafts B.V. / Neoventures B.V.*

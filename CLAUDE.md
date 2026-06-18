# CLAUDE.md — Giulio Salvatori · CV + personal website

This file is the project's memory. It carries over everything decided in the chat
where this project was started. Read it before working; keep it updated as things change.

## What this project is

Two related deliverables in one repo:

1. **`cv/`** — a warm, Californian-minimal academic CV, authored in **XeLaTeX**
   (`cv/cv.tex`). This is the canonical source; the PDF and HTML are build/legacy outputs.
2. **`web/`** — a personal website (single-page static site for now) that reuses the
   same visual language: CV download, selected works, an interactive demo, talks, and
   links (GitHub, arXiv, INSPIRE, ORCID).

The bigger goal is the **website**; the CV is mostly curated and should stay in sync with it.

## Who this is for

Giulio Salvatori — theoretical physicist (scattering amplitudes, positive geometry,
"surfaceology", tropical geometry; also precision-QCD Feynman integrals). MSCA Global
Fellow split between the Institute for Advanced Study (Princeton) and the Max Planck
Institute for Physics (Munich).

- Email: giulio.salvatori.0@gmail.com
- ORCID: 0000-0002-5961-3210
- INSPIRE-HEP: https://inspirehep.net/authors/2098300
- arXiv author page: https://arxiv.org/a/salvatori_g_1  *(verify this resolves)*
- GitHub: https://github.com/mojito2
- **GitHub handle** `mojito2` — wired into `web/index.html`.

## Design system (the look Giulio approved)

Warm, calm, "Anthropic / Californian-minimal." Reuse these tokens everywhere (CV + web).

| token        | value     | use |
| :----------- | :-------- | :-- |
| `--paper`    | `#FAF6EE` | warm ivory background |
| `--ink`      | `#2A2521` | primary text (espresso) |
| `--inksoft`  | `#6E6358` | secondary text |
| `--inkfaint` | `#A99E8E` | tertiary / captions |
| `--clay`     | `#C2693F` | terracotta accent |
| `--claydeep` | `#A8542F` | deeper accent (years, emphasis, links) |
| `--line`     | `#E8DDCC` | hairline rules |
| `--wash`     | `#F3EADC` | soft band fills |
| `--chip`     | `#EFE0D2` | pill backgrounds |

**Type:** display/headings in **Fraunces** (soft optical serif; warm, slightly playful);
body and labels in **Inter**. Section headers are small uppercase letter-spaced "eyebrows"
in clay. Numbers/years use Fraunces.

**Signature motif:** a **triangulated heptagon** — a vertex of the associahedron, the
polytope at the centre of Giulio's amplitudes work. Used as a small SVG mark in the
header of both the CV and the site. Keep design choices grounded in his actual research
rather than generic decoration.

**Voice/tone:** warm, precise, never inflated. Short and concrete. Avoid over-formatting
(minimal bold/bullets) in prose.

## CV status & rules

Source of truth: `cv/cv.tex` (compile with `xelatex cv.tex`, **not** pdfLaTeX). Fonts are
bundled in `cv/texfonts/` (static instances of Fraunces & Inter) and referenced via
`Path=texfonts/`, so no system font install is needed. Spacing is centralized in the
"spacing knobs" block near the top.

Layout: warm header (name, italic tagline, one-line intro, contact, heptagon) → ledger
sections (`\entry[colwidth]{year}{content}`) → Press → Publications
(`\publication*{…}` adds a ★) → Organizing → Talks → Mentoring/Teaching → Skills.

Decisions already made (do not silently undo):
- 17 publications total; the two newest were added: **SubTropica** (arXiv:2604.20954,
  Giroux/Mizera) and **Configuration Spaces of Finite Representation Type Algebras**
  (arXiv:2512.24870). Both sit at the top (most recent).
- ★ on entries **1, 3, 5, 9, 15** (SubTropica; Sampling Problem; Tropical Subtraction
  Schemes; Counting Problem; Halohedron).
- "All Loop Scattering as a Sampling Problem" is published: **JHEP 02, 196 (2026)**.
- The PIRSA talk is **"A Primer on Surfaceology", Perimeter Institute, 2025** (an earlier
  wrong title, "Twisted D-branes…", was corrected — do not reintroduce it).
- "Press" (Quanta Magazine feature) sits as its own section *above* Publications.
- Vertical spacing was deliberately loosened (currently ~3 pages).

### Open TODOs / things to verify (don't fabricate — check INSPIRE / ask Giulio)
- **The Cut Equation** (arXiv:2412.21027): still "submitted to JHEP" with no volume/article
  number found. Update to a JHEP reference only once Giulio confirms it.
- **Citation stats** in the CV (15→17 pubs, "44.8 avg", "h-index 13") are carried over and
  may be stale. Refresh from the live INSPIRE page (the page is JS-rendered; the API path
  may be blocked from some fetchers — Giulio can paste the citation summary).
- **Mentee name spelling**: shown as "Kasprzak" (the original CV had "Kasprazk", assumed a
  typo). Confirm with Giulio.
- Never invent publication data, venues, or citation numbers. Verify against INSPIRE.

## Website status & plan

`web/index.html` is a **self-contained starter** (inline CSS + JS, Google Fonts) and is
ready to deploy as-is. It has: sticky nav, hero with the heptagon + CV download + link
buttons, Research, Selected work (the starred papers), an interactive **associahedron
demo** (step through the 14 triangulations of a hexagon), Talks, Links, footer.

`web/demos.html` is a **scrollytelling demos page**: a sticky visual driven by an
`IntersectionObserver` walks through the associahedron story (polygon → triangulation →
single flip → all 14 → the flip-graph polytope, force-laid). Dependency-free. The home
page's nav ("Demos") and its inline demo both link here. Add more demos by appending
`.step` blocks plus graphic states — the CSS/JS pattern is reusable.

Roadmap / ideas to build out in Claude Code:
- Confirm the **arXiv author URL** resolves (GitHub `mojito2` and the Quanta feature link
  are already wired in).
- Optionally split `index.html` into `index.html` + `styles.css` + `app.js` as it grows.
- Richer **demo** section: e.g. an embedded interactive associahedron/surface, or a small
  visualization tied to a paper. Keep it lightweight and on-theme.
- A **selected works** page with abstracts, or pull the publication list from INSPIRE.
- More **demos** on `demos.html` (the scrollytelling pattern is in place).
- Favicon + social preview (use the heptagon motif).
- Light/dark toggle (palette already has a dark-friendly direction).
- Deployment is wired: GitHub Pages via `.github/workflows/deploy.yml` (see below).

### Hosting — GitHub Pages (decided)
Deployment is set up via **`.github/workflows/deploy.yml`**, which publishes the `web/`
folder on every push to `main`. **One-time setup:** in the repo, Settings → Pages →
"Build and deployment" → Source: **GitHub Actions**.

Tip: naming the repo **`mojito2.github.io`** serves the site at the clean root URL
`https://mojito2.github.io`; any other repo name gives `https://mojito2.github.io/<repo>`.
Free HTTPS; custom domains supported.

When the CV changes, run **`bash scripts/build-cv.sh`** to recompile `cv/cv.tex` and copy
the fresh PDF into `web/cv/` (the workflow deploys whatever is committed in `web/`; it does
not run LaTeX in CI).

Vercel / Netlify would only be worth it if the site grows into a framework (Astro/Next) or
needs preview deploys, forms, or serverless functions. Both connect to the same repo, so
switching later is painless. Not needed.

## Repo layout

```
.
├── CLAUDE.md                 ← this file
├── README.md
├── .github/workflows/deploy.yml  ← deploys web/ to GitHub Pages on push to main
├── scripts/build-cv.sh       ← recompile cv.tex and copy the PDF into web/cv/
├── cv/
│   ├── cv.tex                ← canonical CV source (XeLaTeX)
│   ├── texfonts/             ← bundled Fraunces & Inter static instances
│   ├── Giulio-Salvatori-CV.pdf   ← last compiled PDF
│   └── Giulio-Salvatori-CV.html  ← earlier HTML version of the CV
└── web/                      ← the deployable site root (Pages publishes this folder)
    ├── index.html            ← home page (self-contained)
    ├── demos.html            ← scrollytelling demos page (associahedron story)
    ├── cv/
    │   └── Giulio-Salvatori-CV.pdf   ← published CV the site links to (copy of the cv/ build)
    └── assets/               ← images, favicon, social preview
```

Note: `web/` is the site root. The site links to `cv/Giulio-Salvatori-CV.pdf` *relative to
`web/`*, so the published PDF lives at `web/cv/`. The canonical LaTeX source stays in the
top-level `cv/`; when the CV changes, run `bash scripts/build-cv.sh` to recompile and copy
the PDF into `web/cv/`. The Quanta link points at:
https://www.quantamagazine.org/physicists-reveal-a-quantum-geometry-that-exists-outside-of-space-and-time-20240925/

## Build / preview commands

- **CV:** `bash scripts/build-cv.sh` (recompiles `cv/cv.tex` with XeLaTeX and refreshes
  both `cv/` and `web/cv/` PDFs). Or directly: `cd cv && xelatex cv.tex`. Needs TeX Live.
- **Website:** open `web/index.html` directly, or serve the folder:
  `cd web && python3 -m http.server 8000` then visit http://localhost:8000 . No build step.
  `demos.html` is reachable from the nav and the home page's demo section.

## Working preferences (carried over from chat)
- Keep replies and outputs **concise**; warm, plain-prose tone; minimal formatting.
- For the CV, prefer the centralized spacing knobs over hand-tweaking individual rows.
- Accuracy first on anything factual (publications, talks, citations): verify, don't guess.
- The visual identity is settled — extend it consistently rather than redesigning.

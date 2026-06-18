# Giulio Salvatori — CV + personal website

Source for Giulio Salvatori's academic CV and personal website. Warm, Californian-minimal
visual language shared across both.

## Quick start

**Website** (no build step):
```bash
cd web && python3 -m http.server 8000   # then open http://localhost:8000
```
Or just open `web/index.html` in a browser. The scrollytelling demo is at `web/demos.html`
(linked from the nav and the home page).

**CV** (XeLaTeX — not pdfLaTeX):
```bash
bash scripts/build-cv.sh                 # recompiles cv/cv.tex, refreshes the PDFs
```
Fonts are bundled in `cv/texfonts/`; no system install needed.

## Layout

- `CLAUDE.md` — project memory: design system, content decisions, open TODOs, roadmap.
  **Read this first**, especially when working with Claude Code.
- `cv/` — `cv.tex` (canonical), bundled fonts, compiled PDF + an HTML version.
- `web/` — the deployable site: `index.html`, `demos.html`, `cv/` (published PDF), `assets/`.
- `scripts/build-cv.sh` — recompile the CV and copy the PDF into `web/cv/`.
- `.github/workflows/deploy.yml` — deploys `web/` to GitHub Pages.

## Deploy (GitHub Pages)

Push to `main`. One-time: repo **Settings → Pages → Source: GitHub Actions**. The workflow
publishes the `web/` folder. Naming the repo `mojito2.github.io` serves it at
`https://mojito2.github.io`; otherwise it's `https://mojito2.github.io/<repo>`.

## Working with Claude Code

Open this folder in Claude Code. `CLAUDE.md` loads automatically and carries the full
context built up in chat — palette, fonts, the associahedron motif, the CV's current state,
and the roadmap. Before changing publications or citation numbers, read the "Open TODOs" in
`CLAUDE.md` (some items need Giulio to confirm; nothing factual should be invented).

## Still to personalize

- Confirm the arXiv author URL resolves.
- (GitHub handle `mojito2` and the Quanta link are already wired in.)

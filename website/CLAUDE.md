# hinzke.rocks Website

Personal-Branding-Seite für Magnus Hinzke. Astro 5, statisch, kein SSR.

## Tech-Stack
- Astro 5 (Static Site Generation)
- Pures CSS mit Catppuccin Latte Custom Properties
- JetBrains Mono (Headlines, Mono-Elemente) + Inter (Fließtext)
- Fonts self-hosted in public/fonts/

## Konventionen
- Komponenten: PascalCase (.astro)
- Seiten: Kleinbuchstaben mit Bindestrichen
- CSS: Scoped per Komponente, globale Variablen in BaseLayout
- Keine Tailwind — pures CSS mit Custom Properties

## Farben (Catppuccin Latte)
- Accent: --ctp-mauve (#8839ef)
- Accent Hover: --ctp-blue (#1e66f5)
- Background: --ctp-base (#eff1f5)
- Text: --ctp-text (#4c4f69)

## Struktur
- src/layouts/BaseLayout.astro — HTML-Shell, Fonts, CSS, SEO, Schema
- src/components/ — Wiederverwendbare Komponenten
- src/pages/ — Astro-Seiten (index, ueber-mich, impressum, datenschutz)
- public/fonts/ — Self-hosted WOFF2
- public/images/ — Profilbild etc.

## Build
```bash
npm run dev    # Dev-Server
npm run build  # Production Build
```

# Kuno Banner — agent guide

Rules for anyone changing this repo, people and AI agents alike. Org-wide conventions
(README, licenses, commits) are in the
[contributing guide](https://github.com/somos-criptonautas/.github/blob/main/CONTRIBUTING.md).

## Scope

A Discourse **theme component** for the Horizon theme. All work stays within:

```
javascripts/   ← api-initializer, the banner component, lib/ helpers
common/        ← common.scss
locales/       ← en.yml, es.yml (always both)
settings.yml   ← theme settings
test/          ← QUnit acceptance tests
spec/          ← core features system spec
```

## What it depends on

- **`discovery-above` outlet**: inside `discovery-layout__content`, so it sits in
  Horizon's main column below the welcome banner (`above_topic_content`). If the banner
  moves after a core update, check that outlet in `components/discovery/layout.gjs`.
- **Homepage test** copied from core's welcome banner:
  `discovery.${defaultHomepage()}`.
- **`/tag/<tag>.json`**, read as the viewer.

## Gotchas

- The rotation pool must be stable through the day: topics are sorted by id, because the
  tag list comes bumped-first and would reshuffle on every reply.
- `supported_kunos` ends up in an `href`: keep the https-only filter in
  `lib/kuno-banner.js`.
- Topic titles render with `{{}}` from `title`, not `fancy_title` (which is HTML-escaped
  and would show entities).
- Theme settings are read on each use, not at import, so tests can change them.

## Checks

```bash
pnpm install && pnpm lint
```

CI runs lint, the QUnit tests in `test/` and the core features spec. Lint and tests run
without Horizon, so also install the component on a Horizon site and look at the
homepage.

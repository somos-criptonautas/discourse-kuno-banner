# Kuno Banner

**ENGLISH** | [ESPAÑOL](README.es.md)

Maintained by Criptonautas. Not affiliated with or endorsed by Discourse (Civilized Discourse Construction Kit, Inc.).

A dismissable homepage banner that changes every day, showing either a forum topic with
a chosen tag or an external [Kuno](https://codeberg.org/nebras/kuno) Monero fundraiser
the community supports. Built for the
[Horizon](https://meta.discourse.org/t/horizon-theme/360486) theme.

## What it does

- **One pool, one item a day.** Topics with `kuno_tag` (oldest first) followed by the
  `supported_kunos` URLs. Everyone sees the same item on the same UTC day; the next day
  moves one step and wraps around.
- **Tagged topics** show their title, linking to the topic.
- **Supported Kunos** show *"Heads up! We are supporting this external Kuno:"* and the
  link, opened in a new tab. Only `https://` URLs are kept.
- **Dismissable.** The close button hides the banner in that browser until the next
  day's item. Works for signed-out visitors too.
- **Homepage only**, in Horizon's main column under the welcome banner and above the
  topic list. Nothing renders when the pool is empty.

## Settings

| Setting | Default | |
|---|---|---|
| `kuno_tag` | `kuno` | Tag whose topics join the rotation. Empty to show only supported Kunos. |
| `supported_kunos` | empty | External Kuno fundraiser URLs. |

The banner text lives in the component's translations (`kuno_banner.supporting`).

## Limits

- **No live Kuno data.** Kuno publishes no API or feed, so supported Kunos show their
  URL, not their title or progress.
- **Private tags stay private.** Topics are read from `/tag/<tag>.json` as the viewer,
  so visitors who can't see a topic don't get it in their rotation, and their day's
  pick can differ.

## Install

**Admin → Appearance → Themes & components → Install**, from this repository's URL, then
add it to Horizon.

## Development

`pnpm install && pnpm lint`. CI also runs the QUnit tests in `test/` and the core
features spec. Contributor notes are in [AGENTS.md](AGENTS.md).

## License

MIT. See [LICENSE](LICENSE).

Text of this README under [CC BY-NC-SA 4.0](CC-BY-NC-SA-4.0.txt).

# Architecture

## Purpose

`mobile-briefing-companion` compresses strategy and governance signals into a phone-first surface that still feels deliberate, not like a shrunken desktop dashboard.

The app is built around three mobile modes:

- `Briefing`: the top-line pack and immediate board note
- `Signals`: the feed of what changed across revenue, risk, and AI
- `Actions`: the execution queue with owners and time pressure

## UI Shape

The app uses:

- a dark editorial control-room palette
- rounded cards with strong mobile spacing
- a bottom navigation shell
- horizontally scrollable briefing packs
- signal cards with clear semantic color cues

## Why Flutter

Flutter is the right fit here because it broadens the portfolio into mobile application work while still preserving the internal-tool and strategy-surface language already established elsewhere in the portfolio.

## Validation Strategy

The repo is intentionally one-shot:

- `flutter analyze`
- `flutter test`
- `flutter build web`
- generated PNG screenshot proof for the README


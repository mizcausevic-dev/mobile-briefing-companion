# Mobile Briefing Companion

`mobile-briefing-companion` is a Flutter mobile app for executive briefings, signal summaries, risk updates, and portable strategy review workflows.

It turns the portfolio’s control-room themes into a mobile surface: what changed, why it matters, and which action should move next, all compressed into a phone-first briefing flow.

## Screenshots

### Hero
![Hero](./screenshots/01-hero.png)

### Signal Lanes
![Signal lanes](./screenshots/02-signals.png)

### Briefing Packs
![Briefing packs](./screenshots/03-briefing-packs.png)

### Anatomy Mode
![Anatomy mode](./screenshots/04-action-queue.png)

## Features

- Mobile-first briefing shell with premium top chrome and bottom navigation
- Revenue, risk, and AI signal lanes
- Board-ready briefing packs
- Action queue with owner and ETA framing
- Repo anatomy mode that explains how the artifact is built
- Runs on Flutter desktop and web targets for quick local proof

## Local Run

```powershell
cd mobile-briefing-companion
# Ensure `flutter` is installed and available on PATH.
flutter pub get
flutter run -d windows
```

If you prefer a browser target:

```powershell
flutter run -d web-server --web-port 4558
```

## Validation

```powershell
cd mobile-briefing-companion
# Ensure `flutter` is installed and available on PATH.
flutter analyze
flutter test
flutter build web
py -3.11 -m pip install -r requirements-dev.txt
py -3.11 scripts\render_readme_assets.py
```

## Repo Layout

- [lib/main.dart](./lib/main.dart)
- [test/widget_test.dart](./test/widget_test.dart)
- [docs/architecture.md](./docs/architecture.md)
- [scripts/render_readme_assets.py](./scripts/render_readme_assets.py)

---

**Connect:** [LinkedIn](https://www.linkedin.com/in/mirzacausevic/) · [Kinetic Gain](https://kineticgain.com) · [Medium](https://medium.com/@mizcausevic/) · [Skills](https://mizcausevic.com/skills/)

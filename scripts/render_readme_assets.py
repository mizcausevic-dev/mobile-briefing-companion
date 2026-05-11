from __future__ import annotations

from pathlib import Path

from PIL import Image, ImageDraw, ImageFont


ROOT = Path(__file__).resolve().parents[1]
OUT_DIR = ROOT / "screenshots"
BG = "#07111d"
PHONE = "#102033"
CARD = "#16283f"
TEXT = "#f5eedd"
MUTED = "#b1bed0"
ACCENT = "#84cbff"
PINK = "#f6bfd8"
YELLOW = "#f4d17c"
GREEN = "#93e3b1"
EDGE = "#294a70"


def font(size: int, bold: bool = False):
    candidates = [
        "C:/Windows/Fonts/segoeuib.ttf" if bold else "C:/Windows/Fonts/segoeui.ttf",
        "C:/Windows/Fonts/arialbd.ttf" if bold else "C:/Windows/Fonts/arial.ttf",
    ]
    for candidate in candidates:
        if Path(candidate).exists():
            return ImageFont.truetype(candidate, size)
    return ImageFont.load_default()


def rounded(draw, box, fill, outline=EDGE, width=2, radius=24):
    draw.rounded_rectangle(box, radius=radius, fill=fill, outline=outline, width=width)


def write(draw, xy, text, fill, size, bold=False, spacing=6):
    draw.multiline_text(xy, text, font=font(size, bold), fill=fill, spacing=spacing)


def phone_shell(draw, x1, y1, x2, y2):
    rounded(draw, (x1, y1, x2, y2), PHONE, radius=42)
    draw.rounded_rectangle((x1 + 120, y1 + 16, x2 - 120, y1 + 34), radius=10, fill="#223b59")


def hero():
    img = Image.new("RGB", (1500, 940), BG)
    draw = ImageDraw.Draw(img)
    phone_shell(draw, 455, 40, 1045, 900)
    write(draw, (520, 105), "16:30 board prep", ACCENT, 18, True)
    write(draw, (520, 160), "Mobile Briefing\nCompanion", TEXT, 42, True)
    write(draw, (520, 280), "Portable briefing packs for revenue,\nrisk, AI, and operations leaders.", MUTED, 21)
    metrics = [("Packs", "6"), ("Signals", "41"), ("Escalations", "9")]
    x = 520
    for label, value in metrics:
      rounded(draw, (x, 380, x + 148, 498), CARD, radius=22)
      write(draw, (x + 18, 402), label.upper(), MUTED, 12)
      write(draw, (x + 18, 434), value, TEXT, 28, True)
      x += 164
    rounded(draw, (520, 540, 980, 702), CARD, radius=28)
    write(draw, (550, 568), "MOST IMPORTANT NEXT MOVE", PINK, 13)
    write(draw, (550, 602), "Hold deletion in the\nfinance lane.", TEXT, 30, True)
    write(draw, (550, 685), "Risk: Freeze", YELLOW, 16, True)
    return img


def signals():
    img = Image.new("RGB", (1500, 960), BG)
    draw = ImageDraw.Draw(img)
    phone_shell(draw, 455, 30, 1045, 920)
    write(draw, (520, 105), "Signal lanes", TEXT, 38, True)
    cards = [
        (PINK, "Revenue", "Pipeline pressure is drifting\ninto the board deck."),
        (YELLOW, "Risk", "Legal hold scope widened\nin the finance lane."),
        (GREEN, "AI Ops", "Model release is clear,\nbut add one footnote."),
    ]
    y = 190
    for color, badge, body in cards:
        rounded(draw, (510, y, 990, y + 180), CARD, radius=24)
        write(draw, (540, y + 24), badge.upper(), color, 15, True)
        write(draw, (540, y + 62), body, TEXT, 28, True)
        y += 204
    return img


def packs():
    img = Image.new("RGB", (1500, 940), BG)
    draw = ImageDraw.Draw(img)
    phone_shell(draw, 455, 40, 1045, 900)
    write(draw, (520, 105), "Briefing packs", TEXT, 38, True)
    x = 520
    items = [
        ("Board", "Revenue, risk, and AI summary", PINK),
        ("Launch", "Release note and dependency watch", ACCENT),
        ("Governance", "Legal hold and retention posture", YELLOW),
    ]
    for title, subtitle, color in items:
        rounded(draw, (x, 190, x + 260, 560), CARD, radius=28)
        write(draw, (x + 20, 220), title, color, 18, True)
        write(draw, (x + 20, 280), subtitle, TEXT, 28, True)
        write(draw, (x + 20, 486), "Ready to send", MUTED, 16)
        x += 280
    return img


def actions():
    img = Image.new("RGB", (1500, 960), BG)
    draw = ImageDraw.Draw(img)
    phone_shell(draw, 455, 30, 1045, 920)
    write(draw, (520, 105), "Action queue", TEXT, 38, True)
    rows = [
        ("P1", "Freeze finance deletion jobs", "Records Management · Today"),
        ("P1", "Update board note on pipeline compression", "Revenue Operations · Before 4:30 PM"),
        ("P2", "Attach model-risk note to mobile pack", "AI Governance · This sprint"),
    ]
    y = 200
    for priority, title, meta in rows:
        rounded(draw, (510, y, 990, y + 140), CARD, radius=24)
        rounded(draw, (530, y + 34, 596, y + 100), "#223b59", radius=18)
        write(draw, (548, y + 54), priority, TEXT, 18, True)
        write(draw, (620, y + 40), title, TEXT, 22, True)
        write(draw, (620, y + 82), meta, MUTED, 14)
        y += 164
    return img


def main():
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    for name, image in [
        ("01-hero.png", hero()),
        ("02-signals.png", signals()),
        ("03-briefing-packs.png", packs()),
        ("04-action-queue.png", actions()),
    ]:
        image.save(OUT_DIR / name)


if __name__ == "__main__":
    main()


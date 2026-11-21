#!/usr/bin/env python3
"""Convert manually verified transcript cue JSON to .srt (no ASR, no inferred timestamps).

Usage:
  python scripts/verified_cues_to_srt.py templates/caption_cues.example.json output.srt

JSON: [{"start": 0.0, "end": 2.4, "text": "Gawa kabeh!"}, ...]
Please verify source timing; using approximate script beat timestamps is not lip-sync.
"""
import json
import pathlib
import sys


def stamp(seconds):
    ms = round(float(seconds) * 1000)
    if ms < 0:
        raise ValueError('Negative timestamp')
    h, ms = divmod(ms, 3_600_000)
    m, ms = divmod(ms, 60_000)
    s, ms = divmod(ms, 1000)
    return f'{h:02d}:{m:02d}:{s:02d},{ms:03d}'


def main():
    if len(sys.argv) != 3:
        raise SystemExit('Usage: verified_cues_to_srt.py INPUT.json OUTPUT.srt')
    items = json.loads(pathlib.Path(sys.argv[1]).read_text(encoding='utf-8'))
    if not isinstance(items, list) or not items:
        raise ValueError('Expected nonempty JSON array of cues')
    lines = []
    previous = 0.0
    for n, item in enumerate(items, 1):
        start, end = float(item['start']), float(item['end'])
        phrase = str(item['text']).strip()
        if not phrase or end <= start or start < previous:
            raise ValueError(f'Invalid cue {n}: unsorted, empty, or non-positive duration')
        lines.append(f'{n}\n{stamp(start)} --> {stamp(end)}\n{phrase}\n')
        previous = end
    out = pathlib.Path(sys.argv[2])
    out.parent.mkdir(parents=True, exist_ok=True)
    out.write_text('\n'.join(lines), encoding='utf-8')
    print(f'Wrote {len(items)} verified cues to {out}')


if __name__ == '__main__':
    main()

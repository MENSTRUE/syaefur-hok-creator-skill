# SOUND DESIGN, MASCOT ANIMATION & ASSET RIGHTS

## Sound board — searching, not assuming files exist

| Event | Cue label | Keyword | Timing | Priority |
| --- | --- | --- | --- | --- |
| First 1s revelation | `NEWS_STINGER` | short news alert stinger royalty free | 0.0–0.7 s | medium |
| Pop-up mascot | `POP_BOUNCE` | cartoon pop clean sfx | same frame as scale peak | low |
| Sudden gameplay error | `FAIL_RECORD` | vinyl stop/record scratch licensed | 0.2 s before funny freeze | medium |
| Big plot twist | `IMPACT_SOFT` | short cinematic hit without distortion | screen punch | medium |
| Item or stat appears | `UI_TICK` | game UI click soft | every major item, not all text | low |
| Fast chapter change | `WHOOSH_SHORT` | subtle swish whoosh | in 4–8 frames | low |
| Explanation | `BGM_FOCUS` | light electronic ambient royalty free | low under VO | medium |
| Funny sequence | `BGM_COMEDY` | playful pluck percussion royalty free | limited comic segments | medium |
| Emotional result | `BGM_BUILD` | minimal tension build royalty free | up to punchline then duck | medium |
| Signature voice | `FAHHH_OWN` | record your own 'fahhhh' | result or mistake beat | signature |

Never force all cues into one piece. For a 30-second short, 2–5 intentional SFX moments plus ambient music are enough. Silence itself is a sound-design choice.

## Source/licence log

Fields: `filename | URL | creator | license type | usage allowed: YouTube/TikTok/commercial | attribution required? | proof file | date downloaded | duration | notes`.

Use music licensed for **all destinations**, not only licensed inside one social network's app. Example starting points: YouTube Audio Library and the license information of the original SFX library. A track available inside TikTok is not automatically licensed for a separately edited/uploaded YouTube file. Do not download and redistribute game/music assets that licensing does not permit.

**YouTube nuance (per YouTube Help verified Nov 2026):** Shorts can be up to 3 minutes; >1 minute with active copyright claim may be blocked globally. If uncertain, prefer own recordings or suitable royalty-free rights-cleared sound. Official help: https://support.google.com/youtube/answer/15424877

## Existing asset folders (from screenshot, contents NOT yet verified)

- `D:\content\00_Karakter_Utama`
- `D:\content\01_Rambut`
- `D:\content\02_Mata_Alis`
- `D:\content\03_Mulut_Ekspresi`
- `D:\content\04_Badan_Aksesoris`
- `D:\content\character asset`
- `D:\content\HOK_ASSETS`
- `D:\content\background play hok`
- `D:\content\sound`
- `D:\content\Youtube`

**Action:** execute `scripts/audit_assets.ps1`, upload `reports/asset_manifest.csv`; then map exact PNG/WAV/MP4 paths. Do not invent names like `mascot_shocked.png` if not present.

## Layer composition spec half-body

1. Base body layer and accessory layer (optional).
2. Hair layer behind or in front depending artwork, must be visually aligned.
3. Eye and brow layers, eyelid closed optional, ensure neutral at rest.
4. Mouth overlays: closed, speaking small, speaking big, O/exclamation, smile.
5. Character anchored bottom corner, scaling to keep gameplay readable. Caption should never overlap face.

Composite tests: canvas dimensions, alpha transparency, no white matte, layers registration (same anchor), no gaps around eyes/mouth. If avatar's files are separate cutouts with different canvases, **first normalize registration** before animating; Premiere transform keyframes assume registered layers.

## Motion recipes (30 fps example)

- `REACT_POP`: frame 0 scale 85%; f4 108%; f8 100%; SFX peak f4.
- `BLINK`: eyes open f0–f10; half f11; closed f12–f13; open f14; repeat only on long static segments.
- `MOUTH_TALK_SIMPLE`: closed in silence; open during emphasized syllables, swap every 3–6 frames; not fake perfect lip sync.
- `TEACH_POINTER`: frame 0 offscreen, f8 slide 100 px & ease; hold while line read; f10 fade.
- `SHOCK_FREEZE`: screen briefly freeze 0.3–0.8 sec; eyes wide, mouth O, impact SFX; resume normal.

## Copyright & integrity

Never claim use of HOK artwork/gameplay, soundtrack, third-party meme or character voices is automatically permitted. Inspect each platform's current policy, event terms, and license. For unofficial news, disclose source; for AI-generated content, comply with applicable platform disclosure requirements. Use self-recorded SFX for original brand elements (fahhhh, wiw, lah!).

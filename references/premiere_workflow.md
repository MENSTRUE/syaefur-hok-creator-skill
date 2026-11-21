# ADOBE PREMIERE PRO — SYAEFUR EDIT PLAYBOOK

## Urutan produksi long-first yang efisien

**0. Persiapan.** Simpan project di folder episode terpisah dari aset asli. Buat subfolder `01_raw`, `02_voice`, `03_assets_used`, `04_project`, `05_exports`, `06_subtitles`, `07_thumbnail`, `08_notes`. Link asset dari `D:\content` tanpa memindahkan original; salin hanya bila perlu portable project dan mematuhi lisensi.

**1. Set project & sequence.** `File > New > Project`; bin `RAW_GAMEPLAY`, `VOICE`, `CHARACTER`, `MUSIC`, `SFX`, `GRAPHICS`, `EXPORTS`. `File > New > Sequence`; untuk YouTube panjang target 1920×1080, 16:9; 30/60 fps mengikuti source dan tujuan. Pastikan scratch disk memadai.

**2. Import & sync.** `File > Import` atau drag media ke Project panel. Jika VO terpisah, sync dengan clap/marker/waveform. Simpan raw sebagai file utuh. Jika transcript support bahasa hasilnya kurang akurat untuk logat Tegal, proofreading manual.

**3. Rough cut voice-first.** Taruh VO pada A1, gameplay V1. Potong dead air/error. Tandai tiap beat dengan sequence markers: `HOOK`, `PROBLEM`, `EXAMPLE`, `SOLUTION`, `CTA`. Adobe menyediakan Text-Based Editing untuk memotong berdasar transcript pada workflow yang didukung; teks/maksud tetap harus dicek manual.

**4. Tambah gameplay dan B-roll.** Susun momen yang cocok dengan ucapan, bukan random battle loop. Guna freeze-frame/frame hold pada momen edukatif. Tambahkan callout/pointer hanya saat penting.

**5. Maskot setengah badan.** Taruh asset body/face pada layer terpisah jika file memang tersedia dan posisinya sesuai. Jika belum punya rig, pakai PNG full yang dipisahkan dengan 2–3 frame expression swap. Opsi animasi: Position keyframe 20 px, Scale 95→105→100 dalam 6–10 frames, Rotation 0→±3°; gunakan Ease In/Out/Bezier secukupnya. Untuk mouth sync sederhana: buka mulut pada aksen 2–4 frame, tutup saat jeda. Hindari framing yang menutup minimap.

**6. Grafik & captions.** `Window > Text` atau workspace caption sesuai versi Premiere. Transcribe sequence (bila tersedia) lalu koreksi logat; buat caption setelah final rough cut. Letakkan lower-third, title, dan callout; gunakan style master sehingga render konsisten. Pantau safe margins pada vertikal.

**7. Mixing audio.** VO prioritas tertinggi. A1 VO, A2 original game, A3 BGM, A4 SFX, A5 character/extra. Jadikan BGM umumnya ~18–25 dB lebih pelan daripada VO sebagai titik awal, sesuaikan pendengaran; suara target harus jelas di ponsel. BGM duck pada narasi. SFX diletakkan tepat pada visual/humor yang diperkuat. Jangan pakai sound berhak cipta tanpa izin.

**8. Color & graphics.** Gunakan Lumetri secara ringan; jangan mengganti warna hero/UI sampai informasi sulit dibaca. Prioritaskan saturasi dan ketajaman normal, jangan over-sharpen.

**9. Export master.** `File > Export > Media` (antarmuka bisa berbeda antar-versi), H.264/MP4, 1920×1080 (16:9), fps mengikuti sequence, AAC audio. Periksa preview 5 detik awal, 5 detik akhir, dan 3 momen random; no black frames, clipping, broken alpha, atau subtitles salah.

## Konversi ke Shorts/TikTok/Reels

1. Duplicate sequence master, beri nama `SYYMMDD_C01_VERTICAL`. Jangan mengubah master.
2. `Sequence > Auto Reframe Sequence` jika tersedia; target 9:16, lazimnya 1080×1920, atau buat sequence vertikal dan scale secara manual. Auto Reframe **bukan** pengganti pengecekan: minimap, UI skill, hero sasaran, dan caption perlu koreksi framing.
3. **Ganti hook.** Cutdown yang dimulai di tengah pembahasan harus punya konteks dan payoff sendiri. Tambahkan 1–2 detik hook VO/teks baru jika perlu.
4. Reposisi maskot: coba area bawah atau sudut yang tidak menutupi HUD; zoom gameplay hanya cukup untuk fokus. Jika 16:9 terlalu luas, gunakan layout split, crop adaptif, atau latar blur dari source, bukan paksa crop seluruh map.
5. Rebuild captions untuk ponsel; hindari lapisan UI yang menutupi area tombol app di bawah/kanan.
6. Export H.264/MP4 1080×1920 dan cek di layar HP. Target default 20–60 detik jika cocok; YouTube Shorts saat referensi dibuat mendukung maksimal 3 menit untuk video vertikal/persegi, tetapi video lebih singkat sering lebih ringan produksi. **Jangan memaksakan 3 menit.**

## Layer map rekomendasi

```
V6  Logo / final CTA / pointer highlights
V5  Mascot face (eye/brow/mouth)
V4  Mascot body / accessories
V3  Captions / title / callout
V2  B-roll / screenshots / zoomed source
V1  Main gameplay (locked when possible)
A5  Extra avatar vocalization
A4  SFX stings / whoosh / comedic impact
A3  BGM (ducks under speech)
A2  Game audio
A1  Voice-over SYAEFUR
```

Track bisa ditambah/dikurangi sesuai ketersediaan. Jangan membuat keyframe "lip sync" identik setiap suku kata bila tidak ada rig; cukup ekspresif pada kata kunci.

## Jenis transition yang direkomendasikan

- Hard cut: penjelasan gameplay & humor, paling sering.
- Short zoom/whip 4–8 frame: perubahan konteks/beat berita, jarang.
- Dip to Black singkat: berganti bab serius, jangan berulang.
- Match cut posisi minimap: contoh before vs after.
- J-cut/L-cut audio: transisi ke gameplay supaya tidak patah.
- Freeze + zoom + record scratch: kesalahan yang memang terbukti pada footage.

## Editing direction sheet contoh

| Timeline output | Visual | Voice | Mascot | SFX/BGM | Premiere steps |
| --- | --- | --- | --- | --- | --- |
| 00:00–00:04 | Replay momen gagal objektif (jika ada) | "Lah, kill unggul kok kalah?" | shocked pop | impact at 00:00.5 | cut on action, keyframe scale mascot |
| 00:04–00:12 | Freeze minimap & title | "Kiyé, masalahé..." | teaching | silence beat then low BGM | frame hold, circle, caption |
| 00:12–00:25 | Gameplay illustration | [VO full] | neutral | light whoosh on labels | L-cut, shape annotation |

Jika raw tak tersedia, kolom `source IN/OUT` berisi `SHOT NEEDED`, bukan angka yang diada-adakan.

## Rujukan resmi Adobe (fitur mungkin berbeda menurut versi)

- Text-Based Editing: https://helpx.adobe.com/premiere/desktop/edit-projects/edit-video-using-text-based-editing/overview-of-text-based-editing.html
- Auto Reframe: https://helpx.adobe.com/premiere/desktop/add-video-effects/commonly-used-effects/auto-reframe-overview.html
- Export settings: https://helpx.adobe.com/premiere/desktop/render-and-export/export-files/overview-of-export-settings.html

# SYAEFUR HOK Creator Studio (v1.0)

Paket instruksi / skill kreatif untuk konten HOK dengan voice khas Tegal **enyong**. Target konsisten **1 day 1 content** dengan sistem long-first dan repurposing, plus jalur NEWS singkat bila mendesak.

## Isi paket

- `SKILL.md`: pusat instruksi skill dan alur keputusan.
- `references/`: panduan mendalam soal identitas, riset HOK, gameplay, editing, suara, analytics dan 30 hari ide.
- `templates/`: lembar produksi dan checklist berulang.
- `examples/`: contoh naskah evergreen panjang + short, template berita yang tidak mengarang fakta.
- `scripts/`: PowerShell bantu audit library aset dan membuat folder episode baru; **tidak menghapus atau memindahkan sumber**.
- `COPY_PASTE_INSTRUCTIONS.md`: prompt utama yang tetap berfungsi walau platform tak mendukung folder skill.

## Cara pakai dengan ChatGPT

1. Simpan ZIP dan ekstrak. Untuk chat dengan konteks file, unggah `SKILL.md` atau ZIP ini dan katakan: **"Pakai SYAEFUR HOK Creator Studio. HOK GAS HARI INI."**
2. Jika fitur proyek/konfigurasi instruksi khusus tersedia, tempel `COPY_PASTE_INSTRUCTIONS.md` sebagai instruksi; sertakan referensi bila platform mendukung. **Tidak ada instalasi otomatis** hanya karena ZIP diunduh.
3. Saat sudah ada raw video, file audio, sheet analytics atau bukti event, kirim file itu dan minta `HOK RAW` / `HOK NEWS`.
4. Untuk sesi baru ketika skill belum terpasang, sertakan lagi SKILL.md / prompt atau minta agar identitas produksi dipakai sesuai preferensi yang telah diketahui.

## Contoh perintah

```text
HOK GAS HARI INI. Pilih ide paling layak, minim effort. Bikin naskah yang bisa langsung enyong rekam dan editing Premiere lengkap. Jangan ngarang berita.
```

```text
HOK LONG: 5 kebiasaan yang bikin kalah objektif walau unggul kill. 7 menit. Output full VO verbatim + Premiere cue sheet + 5 Shorts.
```

```text
HOK RAW: Ini gameplay dan VO enyong. Audit isi dan buatin daftar timestamp cut, musik/SFX, subtitle, mascot expressions, dan urutan editing Premiere.
```

## Windows — audit aset dari D:\content

Di PowerShell, jalankan dari folder ekstrak ZIP:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\audit_assets.ps1 -SourceRoot "D:\content"
```

Hasil: `asset_manifest.csv` di folder `reports` **di folder skill**. Script hanya membaca info file dan menulis manifest. Upload manifest ini ke ChatGPT supaya pemilihan file **berdasar bukti**, bukan dugaan dari screenshot.

Buat episode baru tanpa menyentuh aset:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\new_episode.ps1 -Title "Macro Objektif" -OutputRoot "D:\content\productions"
```

## Catatan jujur

Paket ini adalah panduan produksi dan skrip otomasi ringan; **bukan** plugin Premiere, bukan sistem auto-download musik, bukan akses otomatis ke drive pengguna, bukan sistem auto-upload ke HOK Studio. Operasi langsung pada video/proyek Premiere hanya mungkin ketika file dan tool yang relevan tersedia.

Aturan HOK Studio, patch, hero, kebijakan hak cipta platform dan software dapat berubah. Skill selalu menginstruksikan pengecekan sumber terbaru sebelum klaim tentang update, reward, atau submission.

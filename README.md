# DroidRescue

DroidRescue is a universal toolkit for repairing, flashing, and recovering Android smartphones powered by MediaTek (MTK) chipsets. It supports multiple popular brands including Xiaomi, Realme, Infinix, Vivo, Oppo, Tecno, and more.

## 🚀 Features

- Flash stock/custom ROMs (via SP Flash Tool, Fastboot)
- Unbrick soft-bricked devices
- Bypass MediaTek authentication (SLA/DA/Preloader)
- Dump or backup firmware partitions
- Compatible with many MTK-based devices
- Tools and scripts to automate flashing tasks

## 📦 Folder Structure
Berikut ini contoh isi README.md yang profesional dan cocok untuk repositori GitHub kamu: turah0393/droidrescue, berdasarkan nama repo dan konteks sebelumnya (alat flashing/bypass untuk MediaTek Android):


---

# DroidRescue

DroidRescue is a universal toolkit for repairing, flashing, and recovering Android smartphones powered by MediaTek (MTK) chipsets. It supports multiple popular brands including Xiaomi, Realme, Infinix, Vivo, Oppo, Tecno, and more.

## 🚀 Features

- Flash stock/custom ROMs (via SP Flash Tool, Fastboot)
- Unbrick soft-bricked devices
- Bypass MediaTek authentication (SLA/DA/Preloader)
- Dump or backup firmware partitions
- Compatible with many MTK-based devices
- Tools and scripts to automate flashing tasks

## 📦 Folder Structure

droidrescue/
├── firmwares/         # Kumpulan ROM bawaan (stok) atau kustom, dikelompokkan per brand
│   ├── xiaomi/
│   ├── realme/
│   └── infinix/
│
├── tools/             # Aplikasi dan utilitas penting
│   ├── sp_flash_tool/
│   ├── mtkclient/
│   └── platform-tools/
│
├── scripts/           # Skrip bash atau python untuk flashing, bypass, backup, dll.
│   ├── flash_sp_tool.sh
│   ├── dump_rom.py
│   └── bypass_auth.py
│
├── drivers/           # Driver USB dan preloader untuk Windows & Linux
│   ├── windows/
│   └── linux/
│
├── docs/              # Panduan penggunaan, troubleshooting, dokumentasi teknis
│   ├── flashing-guide.md
│   └── bypass-tricks.md
│
├── LICENSE            # File lisensi (misalnya MIT License)
├── README.md          # Deskripsi utama proyek
└── .gitignore         # File untuk mengabaikan file/folder saat push ke Git

## ⚙️ Quick Start (Linux/Termux)

```bash
git clone https://github.com/turah0393/droidrescue.git
cd droidrescue

# Run flash script (example)
bash scripts/flash_sp_tool.sh

# Or run bypass script (example)
python3 scripts/bypass_auth.py

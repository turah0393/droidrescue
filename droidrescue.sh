#!/bin/bash

clear
echo "==========================================="
echo "        DroidRescue - MTK Toolkit"
echo "   Repair • Flash • Backup • Bypass Auth"
echo "==========================================="

while true; do
  echo ""
  echo "Pilih fitur:"
  echo "1) Flash via SP Flash Tool"
  echo "2) Backup/Dump ROM"
  echo "3) Bypass Auth (SLA/DA/Preloader)"
  echo "4) Deteksi Perangkat (ADB/Fastboot)"
  echo "5) Install Dependencies"
  echo "0) Keluar"
  echo ""
  read -p "Masukkan pilihan [0-5]: " pilihan

  case $pilihan in
    1)
      echo "[*] Menjalankan SP Flash Tool..."
      chmod +x ./tools/sp_flash_tool/flash_tool
      ./tools/sp_flash_tool/flash_tool
      ;;
    2)
      echo "[*] Membackup ROM..."
    mkdir -p backups
    echo "[*] Membackup system.img..."
    adb pull /dev/block/bootdevice/by-name/system backups/system.img
    echo "[*] Membackup boot.img..."
    adb pull /dev/block/bootdevice/by-name/boot backups/boot.img
    echo "[*] Membackup recovery.img..."
    adb pull /dev/block/bootdevice/by-name/recovery backups/recovery.img
    echo "[✓] Backup selesai. File tersimpan di folder 'backups'."
    ;;
   3)
    echo "[*] Bypass SLA/DA..."
    python3 ./tools/bypass_tool/bypass.py
    ;;
      ;;
    4)
      echo "[*] Mendeteksi perangkat..."
      adb devices
      fastboot devices
      ;;
    5)
      echo "[*] Menginstal dependencies..."
      pkg update && pkg install python git unzip wget -y
      pip install pyusb pyserial colorama
      ;;
    6)
  echo "[*] Mengecek koneksi ADB..."
  adb get-state
  if [ $? -ne 0 ]; then
    echo "[!] Perangkat tidak terdeteksi. Pastikan sudah terhubung dan USB debugging aktif."
  else
    echo "[✓] Perangkat terdeteksi."
  fi
  ;;

7)
  echo "[*] Mengecek file SP Flash Tool..."
  if [ ! -f ./tools/sp_flash_tool/flash_tool ]; then
    echo "[!] File SP Flash Tool tidak ditemukan!"
  else
    echo "[✓] File SP Flash Tool ditemukan."
  fi
  ;;
    0)
      echo "Keluar."
      exit 0
      ;;
    *)
      echo "[!] Pilihan tidak valid."
      ;;
  esac
done

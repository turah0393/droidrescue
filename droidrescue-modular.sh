#!/bin/bash

# === Fungsi Modular ===

setup_storage() {
    if [ ! -d /sdcard ]; then
        echo "[*] Setting up Termux storage access..."
        termux-setup-storage
        echo "[*] Please allow storage permission and rerun the script."
        exit 1
    else
        echo "[✓] Termux storage already set up."
    fi
}

flash_spft() {
    echo "[*] Running SP Flash Tool..."
    chmod +x ./tools/sp_flash_tool/flash_tool
    ./tools/sp_flash_tool/flash_tool
}

backup_rom() {
    echo "[*] Backing up ROM..."
    mkdir -p backups
    adb pull /dev/block/bootdevice/by-name/system backups/system.img
    adb pull /dev/block/bootdevice/by-name/boot backups/boot.img
    adb pull /dev/block/bootdevice/by-name/recovery backups/recovery.img
    echo "[✓] Backup complete. Files saved to ./backups/"
}

bypass_auth() {
    echo "[*] Bypassing SLA/DA..."
    python3 ./tools/bypass_tool/bypass.py
}

detect_devices() {
    echo "[*] Detecting devices..."
    adb devices
    fastboot devices
}

install_dependencies() {
    echo "[*] Installing dependencies..."
    pkg update && pkg install python git -y
    pip install pyusb pyserial colorama
}

check_adb_connection() {
    echo "[*] Checking ADB connection..."
    adb get-state
    if [ $? -ne 0 ]; then
        echo "[!] Device not detected."
    else
        echo "[✓] Device detected."
    fi
}

check_spflashtool() {
    echo "[*] Checking SP Flash Tool file..."
    if [ ! -f ./tools/sp_flash_tool/flash_tool ]; then
        echo "[!] SP Flash Tool not found."
    else
        echo "[✓] SP Flash Tool found."
    fi
}

flash_from_storage() {
    echo "[*] Flashing image from internal storage..."
    read -p "Enter full path to image file (e.g. /sdcard/Download/boot.img): " img_path
    if [ ! -f "$img_path" ]; then
        echo "[!] File not found: $img_path"
        return
    fi
    echo "[*] Flashing $img_path to boot..."
    fastboot flash boot "$img_path"
    echo "[✓] Flash complete."
}

# === Menu Utama ===

while true; do
    echo ""
    echo "=== DroidRescue Toolkit ==="
    echo "1) Flash via SP Flash Tool"
    echo "2) Backup/Dump ROM"
    echo "3) Bypass Auth (SLA/DA/Preloader)"
    echo "4) Detect Devices (ADB/Fastboot)"
    echo "5) Install Dependencies"
    echo "6) Check ADB Connection"
    echo "7) Check SP Flash Tool File"
    echo "8) Setup Termux Storage"
    echo "9) Flash from Internal Storage"
    echo "0) Exit"
    echo ""

    read -p "Choose an option [0-9]: " pilihan

    case $pilihan in
        1) flash_spft ;;
        2) backup_rom ;;
        3) bypass_auth ;;
        4) detect_devices ;;
        5) install_dependencies ;;
        6) check_adb_connection ;;
        7) check_spflashtool ;;
        8) setup_storage ;;
        9) flash_from_storage ;;
        0) echo "Exiting..."; exit 0 ;;
        *) echo "[!] Invalid option." ;;
    esac
done

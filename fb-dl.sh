#!/bin/bash
clear
echo "========================================="
echo "    FACEBOOK DOWNLOADER BYPASS (WEB)     "
echo "========================================="
echo -n "Masukkan URL Video Facebook: "
read url

# Validasi jika input kosong
if [ -z "$url" ]; then
    echo "Error: URL tidak boleh kosong!"
    exit 1
fi

echo ""
echo "Memproses link video..."
sleep 1

# KITA GUNAKAN SAVEFROM.NET SEBAGAI PERANTARA
# Savefrom mendukung penambahan "sfrom.net/" di depan URL untuk otomatis input
LINK_PERANTARA="https://sfrom.net/$url"

echo "Membuka browser dan mengalihkan ke downloader..."
echo "Silakan klik tombol 'Download' di halaman web yang terbuka."
echo "========================================="
sleep 2

# Membuka browser HP langsung ke halaman download yang sudah terisi URL-nya
termux-open "$LINK_PERANTARA"

echo "Selesai! Terima kasih telah menggunakan tool ini."
echo "========================================="

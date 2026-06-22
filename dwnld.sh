#!/bin/bash
clear
echo "========================================="
echo "    FB BYPASS DIRECT LINK GENERATOR      "
echo "========================================="
echo -n "Masukkan URL Video Facebook: "
read url

if [ -z "$url" ]; then
    echo "Error: URL tidak boleh kosong!"
    exit 1
fi

echo ""
echo "Sedang memproses link..."
echo "========================================="

# Trik Pemotong Jalur: Mengubah domain FB biasa/share/watch menjadi mbasic
# Script ini akan otomatis mendeteksi dan mengganti domainnya
if [[ "$url" == *"facebook.com"* ]]; then
    LINK_BYPASS=$(echo "$url" | sed 's/www.facebook.com/mbasic.facebook.com/g' | sed 's/web.facebook.com/mbasic.facebook.com/g')
elif [[ "$url" == *"fb.watch"* || "$url" == *"facebook.com/share"* ]]; then
    # Jika link hasil share pendek, kita arahkan ke mbasic portal
    LINK_BYPASS=$(echo "$url" | sed 's/facebook.com/mbasic.facebook.com/g')
else
    LINK_BYPASS="https://mbasic.facebook.com"
fi

echo ""
echo "👉 KLIK/TAHAN LINK DI BAWAH INI:"
echo -e "\e[1;32m$LINK_BYPASS\e[0m"
echo ""
echo "========================================="
echo "Cara Download di Browser:"
echo "1. Setelah link terbuka, KLIK video tersebut."
echo "2. Video akan berputar di tab baru."
echo "3. Klik TANDAL TIGA TITIK di pojok kanan bawah"
echo "   lalu pilih 'Download' / 'Unduh'!"
echo "=======@p1staworld================="

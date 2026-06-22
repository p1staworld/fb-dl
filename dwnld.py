import requests
import os
import re

print("=========================================")
print("    FACEBOOK DIRECT DOWNLOADER (V2)      ")
print("=========================================")

url_input = input("Masukkan URL Video Facebook: ").strip()

if not url_input:
    print("Error: URL tidak boleh kosong!")
    exit()

print("\nSedang mengekstrak link unduhan langsung...")

# Kita gunakan API alternatif publik yang lebih stabil
api_url = f"https://api.anbace.com/facebook?url={url_input}"

try:
    # Melakukan request ke API dengan batasan waktu (timeout) 15 detik
    response = requests.get(api_url, timeout=15)
    result = response.json()
    
    # Memeriksa struktur data dari respons API
    if result.get("status") == "success" or "result" in result:
        # Mengambil link video kualitas HD jika ada, jika tidak pakai yang SD
        video_data = result.get("result", {})
        direct_link = video_data.get("hd") or video_data.get("sd")
        
        if direct_link:
            print("Link langsung ditemukan!")
            print("Sedang mengunduh file video langsung ke HP...")
            
            # Tentukan folder penyimpanan di HP (Folder Download)
            output_folder = "/sdcard/Download"
            
            # Membuat nama file unik berdasarkan angka di URL
            digits = re.sub(r'[^0-9]', '', url_input)
            filename = "FB_Video_" + (digits[-5:] if digits else "download") + ".mp4"
            output_path = os.path.join(output_folder, filename)
            
            # Proses download file fisik .mp4 ke memori HP
            video_bytes = requests.get(direct_link).content
            with open(output_path, 'wb') as handler:
                handler.write(video_bytes)
                
            print("=========================================")
            print(f"🎉 BERHASIL! Video disimpan di:\n{output_path}")
            print("=========================================")
        else:
            print("Gagal memisahkan link video. Coba link Facebook lainnya.")
            
    else:
        print("API gagal memproses link tersebut. Pastikan video berstatus PUBLIK.")

except requests.exceptions.ConnectionError:
    print("Terjadi kesalahan jaringan: Pastikan internet HP kamu aktif!")
except Exception as e:
    print(f"Terjadi kesalahan sistem: {e}")

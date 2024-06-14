#!/bin/bash

# Tentukan lokasi dan nama file swap
swapfile="/swapfile"

# Tentukan ukuran swap yang diinginkan (dalam megabyte)
swapsize=4096  # Ubah sesuai kebutuhan Anda

# Fungsi untuk membuat swapfile atau menghapus dan membuat yang baru jika atribut C tidak dapat diterapkan
create_or_recreate_swapfile() {
    sudo touch $swapfile
    sudo chmod 600 $swapfile

    # Cek atribut file swap
    attr_output=$(sudo lsattr $swapfile)
    if [[ $attr_output == "---------------------- /swapfile" ]]; then
        echo "Atribut copy-on-write tidak dapat diterapkan pada file swap."
        echo "Menghapus file swap..."
        sudo rm $swapfile
        echo "Membuat file swap baru..."
        create_or_recreate_swapfile
    fi
}

# Panggil fungsi untuk membuat atau memperbarui swapfile
create_or_recreate_swapfile

# Lanjutkan dengan langkah-langkah pembuatan swapfile sesuai ukuran yang ditentukan
sudo dd if=/dev/zero of=$swapfile bs=1M count=$swapsize status=progress
sudo mkswap $swapfile

# Aktifkan file swap
sudo swapon $swapfile

# Tambahkan file swap ke /etc/fstab agar aktif setiap kali sistem boot
echo "$swapfile none swap default 0 0" | sudo tee -a /etc/fstab

# Verifikasi bahwa swapfile sudah aktif
swapon --show

# Tampilkan informasi swap
free -h

echo "Swapfile $swapsize MB telah berhasil dibuat dan diaktifkan."

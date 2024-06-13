#!/bin/bash
source="/home/dev/"

files=(".bashrc" ".ssh" ".gitconfig" ".mozilla")
for file in "${files[@]}"; do
  unlink ~/"$file"
  rm -rf ~/"$file"
  ln -s "$source$file" ~/.
done




# Mengecek apakah direktori ~/.config ada
config_dir="$source/.config"
if [ -d "$config_dir" ]; then
  # Membaca isi direktori menggunakan loop
  for entry in "$config_dir"/*; do
    if [ -d "$entry" ]; then
      dir_name=$(basename "$entry")
      echo "Direktori: $dir_name"  # Menampilkan nama direktori
      unlink ~/.config/$dir_name
      rm -rf ~/.config/$dir_name
      ln -s "$config_dir"/"$dir_name" ~/.config/
    elif [ -f "$entry" ]; then
      file_name=$(basename "$entry")
      echo "File: $file_name"  # Menampilkan nama file
    fi
  done
else
  echo "Direktori ~/.config tidak ditemukan."
fi


# Mengecek apakah direktori ~/.local/share ada
copy_dir="$source/.local/share"
paste_dir="$HOME/.local/share"
if [ -d "$copy_dir" ]; then
  # Membaca isi direktori menggunakan loop
  for entry in "$copy_dir"/*; do
    if [ -d "$entry" ]; then
      dir_name=$(basename "$entry")
      echo "Direktori: $dir_name"  # Menampilkan nama direktori
      unlink $paste_dir/$dir_name
      rm -rf $paste_dir/$dir_name
      ln -s "$copy_dir"/"$dir_name" $paste_dir
    elif [ -f "$entry" ]; then
      file_name=$(basename "$entry")
      echo "File: $file_name"  # Menampilkan nama file
    fi
  done
else
  echo "Direktori ~/.config tidak ditemukan."
fi

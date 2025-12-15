#!/bin/bash

BASE_URL="https://raw.githubusercontent.com/LingOffc/main/main"

SCRIPTS=(
  "Finix1.sh"
  "Finix2.sh"
  "Finix3.sh"
  "Finix4.sh"
  "Finix5.sh"
  "Finix6.sh"
  "Finix7.sh"
  "Finix8.sh"
  "Finix9.sh"
  "Finix10.sh"
  "Finix11.sh"
  "Finix12.sh"
  "Finix13.sh"
  "Finix14.sh"
  "Finix15.sh"
)

clear
echo "=============================="
echo "        FINIX INSTALLER       "
echo "=============================="

i=1
for s in "${SCRIPTS[@]}"; do
  echo "$i) $s"
  ((i++))
done

echo "0) Keluar"
echo
read -p "Pilih menu: " pilih

[[ "$pilih" == "0" ]] && exit 0

if ! [[ "$pilih" =~ ^[0-9]+$ ]]; then
  echo "Input harus angka"
  exit 1
fi

index=$((pilih - 1))
script="${SCRIPTS[$index]}"

if [[ -z "$script" ]]; then
  echo "Menu tidak valid"
  exit 1
fi

echo "Menjalankan $script ..."
curl -fsSL "$BASE_URL/$script" -o "/tmp/$script" || {
  echo "Gagal download script"
  exit 1
}

chmod +x "/tmp/$script"
bash "/tmp/$script"

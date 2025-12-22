#!/bin/bash

# ================== COLOR ==================
BLUE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# ================== CONFIG ==================
BASE_URL="https://raw.githubusercontent.com/LingOffc/anomali/main"
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

# ================== BANNER ==================
banner() {
clear
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]                                                 [+]${NC}"
echo -e "${BLUE}[+]               FINIX AUTO INSTALLER              [+]${NC}"
echo -e "${BLUE}[+]               © LingOffc Official               [+]${NC}"
echo -e "${BLUE}[+]                                                 [+]${NC}"
echo -e "${RED}[+] =============================================== [+]${NC}"
echo
}

# ================== MENU ==================
show_menu() {
banner
echo -e "${YELLOW}PILIH MENU INSTALL :${NC}"
echo

i=1
for s in "${SCRIPTS[@]}"; do
  printf "${GREEN}%2d.${NC} %s\n" "$i" "$s"
  ((i++))
done

echo
echo -e "${RED} 0.${NC} Keluar"
echo
read -p "Masukkan pilihan: " pilih
}

# ================== MAIN ==================
while true; do
  show_menu

  [[ "$pilih" == "0" ]] && echo -e "${YELLOW}Keluar...${NC}" && exit 0

  if ! [[ "$pilih" =~ ^[0-9]+$ ]]; then
    echo -e "${RED}Input harus angka!${NC}"
    sleep 2
    continue
  fi

  index=$((pilih - 1))
  script="${SCRIPTS[$index]}"

  if [[ -z "$script" ]]; then
    echo -e "${RED}Menu tidak valid!${NC}"
    sleep 2
    continue
  fi

  echo
  echo -e "${BLUE}[+] Menjalankan ${GREEN}$script${NC}"
  echo -e "${BLUE}[+] Mengunduh script...${NC}"

  curl -fsSL "$BASE_URL/$script" -o "/tmp/$script" || {
    echo -e "${RED}[!] Gagal download script${NC}"
    sleep 2
    continue
  }

  chmod +x "/tmp/$script"
  clear
  bash "/tmp/$script"
  read -p "Tekan ENTER untuk kembali ke menu..."
done

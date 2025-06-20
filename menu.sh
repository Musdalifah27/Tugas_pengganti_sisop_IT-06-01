#!/bin/bash

# Warna untuk output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Fungsi untuk membersihkan layar
clear_screen() {
    clear
}

# Fungsi untuk menampilkan ASCII art header
ascii_welcome() {
    if command -v figlet &> /dev/null; then
        echo -e "${GREEN}"
        figlet -c "Bismillah yaa"
        echo -e "${NC}"
    else
        echo -e "${GREEN}*** Matursuwun nggeh${NC}"
    fi
}

show_header() {
    ascii_welcome
}

show_main_menu() {
   ...
}

# Fungsi untuk menampilkan menu utama
show_main_menu() {
    echo -e "${WHITE}MENU SISTEM UBUNTU${NC}"
    echo ""
    echo -e "${YELLOW}1.${NC} Tampilkan Kehidupan Saat Ini"
    echo -e "${YELLOW}2.${NC} Tampilkan Daftar Direktori"
    echo -e "${YELLOW}3.${NC} Informasi Jaringan"
    echo -e "${YELLOW}4.${NC} Tampilkan Detail OS"
    echo -e "${YELLOW}5.${NC} Tampilkan Waktu Install Pertama OS"
    echo -e "${YELLOW}6.${NC} Informasi User"
    echo -e "${YELLOW}7.${NC} Keluar"
    echo ""
}

# Fungsi untuk menampilkan informasi kehidupan sistem
show_system_life() {
    clear_screen
    show_header
    echo -e "${GREEN}Informasi Penggunaan Saat Ini:${NC}"
    echo -e "${CYAN}Username${NC}      : $(whoami)"
    echo -e "${CYAN}User ID${NC}       : $(id -u)"
    echo -e "${CYAN}Group ID${NC}      : $(id -g)"
    echo -e "${CYAN}Nama Lengkap${NC}  : $(getent passwd $(whoami) | cut -d':' -f5 | cut -d',' -f1)"
    echo -e "${CYAN}Shell${NC}         : $SHELL"
    echo -e "${CYAN}Home Directory${NC}: $HOME"
    echo ""
    echo -e "${GREEN}Uptime Sistem:${NC}"
    uptime
    echo ""
    echo -e "${GREEN}Proses yang Sedang Berjalan:${NC}"
    ps aux | head -10
}

# Fungsi untuk menampilkan daftar direktori
show_directory_list() {
    clear_screen
    show_header
    echo -e "${GREEN}Isi Direktori:${NC}"
    echo -e "${CYAN}total $(du -sh . | cut -f1)${NC}"
    ls -la --color=always
}

# Fungsi untuk menampilkan informasi jaringan
show_network_info() {
    clear_screen
    show_header
    echo -e "${GREEN}Informasi Jaringan:${NC}"
    
    # Alamat IP Lokal
    LOCAL_IP=$(hostname -I | awk '{print $1}')
    echo -e "${CYAN}Alamat IP Lokal${NC}: $LOCAL_IP"
    
    # Gateway
    GATEWAY=$(ip route | grep default | awk '{print $3}' | head -1)
    echo -e "${CYAN}Gateway${NC}: $GATEWAY"
    
    # Netmask
    NETMASK=$(ip route | grep $LOCAL_IP | awk '{print $1}' | head -1)
    echo -e "${CYAN}Netmask${NC}: $NETMASK"
    
    # DNS Server
    DNS_SERVER=$(systemd-resolve --status | grep "DNS Servers" | awk '{print $3}' | head -1)
    echo -e "${CYAN}DNS Server(s)${NC}: $DNS_SERVER"
    
    echo ""
    echo -e "${GREEN}Status Koneksi ke Internet:${NC}"
    if ping -c 1 8.8.8.8 &> /dev/null; then
        echo -e "${GREEN}Tersambung ke internet.${NC}"
    else
        echo -e "${RED}Tidak tersambung ke internet.${NC}"
    fi
    
    echo ""
    echo -e "${GREEN}Status Koneksi LAN/WIFI:${NC}"
    echo -e "${CYAN}DEVICE   TYPE        STATE       CONNECTION${NC}"
    nmcli device | grep -E "(ethernet|wifi)" | while read line; do
        echo -e "${GREEN}$line${NC}"
    done
    
    echo ""
echo -e "${GREEN}Mendeteksi IP Eksternal dan Lokasi...${NC}"

# Mendapatkan IP Eksternal
EXTERNAL_IP=$(curl -s --max-time 5 ifconfig.me)

if [[ -n "$EXTERNAL_IP" ]]; then
    echo -e "${GREEN}IP Eksternal Anda: $EXTERNAL_IP${NC}"

    # Mendapatkan lokasi berdasarkan IP
    LOCATION=$(curl -s --max-time 5 "http://ip-api.com/line/$EXTERNAL_IP?fields=city,regionName,country")

    if [[ -n "$LOCATION" && "$LOCATION" != "fail" ]]; then
        echo -e "${GREEN}Lokasi Berdasarkan IP:${NC}"
        echo -e "${GREEN}$LOCATION${NC}"
    else
        echo -e "${YELLOW}Gagal mengambil informasi lokasi.${NC}"
    fi
else
    echo -e "${YELLOW}Tidak dapat mendeteksi IP eksternal.${NC}"
fi
}
# Fungsi untuk menampilkan detail sistem operasi
show_os_details() {
    clear_screen
    show_header
    echo -e "${GREEN}Detail Sistem Operasi:${NC}"
    
    # Informasi OS
    if [ -f /etc/os-release ]; then
        source /etc/os-release
        echo -e "${CYAN}Nama OS${NC}       : $NAME"
        echo -e "${CYAN}Versi${NC}         : $VERSION"
        echo -e "${CYAN}ID${NC}            : $ID"
        echo -e "${CYAN}Keterangan${NC}    : $PRETTY_NAME"
    fi
    
    echo ""
    echo -e "${GREEN}Informasi Kernel:${NC}"
    echo -e "${CYAN}$(uname -r)${NC}"
    
    echo -e "${GREEN}Proses CPU Terakhir:${NC}"
    echo -e "${CYAN}%Cpu(s):${NC} $(top -bn1 | grep "Cpu(s)" | awk '{print $2 $3 $4 $5 $6 $7 $8}')"
    
    echo -e "${GREEN}Penggunaan Memori:${NC}"
    echo -e "${CYAN}              total        used        free      shared  buff/cache   available${NC}"
    free -h | grep -E "(Mem|Swap):" | while read line; do
        echo -e "${GREEN}$line${NC}"
    done
    
    echo ""
    echo -e "${GREEN}Penggunaan Disk:${NC}"
    echo -e "${CYAN}Filesystem      Size  Used Avail Use% Mounted on${NC}"
    df -h | grep -E "^/dev/" | while read line; do
        echo -e "${GREEN}$line${NC}"
    done
}

# Fungsi untuk menampilkan waktu install OS
show_install_time() {
    clear_screen
    show_header
    echo -e "${GREEN}Waktu Perkiraan OS Pertama Kali Diinstall:${NC}"

    if [ -f /var/log/installer/cloud-init.log ]; then
        INSTALL_DATE=$(sudo stat -c '%y' /var/log/installer/cloud-init.log | cut -d'.' -f1)
        echo -e "${GREEN}$INSTALL_DATE${NC}  (berdasarkan cloud-init.log)"

    elif [ -f /var/log/installer/syslog ]; then
        INSTALL_DATE=$(sudo head -1 /var/log/installer/syslog | awk '{print $1, $2, $3}')
        echo -e "${GREEN}$INSTALL_DATE${NC}  (berdasarkan installer syslog)"

    else
        echo -e "${YELLOW}Informasi waktu install tidak tersedia.${NC}"
    fi

    echo ""
    echo -e "${YELLOW}Tekan Enter untuk kembali ke menu...${NC}"
    read
}


# Fungsi untuk menampilkan informasi user
show_user_info() {
    clear_screen
    show_header
    echo -e "${GREEN}Informasi User:${NC}"
    echo -e "${CYAN}Username${NC}      : $(whoami)"
    echo -e "${CYAN}User ID${NC}       : $(id -u)"
    echo -e "${CYAN}Group ID${NC}      : $(id -g)"
    echo -e "${CYAN}Nama Lengkap${NC}  : $(getent passwd $(whoami) | cut -d':' -f5 | cut -d',' -f1)"
    echo -e "${CYAN}Shell${NC}         : $SHELL"
    echo -e "${CYAN}Home Directory${NC}: $HOME"
    
    echo ""
    echo -e "${GREEN}Groups:${NC}"
    groups $(whoami)
    
    echo ""
    echo -e "${GREEN}Login History (5 terakhir):${NC}"
    last -n 5 $(whoami)
    
    echo ""
    echo -e "${GREEN}Direktori Saat Ini:${NC}"
    pwd
    
    echo ""
    echo -e "${GREEN}Variabel Environment Penting:${NC}"
    echo -e "${CYAN}PATH${NC}: $PATH"
    echo -e "${CYAN}LANG${NC}: $LANG"
    echo -e "${CYAN}TERM${NC}: $TERM"
}

# Fungsi untuk menunggu input user
wait_for_input() {
    echo ""
    echo -e "${YELLOW}Tekan Enter untuk kembali ke menu...${NC}"
    read
}

# Fungsi utama
main() {
    while true; do
        clear_screen
        show_header
        show_main_menu
        
        echo -n "Pilih opsi [1-7]: "
        read choice
        
        case $choice in
            1)
                show_system_life
                wait_for_input
                ;;
            2)
                show_directory_list
                wait_for_input
                ;;
            3)
                show_network_info
                wait_for_input
                ;;
            4)
                show_os_details
                wait_for_input
                ;;
            5)
                show_install_time
                wait_for_input
                ;;
            6)
                show_user_info
                wait_for_input
                ;;
            7)
                echo -e "${GREEN}Terima kasih telah menggunakan sistem informasi Ubuntu!${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Pilihan tidak valid. Silakan pilih 1-7.${NC}"
                sleep 2
                ;;
        esac
    done
}

# Jalankan program
main

#!/bin/bash
# Mod By SL

# Ganti konfigurasi SSH agar root bisa login pakai key saja
wget -qO - -O /etc/ssh/sshd_config https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/sshd_config
systemctl restart sshd
clear

# Minta user isi password (opsional, kamu bisa disable bagian ini kalau gak mau password sama sekali)
echo -e "Masukkan Password:"
read -e pwe

# Set password root secara manual (optional — bisa dihapus kalau kamu pakai key-only login)
usermod -p "$(perl -e "print crypt('$pwe','Q4')")" root

clear

# Tampilkan informasi login
cat <<EOF

Mohon Simpan Informasi Akun VPS Ini
============================================
Akun Root (Akun Utama)
Ip address = $(curl -Ls http://ipinfo.io/ip)
Username   = root
Password   = $pwe
============================================

EOF

exit

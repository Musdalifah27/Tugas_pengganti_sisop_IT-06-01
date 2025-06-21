# Tugas Pengganti Sistem Operasi

## 👤 Data Diri

- **Nama**: Musdalifah Asma Arafah Ohorella  
- **NIM**: 1202230027  
- **Kelas**: IT 06-01  

---
## 📘 Pendahuluan

Halo! 👋

Tugas ini saya kerjakan sebagai pengganti praktikum Sistem Operasi. Di dalamnya, saya membuat sebuah script shell sederhana berbasis terminal Linux (Ubuntu) yang berisi beberapa menu interaktif.

Script ini menampilkan berbagai informasi penting seputar sistem, pengguna, jaringan, dan detail lainnya yang biasa dibutuhkan untuk monitoring atau sekadar tahu kondisi OS kita. Total ada 7 menu yang saya buat, dan semua dikerjakan menggunakan bash script langsung di VM Ubuntu.

Saya juga sudah dokumentasikan hasil dari setiap menu dalam bentuk tangkapan layar, supaya lebih mudah dipahami dan bisa dicek langsung output-nya.

Yuk, langsung cek satu per satu menu-nya di bawah ini! 👇

---

![Tampilan awal](https://github.com/user-attachments/assets/9a738bd3-1a9a-4b0e-9b00-cd1df8dfead5)


📌 Menu 1 – Informasi Pengguna Saat Ini

Pada menu ini ditampilkan informasi dasar tentang user yang sedang login, seperti:

Username: user

UID dan GID

Shell yang digunakan (/bin/bash)

Home directory (/home/user)
Selain itu, juga ditampilkan proses-proses yang sedang berjalan di sistem saat itu. Ini berguna untuk melihat aktivitas sistem secara real time.

![1](https://github.com/user-attachments/assets/b375b2a3-5ba1-42a4-bb58-48bf76eaee85)

📌 Menu 2 – Isi Direktori Home

Menu ini digunakan untuk menampilkan seluruh isi dari direktori home user menggunakan perintah ls -alh. Hasilnya, terlihat file-file seperti .bashrc, .config, folder Documents, Downloads, serta file script dan dokumen yang saya buat seperti aritmatika.sh dan berkasnegara.txt.

![2](https://github.com/user-attachments/assets/4cd948cf-2ae1-4b9a-9699-8366d2b7f50d)

📌 Menu 3 – Informasi Jaringan

Menu ini menampilkan:

Alamat IP lokal (192.168.207.130)

Gateway dan netmask

Status koneksi LAN (dalam kasus ini menggunakan ens33 yang terhubung ke koneksi kabel)

IP eksternal dan lokasi berdasarkan IP (terdeteksi berada di Gresik, Jawa Timur, Indonesia)

Dengan informasi ini, kita bisa mengetahui apakah perangkat terhubung ke internet dan di mana lokasinya berdasarkan IP publik.

![3](https://github.com/user-attachments/assets/0f24ac82-d63d-45a5-af57-3d9d1c1a79c3)

📌 Menu 4 – Detail Sistem Operasi

Menu ini menampilkan informasi sistem operasi:

Nama OS: Ubuntu 16.04.7 LTS (Xenial Xerus)

Kernel: 4.15.0-142-generic

Pemakaian CPU dan memori

Informasi disk: sistem menggunakan 49 GB, dengan sisa sekitar 41 GB

Menu ini sangat berguna untuk mengecek resource dan kondisi sistem OS secara umum.

![4](https://github.com/user-attachments/assets/a08bbcd6-9889-443e-99c8-39238ef504ca)

📌 Menu 5 – Estimasi Waktu Instalasi OS

Pada menu ini ditampilkan waktu estimasi kapan OS pertama kali diinstall. Berdasarkan syslog dari installer, OS ini pertama kali diinstall pada:
Jun 1, jam 09:47:33

Informasi ini bisa membantu jika kita ingin melacak usia sistem operasi atau melakukan troubleshooting berdasarkan waktu pemasangan.

![5](https://github.com/user-attachments/assets/4fd360b3-de6f-4abe-b474-88b5468ef651)

📌 Menu 6 – Informasi Grup dan Riwayat Login

Menu ini menampilkan grup apa saja yang dimiliki oleh user (seperti adm, sudo, lpadmin, dll), serta riwayat login terakhir. Terlihat bahwa login terakhir dilakukan beberapa kali dari tty7, namun sebagian besar berakhir dengan status “crash” atau “gone - no logout”.
Ini bisa terjadi kalau VM atau sistem dimatikan secara paksa, bukan melalui logout normal.

![6](https://github.com/user-attachments/assets/e193679c-f61a-42a1-85f1-8b3542052f0f)

📌 Menu 7 – Keluar dari Program
Menu ini tidak menampilkan output, tapi fungsinya adalah untuk keluar dari program menu yang sedang berjalan. Biasanya menggunakan perintah exit atau break dalam bash script untuk menghentikan looping menu.

![7](https://github.com/user-attachments/assets/6089ead2-a199-47d2-a115-73a5f8d030e9)



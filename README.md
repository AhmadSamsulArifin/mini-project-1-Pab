# Aplikasi Antrian Pelayanan di Kecamatan


## Deskripsi Aplikasi

Aplikasi ini dibuat menggunakan Flutter untuk membantu pengelolaan antrian pelayanan di kantor kecamatan. Petugas dapat menambahkan, melihat, mengubah, dan menghapus data warga yang akan dilayani. Alasan saya membuat dengan tema ini adalah pengalaman saya pada saat saya pkl itu antrian tidak teratur dan ribet maka dari itu saya mencoba untuk membuat aplikasi untuk menunjang kenyaman petugas dan warga.  

Data yang di gunakan dalam aplikasi layanan yaitu minimal 3 TextField, dan saya menggunakan 4 TextField  :
- Nama
- NIK
- Jenis Pelayanan
- Nomor HP

Untuk nomor antrian dibuat otomatis dengan format 001, 002, 003, dan seterusnya, jadi semisal data antrian nomor 001 di hapus maka akan lanjut ke 002 dan tidak mengulang.


## Fitur Aplikasi


 ### Fitur Utama
 
 1. Create (Fitur ini digunakan untuk menambahkan data antrian yang ada di pelaayanan kecamatan)
 3. Read (Fitur ini juga digunakan untuk melihat atau menampilkan data antrian yang sudah kita masukkan dan bentuknya itu dalam bentuk list )
 4. Delete (Terakhir fitur ini digunakan untuk menghapus data antrian yang sudah di layani tapi sebelum menghapus akan ada notifikasi apakah setuju atau tidak jika setuju maka data akan terhapus)


### Nilai Tambah
1. Update (Fitur ini digunakan untuk mengubah data warga apaliba terdapat kesalahan input maka dari itu petugas bisa mengubah data warga untuk di perbaiki)
2. Multi Page Navigation(pada aplikasi ini terdapat tiga halaman
   - Halaman Beranda (untuk melihat daftar antrian)
   - Halaman Form (untuk menambah atau mengedit data warga)
   - Halaman Detail (untuk melihat detail data warga))
3. Pencarian data (saya juga menambahkan fitur pencarian data pada halaman beranda agar memudahkan petugas mencari data warga apabila antrian nya sangat banyak walaupun ini bukan nilai tambah)

## Struktur Folder 

Folder yang saya gunakan terletak di lib dan saya akan menyusunnya :

- lib
  - Models
      - data_antrian.dart
  - Pages
      - halaman_beranda.dart
      - halaman_detail_antrian.dart
      - halaman_form_antrian.dart
  - Main.dart


 ## Widget yang Digunakan
 
  ### Struktur Dasar
  - MaterialApp
  - Scaffold
  - AppBar
  - StatelessWidget
  - StatefulWidget

  ### Layout dan Tampilan
  - Column
  - Row
  - Container
  - Card
  - ListTile
  - ListView.builder

  ### Form dan Input
  - TextField
  - TextFormField
  - DropdownButtonFormField

  ### Tombol dan Aksi
  - ElevatedButton
  - IconButton
  - FloatingActionButton

  ### Navigasi
  - Navigator

  ### Notifikasi dan Konfirmasi
  - SnackBar
  - AlertDialog


## Tampilan

### Tampilan Halaman Beranda jika belum ada datanya 

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/d918e7e3-274e-42f7-a6b8-0c234ab78bb0" />

### Tampilan Halaman Form Antrian pada saat menambahkan data antrian

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/5a5400a8-1936-44bc-9f4c-c0ba34854429" />

### Tampilan Halaman beranda jika data berhasil di tambahkan 

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/47d5b3e4-2805-4eb7-aeff-a3c4f8407a57" />

### Tampilan Halaman Detail Antrian jika kita sedang melihat detail antriannya

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/3f5e1eff-d734-4bec-992e-0e93e2c46e87" />


### Tampilan Halaman Form Antrian pada saat mengedit data antrian

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/e89098b4-287e-4e4e-be58-df1ae12c4a4d" />

### Tampilan Halaman Beranda jika data berhasil di ubah

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/f8db4331-d627-4803-97a6-d09742a51d21" />

### Tampilan Halaman Beranda jika kita sedang mencari di fitur pencarian 

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/e0c26fc4-37d3-4c89-8dda-db93f715bb85" />

### Tampilan Halaman Beranda jika data akan dihapus

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/7874d06f-148c-4b1d-88bf-b1bfd66d0b18" />

### Tampilan Halaman Beranda jika data berhasil dihapus

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/0fe63003-ccf3-4e19-94b9-3955af5258e0" />














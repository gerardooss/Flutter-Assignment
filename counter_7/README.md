# counter_7
**Assignment 7** - *Platform Based Programming*  
&rarr; basic elements on Flutter

## Perbedaan Stateless Widget dan Stateful Widget
- Secara sederhana, `Stateless Widget` adalah widget yang sudah diinisiasi sejak awal dan bersifat statis. Tampilan antarmuka sebuah aplikasi dengan stateless widget tidak dipengaruhi oleh user action atu dengan kata lain mungkin terdapat pembaruan tampilan.
- Berbeda dengan Stateless Widget, `Stateful Widget` merupakan widget yang bersifat dinamis. Tampilan antarmuka dengan widget ini dapat berubah oleh adanya user actions.

## Widget yang dipakai di proyek kali ini dan fungsinya
- Scaffold  
  Mengatur tampilan dasar aplikasi yang dibuat
- Row  
  Mengurutkan widget child secara horizontal
- Collumn  
  Mengurutkan widget child secara vertikal
- Center  
  Mengatur sebuah widget ke posisi tengah halaman
- Text
  Menampilkan teks
- Buttons
  Menyediakan berbagai jenis tombol yang dapat digunakan dalam aplikasi

## Fungsi dari setState()
Fungsi `setState()` adalah mengirimkan sinyal ke widget bahwa terdapat variabel yang berubah untuk kemudian diproses kembali. Dalam konteks tugas ini, variabel yang dimaksud adalah `_counter`

## Perbedaan antara const dengan final
Perbedaan utama terletak pada proses inisiasinya. `const` mengharuskan sebuah variabel diinisialisasi saat proses kompilasi sehingga tidak boleh merupakan variabel kosong. Hal ini berbeda dengan `final` yang tidak mengharuskan variabel memiliki nilai dalam proses kompilasi.

## Implementasi checklist
- Membuat fungsi `_decrementCounter()` yang berguna untuk mengurangi value variabel `_count`
- Membuat button dengan widget `FloatingActionButton` yang memanggil fungsi `_decrementCounter()`
- Membuat variable `indicator` sebagai penentu apakah `_count` bernilai ganjil atau genap
- Membuat conditionals pada widget `Text` untuk mengatur teks GANJIL-GENAP dan warna teks tersebut
- Bonus: 
  - mengubah widget `FloatingActionButton` untuk decrement button sebagai child dari widget `Visibility`
  - mengatur widget `Visibility` agar muncul ketika `_counter != 0`

<br />

# Tugas 8
**Assignment 8** - *Platform Based Programming*  
&rarr; Flutter Form

## Perbedaan `Navigator.push` dan `Navigator.pushReplacement`.
- `Navigator.push` berfungsi untuk page baru dengan cara membuat route baru, tetapi tidak menghapus route sebelumnya melainkan disimpan di stack.
- `Navigator.pushReplacement` memiliki fungsi yang sama, namun akan membuang route yang dibuang sebelumnya setelah membuat route baru.

## Widget yang dipakai di proyek kali ini dan fungsinya.
- Drawer  
Merupakan widget untuk menampilkan hamburger menu.
- ListTile  
Berguna untuk menampilkan sebuah widget yang dapat memiliki beberapa widget di dalamnya.
- Form  
Berguna untuk menampilkan field yang digunakan menerima input user.
- TextFormField  
Field yang menerima data input berupa teks dari user.
- DropdownButtonField  
Field berupa dropdown yang menyediakan opsi tersedia.
- Card  
Berfungsi untuk menampilkan data dalam bentuk card.

## Jenis-jenis event yang ada pada Flutter
- onPressesd
- onChanged
- onSaved
- opTap

## Cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator berfungsi untuk menyimpan stack berisi route yang digunakan dalam aplikasi. Route ini merupakan sebuah widget halaman baru. `Navigator.push` berfungsi untuk mengarahkan ke halaman baru, sedangakan `Navigator.pop` digunakan untuk kembali ke halaman sebelumnya.


## Implementasi checklist
- Menambahkan `Drawer` yang berisikan tiga opsi halaman yang dapat dipilih: Counter, Add Budget, dan View Budget.
- Menambahkan halaman untuk Add Budget:
  - Menambahkan drawer
  - Membuat file baru `add_budget.dart`
  - Menambahkan widget sesuai deskripsi soal - `Form` yang berisi `TextFormField` dan `DropdownButtonFormField`
  - Menghubungan halaman ini dengan drawer setiap page
- Membuat Object:
  - Membuat file `object01.dart` yang dikhususkan sebagai file pembuatan objek yang digunakan dalam tugas ini
  - Menginisiasi objek dengan atribut yang diperlukan (judul, nominal, tipe)
  - Membuat constructor
  - Membuat list yang akan digunakan untuk menampung object
- Menambahkan halaman View Budget:
  - Menambahkan drawer
  - Membuat widget `Container` berisikan `ListView.builder` yang kemudian me-return widget `Card`

<br />

# Tugas 9
**Assignment 9** - *Platform Based Programming*  
&rarr; Web Service Integration

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik?
Ya, pengambilan data JSON isa dilakukan tanpa membuat model terlebih dahulu namun hal ini tidak lebih baik daripada pengambilan data yang dilakaukand engan pembuatan model terlebih dahulu. Alasannya adalah, pengambilan data tanpa pembuatan model tidak dapat mengetahui struktur data yang diambil.

## Widget yang dipakai di proyek kali ini dan jelaskan fungsinya.
- `InkWell`  
  Widget area yang memberikan respons ketika diklik.
- `ListView`  
  Widget yang dapat memiliki beberapa widget di dalamnya.
- `FutureBuilder`  
  Updating child dengan hasil future

## Mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
- Melakukan HTTP request ke server dengan menggunakan library `http`.
- Server Django memberikan response berupa views yang sesuai.
- Melakukan decoding terhadap bytes yang diterima menggunakan `jsonDecode` kemudian digunakan untuk menginisialisasi model `WatchList`

## Implementasikan checklist di atas.
- Menambahkan page baru untuk menampilkan watchlist dan menambahkan ke drawer.
- Menambahkan page baru untuk menampilkan detail movie.
- Membuat models `WatchList`
- Membuat code untuk melakukan fetching data dari server **bugs detected here*
- Melakukan refactoring file
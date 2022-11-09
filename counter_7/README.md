# counter_7
Assignment 7 - Platform Based Programming

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

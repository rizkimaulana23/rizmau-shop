# rizmau_shop

# Tugas 7

## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter adalah sebagai berikut:

- Stateless widget adalah widget yang tidak dapat berubah atau diperbarui setelah dibuat. Widget ini hanya menampilkan data atau informasi yang sifatnya statis atau tetap. Contoh stateless widget adalah Text, Icon, dan Image.
Stateful widget adalah widget yang dapat berubah atau diperbarui sesuai dengan kondisi atau aksi yang terjadi. Widget ini dapat menampilkan data atau informasi yang sifatnya dinamis atau berubah-ubah. Contoh stateful widget adalah Checkbox, Radio, Slider, dan TextField.

- Stateless dan stateful widget memiliki perbedaan dalam cara membuat dan menggunakannya. Stateless widget hanya membutuhkan satu kelas yang meng-extend StatelessWidget dan mengimplementasikan metode build. Stateful widget membutuhkan dua kelas, yaitu satu kelas yang meng-extend StatefulWidget dan satu kelas lagi yang meng-extend State. Kelas pertama bertugas untuk membuat objek state, sedangkan kelas kedua bertugas untuk membangun tampilan widget dan mengelola state.
  
## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
1. MaterialApp: Ini adalah widget utama yang digunakan untuk menginisialisasi aplikasi Flutter. Ini mengatur konfigurasi aplikasi seperti tema, judul, dan halaman awal.
2. Scaffold: Scaffold adalah struktur kerangka dasar untuk aplikasi yang mengatur berbagai elemen seperti AppBar, body, dan lainnya.

3. AppBar: Ini adalah widget yang digunakan untuk menampilkan bilah atas di aplikasi. Ini memiliki judul dan warna latar belakang yang ditentukan.

4. SingleChildScrollView: Widget ini digunakan untuk membuat tampilan yang dapat di-scroll. Ini berguna ketika kontennya melebihi ruang yang tersedia.

5. Padding: Padding adalah widget yang digunakan untuk menambahkan jarak antara elemen-elemen anaknya.

6. Column: Ini adalah widget yang digunakan untuk menampilkan sekelompok anak secara vertikal, satu di atas yang lain.

7. Text: Widget ini digunakan untuk menampilkan teks di layar dengan berbagai properti seperti gaya, ukuran, dan warna.

8. GridView.count: Ini adalah widget yang digunakan untuk menampilkan daftar elemen dalam tata letak grid. Dalam kasus ini, itu digunakan untuk menampilkan kartu-kartu belanja.

9. ShopCard: Ini adalah widget khusus yang dibuat untuk menampilkan setiap item belanja dalam bentuk kartu. Ini berisi ikon dan teks dan juga merespons sentuhan pengguna.

10. Material: Ini adalah widget yang mengatur tampilan kartu belanja dan memberikan efek latar belakang berwarna.

11. InkWell: InkWell adalah widget yang digunakan untuk membuat area responsif terhadap sentuhan pengguna. Ini digunakan di dalam Material untuk menangani tindakan ketika kartu belanja diklik.

12. SnackBar: Widget ini digunakan untuk menampilkan pesan sementara di bagian bawah layar setelah tindakan tertentu, seperti mengklik kartu belanja.

13. Icons: Ini adalah kumpulan ikon bawaan yang disediakan oleh Flutter.

14. ColorScheme: Widget ini digunakan untuk menentukan skema warna yang akan digunakan dalam aplikasi.

15. UseMaterial3: Widget ini digunakan untuk mengaktifkan atau menonaktifkan fitur Material You di Flutter.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
1. Pada `main.dart`, meng-import package yang dibutuhkan.
    ~~~
    import 'package:flutter/material.dart';
    import 'package:rizmau_shop/menu.dart';
    ~~~
2. Membuat class `MyApp` yang akan meng-extend `StatelessWidget`
    ~~~
    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
            useMaterial3: true,
        ),
        home: MyHomePage(),
        );
    }
    }
    ~~~

3. Pada `menu.dart`, mengimport package yang dibutuhkan
    ~~~
    import 'package:flutter/material.dart';
    ~~~

4. Membuat class `MyHomePage` yang nantinya akan menampilkan widget-widget pada halaman utama
    ~~~
    class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.blue),
        ShopItem("Tambah Tambah Item", Icons.add_shopping_cart, Colors.green),
        ShopItem("Logout", Icons.logout, Colors.red),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text(
            'Shopping List',
            style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.indigo,
        ),
        body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
            padding: const EdgeInsets.all(10.0), // Set padding dari halaman
            child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                    'PBP Shop', // Text yang menandakan toko
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                    ),
                    ),
                ),
                // Grid layout
                GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ShopItem item) {
                    // Iterasi untuk setiap item
                    return ShopCard(item);
                    }).toList(),
                ),
                ],
            ),
            ),
        ),
        );
    }
    }
    ~~~

5. Membuat class `ShopItem` yang nantinya akan menerima atribut `nama`, `icon`, dan `color`
    ~~~
    class ShopItem {
    final String name;
    final IconData icon;
    final Color color;

    ShopItem(this.name, this.icon, this.color);
    }
    ~~~

6. Membuat class `ShopCard` yang nantinya akan menggunakan data yang dimiliki dari `ShopItem` dan mendefinisikan atribut penampilannya.
    ~~~
    class ShopCard extends StatelessWidget {
    final ShopItem item;

    const ShopCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
        return Material(
        color: item.color,
        child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                    ),
                ],
                ),
            ),
            ),
        ),
        );
    }
    }
    ~~~

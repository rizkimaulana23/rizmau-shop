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

# Tugas 8

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
- Navigator.push()
    Navigator.push() digunakan untuk menavigasi ke halaman baru tanpa menghilangkan halaman saat ini dari tumpukan navigasi (stack). Hal ini berarti, ketika melakukan navigasi menuju halaman baru menggunakan Navigator.push(), halaman saat ini tetap ada dalam stack. Pengguna dapat kembali ke halaman sebelumnya dengan mekanisme "back" (seperti tombol back di Android atau gesture swipe di iOS).  
    Contoh Penggunaan: Misalnya, ketika memiliki aplikasi buku di mana pengguna dapat melihat daftar buku. Ketika mereka menekan sebuah buku, dapat ditampilkan detail buku tersebut di halaman baru.  
    ~~~
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BookDetailPage(book)),
    );
    ~~~
    Dalam skenario ini, pengguna dapat kembali dari BookDetailPage ke halaman daftar buku sebelumnya.
- Navigator.pushReplacement()
    Navigator.pushReplacement() digunakan untuk menavigasi ke halaman baru dengan menggantikan halaman saat ini dalam stack. Ini berarti halaman saat ini dihapus dari stack dan penggantiannya tidak memungkinkan pengguna untuk kembali ke halaman itu.  
    Contoh Penggunaan: Anda memiliki aplikasi dengan proses login. Setelah pengguna berhasil masuk, Anda membawa mereka ke halaman beranda dan tidak ingin mereka dapat kembali ke halaman login dengan menekan tombol back.
    ~~~
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
    );
    ~~~
    Dalam kasus ini, ketika pengguna mencapai HomePage, mereka tidak akan bisa kembali ke halaman login karena telah digantikan di stack.

## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
- Column & Row: Column mengatur elemen secara vertikal, sedangkan Row mengatur elemen secara horizontal.
- Container: Wadah untuk mengatur tata letak dan memberi styling pada elemen, misalnya padding, margin, alignment, etc.
- Stack: Digunakan untuk menumpuk widget/elemen satu di atas yang lain.
- GridView: Menampilkan elemen dalam grid yang teratur dengan bentuk tabel.
- ListView: Menampilkan elemen yang dapat di-scroll secara vertikal.
- Expanded & Flexible: Mengontrol bagian dari ruang yang tersedia yang digunakan. Expanded mengisi ruang tersedia, sedangkan Flexible memberikan lebih banyak kontrol atas faktor fleksibilitas.
- Padding: Memberikan padding di sekeliling elemen child.
- Transform: digunakan untuk mengubah ukuran dan posisi elemen child
- Align: Mengatur posisi elemen child sesuai dengan alignment yang ditentukan.
- Wrap: Membuat row atau column dan secara otomatis beralih ke row atau column berikutnya setelah ruang di row atau column saat ini habis.
- Scaffold: Memberikan struktur dasar material design seperti AppBar, Drawer, dan FloatingActionButton.
- ConstrainedBox, SizedBox, & AspectRatio: Mengontrol ukuran atau aspek rasio dari elemen childnya.

## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
- TextFormField untuk Nama Produk serta validator untuk memastikan bahwa bidang ini tidak kosong, yang penting untuk memastikan bahwa setiap produk memiliki nama untuk identifikasi.
    ~~~
    child: TextFormField(
        decoration: InputDecoration(
            hintText: "Nama Produk",
            labelText: "Nama Produk",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
            ),
        ),
        onChanged: (String? value) {
            setState(() {
                _name = value!;
            });
        },
        validator: (String? value) {
            if (value == null || value.isEmpty) {
                return "Nama tidak boleh kosong!";
            }
            return null;
        },
    ),
    ~~~
- TextFormField untuk Harga beserta validator yang memeriksa tidak hanya kekosongan tetapi juga validitas angka, yang penting untuk data harga karena harus berupa angka.
    ~~~
    child: TextFormField(
        decoration: InputDecoration(
            hintText: "Harga",
            labelText: "Harga",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
            ),
        ),
        onChanged: (String? value) {
            setState(() {
                _price = int.parse(value!);
            });
        },
        validator: (String? value) {
            if (value == null || value.isEmpty) {
                return "Harga tidak boleh kosong!";
            }
            if (int.tryParse(value) == null) {
                return "Harga harus berupa angka!";
            }
            return null;
        },
    ),
    ~~~
- TextFormField untuk Deskripsi serta validator untuk memastikan bahwa deskripsi tidak dibiarkan kosong.
    ~~~
    child: TextFormField(
        decoration: InputDecoration(
            hintText: "Deskripsi",
            labelText: "Deskripsi",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
            ),
        ),
        onChanged: (String? value) {
            setState(() {
                _description = value!;
            });
        },
        validator: (String? value) {
            if (value == null || value.isEmpty) {
                return "Deskripsi tidak boleh kosong!";
            }
            return null;
        },
    ),
    ~~~
Alasan menggunakan TextForm Field :
- Kesesuaian dengan Jenis Data: Setiap TextFormField disesuaikan dengan jenis data yang diharapkan (teks singkat untuk nama, angka untuk harga, dan teks panjang untuk deskripsi).
- Validasi: Penggunaan validator sangat penting untuk memastikan integritas data. Misalnya, menghindari produk tanpa nama atau dengan harga yang bukan angka.
- Pengalaman Pengguna: Menggunakan elemen input ini memberikan pengalaman pengguna yang intuitif dan mudah, karena mereka sudah familiar dengan cara kerja input teks.

## Bagaimana penerapan clean architecture pada aplikasi Flutter?
Penerapan clean architecture pada aplikasi Flutter melibatkan organisasi kode menjadi beberapa lapisan yang terpisah, masing-masing dengan tanggung jawab spesifik:
1. Presentation Layer: Mengelola UI dan interaksi pengguna, biasanya melalui widget dan logic UI Flutter.
2. Business Logic Layer (Domain Layer): Berisi logic bisnis aplikasi termasuk entities dan use cases. Independen dari framework dan UI.
3. Data Layer: Bertanggung jawab atas pengelolaan data, termasuk repositori, model data, dan sumber data (API, database lokal).
4. Dependency Injection: Menggunakan teknik seperti provider atau get_it untuk mengurangi ketergantungan langsung antar komponen.
Tujuan utama clean architecture adalah untuk memisahkan concerns, meningkatkan modularitas, dan memudahkan pengujian. Implementasi ini membantu dalam mengelola dependensi, membuat kode lebih mudah dikelola dan diuji.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
Membuat folder baru pada lib yaitu screens dan widgets untuk mempermudah melakukan metode clean architeture, kemudian membuat file shoplist_form.dart sebagai halaman form untuk menerima input. Pada form tersebut juga terdapat tipe input berupa TextFormField bagi Nama, Harga, dan Deskripsi serta validasi yang dibutuhkan.

~~~
import 'package:flutter/material.dart';
import '../../widgets/left_drawer.dart';
import 'package:mailboxd/models/product.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

List<Product> productList = [];

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      // Add product to the global list
      productList.add(Product(
        name: _name,
        price: _price,
        description: _description,
      ));

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Produk berhasil tersimpan'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama: $_name'),
                  Text('Harga: $_price'),
                  Text('Deskripsi: $_description'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );

      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Nama Produk",
                  labelText: "Nama Produk",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _name = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Harga",
                  labelText: "Harga",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _price = int.parse(value!);
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Harga tidak boleh kosong!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Harga harus berupa angka!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Deskripsi",
                  labelText: "Deskripsi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    // TODO: Tambahkan variabel yang sesuai
                    _description = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Deskripsi tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  ),
                  onPressed: _saveProduct,
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
~~~

Membuat drawer lalu menghubungkan opsi tambah item yang berada pada drawer dan halaman utama ke shoplist_form.dart
~~~
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:mailboxd/screens/menu.dart';
import '../screens/shoplist_form.dart';
import '../screens/see_film.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Mailboxd',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "The place to keep track on the movies you have watched!",
                  textAlign: TextAlign.center, // Align text to center
                  style: TextStyle(
                    fontSize: 15, // Set font size to 15
                    color: Colors.white, // Set text color to white
                    fontWeight: FontWeight.normal, // Set font weight to normal
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Film'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopFormPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Lihat Produk'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductListPage(products: productList)),
              );
            },
          ),
        ],
      ),
    );
  }
}
~~~

Menghubungkan "Tambah Item" button pada halaman utama menuju ShopFormPage
~~~
if (item.name == "Tambah Item") {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopFormPage(),
      ));
}
~~~

IMPLEMENTASI BONUS

Membuat model Item dalam Item.dart yang berada pada folder models
~~~
class Item {
  final String name;
  final int price;
  final String description;

  Item({required this.name, required this.price, required this.description});
}
~~~

Membuat file see_film.dart untuk menampilkan semua item yang telah ditambahkan melalui form
~~~
import 'package:flutter/material.dart';
import 'package:mailboxd/models/item.dart';

class ProductListPage extends StatelessWidget {
  final List<Item> products;

  ProductListPage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Item'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(products[index].name),
              subtitle: Text(
                  'Harga: ${products[index].price}\nDeskripsi: ${products[index].description}'),
            ),
          );
        },
      ),
    );
  }
}
~~~

Membuat tombol pada drawer untuk mengarahkan ke see_film.dart
~~~
ListTile(
  leading: const Icon(Icons.movie),
  title: const Text('Lihat Item'),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ProductListPage(products: productList)),
    );
  },
),
~~~

Mengarahkan ke see_film.dart jika menekan tombol "Lihat Produk" pada halaman utama
~~~
if (item.name == "Lihat Item") {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => ProductListPage(items: itemList)),
  );
}
~~~

# Tugas 9
## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Ya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Dalam Flutter, data JSON dapat diambil dan dikelola langsung sebagai `Map<String, dynamic>` atau `List<Map<String, dynamic>> `tergantung struktur JSON yang diterima. Namun, pendekatan ini kurang ideal dibandingkan dengan menggunakan model karena beberapa alasan:

- `Ketidakefisienan`: Mengelola data langsung dari JSON membutuhkan penanganan secara manual untuk setiap field data, yang bisa menjadi rumit dan rawan error.
- `Ketidakrapihan Kod`e: Code menjadi kurang rapi dan susah dibaca karena harus melakukan banyak mapping manual.
- `Ketidakamanan Tipe Data:` Tanpa model, tidak ada keamanan tipe data yang terjamin. Kesalahan tipe data bisa terjadi, mengingat data JSON hanya diketahui strukturnya pada saat runtime.
- `Skalabilitas dan Pemeliharaan: `Dengan model, memperbarui atau mengubah struktur data menjadi lebih mudah dan terpusat.


Berikut adalah perbandingan antara melakukan pengambilan data JSON tanpa dan dengan membuat model terlebih dahulu:

| Aspek              | Tanpa Model                   | Dengan Model                   |
|--------------------|-------------------------------|--------------------------------|
| Ketidakefisienan   | Tinggi, memerlukan penanganan manual untuk setiap field | Rendah, model mengelola struktur data |
| Ketidakrapihan Kode| Kode kurang rapi dan susah dibaca karena banyak mapping manual | Kode lebih rapi dan mudah dibaca |
| Ketidakamanan Tipe Data | Tinggi, karena tidak ada keamanan tipe data terjamin | Rendah, model menyediakan keamanan tipe data |
| Skalabilitas dan Pemeliharaan | Rendah, sulit memperbarui atau mengubah struktur data | Tinggi, mudah memperbarui atau mengubah struktur data |

## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` adalah kelas yang memanage HTTP requests sambil mempertahankan cookies, yang sangat penting untuk autentikasi dan sesi yang persisten dalam aplikasi. Fungsinya meliputi:

Fungsi dan kebutuhan instance `CookieRequest` dalam aplikasi Flutter:

| Aspek           | Keterangan |
|-----------------|------------|
| Mengelola Cookies | Mengelola cookies untuk setiap HTTP request dan response |
| Persistensi Sesi | Memungkinkan sesi pengguna tetap aktif selama aplikasi terbuka |
| Konsistensi Sesi | Memastikan semua request mempertahankan sesi yang sama |
| Efisiensi | Menghindari pembuatan instance `CookieRequest` yang berlebihan |

## Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
Proses pengambilan data dari JSON dan menampilkannya pada aplikasi Flutter melibatkan beberapa langkah kunci:

1. **Fetch Data**:
   - Menggunakan HTTP request (biasanya `GET`) untuk mengambil data JSON dari web service.

2. **Deserialisasi JSON**:
   - Mengubah data JSON yang diterima menjadi objek Dart. Ini bisa dilakukan dengan menggunakan model yang sudah dibuat atau secara langsung menjadi `Map` atau `List`, tergantung pada struktur JSON.

3. **Penggunaan Data**:
   - Menggunakan data yang telah dikonversi untuk mengisi state atau variabel di dalam aplikasi Flutter. Ini bisa berupa data yang ditampilkan langsung atau yang digunakan untuk logika lebih lanjut dalam aplikasi.

4. **Menampilkan Data**:
   - Menampilkan data yang telah dikonversi ke dalam aplikasi dengan menggunakan berbagai widget Flutter. Sebagai contoh, `ListView.builder` dapat digunakan untuk menampilkan daftar data, sementara `Text` atau `Card` widget dapat digunakan untuk menampilkan detail data.

`Catatan Penting`

- Penting untuk melakukan penanganan error selama proses fetch data untuk menangani kasus seperti koneksi jaringan yang buruk atau data yang tidak valid.
- Gunakan `FutureBuilder` atau `StreamBuilder` untuk membangun widget yang bergantung pada data asynchronous, seperti data yang di-fetch dari web service.

## Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Proses autentikasi antara aplikasi Flutter dan backend Django melibatkan beberapa langkah kunci untuk memastikan keamanan dan kesinambungan data.


1. **Input Data**:
   - Pengguna memasukkan data akun (seperti username dan password) di aplikasi Flutter.

2. **Kirim ke Django**:
   - Flutter mengirimkan data akun tersebut ke backend Django menggunakan HTTP request (biasanya `POST`).

3. **Proses di Django**:
   - Backend Django menerima data tersebut dan melakukan proses autentikasi. Ini melibatkan pengecekan ke database untuk mencocokkan data pengguna.

4. **Respons ke Flutter**:
   - Setelah memproses data, Django mengirimkan respons ke aplikasi Flutter. Respons ini bisa berupa konfirmasi keberhasilan atau gagalnya proses autentikasi.

5. **Tampilan di Flutter**:
   - Berdasarkan respons dari Django, Flutter kemudian menampilkan hasil autentikasi. Jika berhasil, aplikasi mungkin akan membuka halaman menu utama atau dashboard. Jika gagal, aplikasi mungkin akan menampilkan pesan error atau meminta pengguna untuk mencoba lagi.


##  Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

1. **Scaffold**: Widget ini menyediakan struktur dasar untuk aplikasi Material Design. Ini termasuk AppBar, body, drawer, floating action button, bottom navigation bar, dan lain-lain. Scaffold digunakan untuk menyusun layout utama halaman.

2. **AppBar**: Sebuah bar di bagian atas layar yang biasanya menampilkan judul aplikasi dan aksi. AppBar biasanya digunakan di dalam Scaffold dan menyediakan tempat untuk memasang tombol, judul, atau informasi status.

3. **Text**: Widget ini digunakan untuk menampilkan teks pada layar. Anda dapat menyesuaikan gaya teks, seperti font, ukuran, warna, dan lain-lain melalui property `style`.

4. **ListTile**: Widget yang digunakan untuk membuat item dalam list yang biasanya berisi beberapa baris teks serta ikon opsional di awal atau akhir. ListTile sering digunakan dalam ListView atau Drawer.

5. **Card**: Widget yang mengimplementasikan kartu Material Design. Card biasanya digunakan untuk menyajikan beberapa informasi terkait dalam bentuk yang terorganisir dan juga dapat memiliki elevation (bayangan).

6. **Navigator**: Digunakan untuk mengelola stack rute/routing dalam aplikasi. Navigator memungkinkan navigasi antar halaman dengan mem-push dan mem-pop rute dari stack.

7. **TextStyle**: Bukan widget, melainkan sebuah kelas yang mendefinisikan gaya teks. Digunakan untuk menentukan ukuran font, warna, jenis font, dan lain-lain yang diterapkan pada widget Text.

8. **SizedBox**: Widget yang memiliki ukuran tetap. Biasanya digunakan untuk memberikan jarak antar widget, atau untuk memberi ukuran tertentu pada widget anaknya.

9. **Padding**: Widget yang digunakan untuk memberikan padding (jarak dalam) pada widget anaknya. Padding dapat digunakan untuk memberikan jarak antara batas widget dengan konten di dalamnya.

10. **EdgeInsets**: Bukan widget, tetapi sebuah kelas yang digunakan untuk mendefinisikan padding. Digunakan dengan widget Padding atau properti lain yang memerlukan definisi jarak, seperti margin.

11. **Column**: Widget yang mengatur anak-anaknya secara vertikal. Column dapat memiliki beberapa widget anak dan mengaturnya dalam sumbu vertikal.

##  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

### Implementasi Flutter
  - Menambahkan screen untuk memproses login
  ~~~
  class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          title: 'Login',
          theme: ThemeData(
              primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      );
      }
  }

  class LoginPage extends StatefulWidget {
      const LoginPage({super.key});

      @override
      _LoginPageState createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage> {
      final TextEditingController _usernameController = TextEditingController();
      final TextEditingController _passwordController = TextEditingController();

      @override
      Widget build(BuildContext context) {
          final request = context.watch<CookieRequest>();
          return Scaffold(
              appBar: AppBar(
                  title: const Text('Login'),
              ),
              body: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          TextField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                  labelText: 'Username',
                              ),
                          ),
                          const SizedBox(height: 12.0),
                          TextField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                  labelText: 'Password',
                              ),
                              obscureText: true,
                          ),
                          const SizedBox(height: 24.0),
                          ElevatedButton(
                              onPressed: () async {
                                  String username = _usernameController.text;
                                  String password = _passwordController.text;

                                  // Cek kredensial
                                  final response = await request.login("https://rizki-maulana23-tugas.pbp.cs.ui.ac.id/auth/login/", {
                                  'username': username,
                                  'password': password,
                                  });
                      
                                  if (request.loggedIn) {
                                      String message = response['message'];
                                      String uname = response['username'];
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => MyHomePage()),
                                      );
                                      ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                              SnackBar(content: Text("$message Selamat datang, $uname.")));
                                      } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                              title: const Text('Login Gagal'),
                                              content:
                                                  Text(response['message']),
                                              actions: [
                                                  TextButton(
                                                      child: const Text('OK'),
                                                      onPressed: () {
                                                          Navigator.pop(context);
                                                      },
                                                  ),
                                              ],
                                          ),
                                      );
                                  }
                              },
                              child: const Text('Login'),
                          ),
                      ],
                  ),
              ),
          );
      }
  }
  ~~~
  - Membuat laman untuk menampilkan barang-barang yang ada pada website project sebelumnya
  ~~~
  class ProductPage extends StatefulWidget {
      const ProductPage({Key? key}) : super(key: key);

      @override
      _ProductPageState createState() => _ProductPageState();
  }

  class _ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProduct() async {
      var url = Uri.parse(
          'https://rizki-maulana23-tugas.pbp.cs.ui.ac.id/json/');
      var response = await http.get(
          url,
          headers: {"Content-Type": "application/json"},
      );

      // melakukan decode response menjadi bentuk json
      var data = jsonDecode(utf8.decode(response.bodyBytes));

      // melakukan konversi data json menjadi object Product
      List<Product> list_product = [];
      for (var d in data) {
          if (d != null) {
              list_product.add(Product.fromJson(d));
          }
      }
      return list_product;
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
          title: const Text('Product'),
          ),
          drawer: const LeftDrawer(),
          body: FutureBuilder(
              future: fetchProduct(),
              builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                  } else {
                      if (!snapshot.hasData) {
                      return const Column(
                          children: [
                          Text(
                              "Tidak ada data produk.",
                              style:
                                  TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                          ],
                      );
                  } else {
                      return ListView.builder(
                      
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailProduct(product: snapshot.data![index],))
                              );
                            },
                            child: Container(
                                  
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text(
                                      "${snapshot.data![index].fields.name}",
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text("${snapshot.data![index].fields.amount}"),
                                      const SizedBox(height: 10),
                                      Text(
                                          "${snapshot.data![index].fields.description}")
                                  ],
                                  ),
                              ),
                          ) );         
                      }
                  }
              }));
      }
  }
  ~~~
  - Membuat screen untuk menampilkan detail barang saat barang tersebut ditekan.
  ~~~
  import 'package:flutter/material.dart';
  import 'package:rizmau_shop/models/product.dart';


  class DetailProduct extends StatelessWidget {
    final Product product;

    const DetailProduct({Key? key, required this.product}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(product.fields.name),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous page
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                product.fields.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("Region: ${product.fields.region}"),
              SizedBox(height: 10),
              Text("Amount: ${product.fields.amount}"),
              SizedBox(height: 10),
              Text("Amount Collected: ${product.fields.amountCollected}"),
              SizedBox(height: 10),
              Text("Description: ${product.fields.description}"),

            ],
          ),
        ),
      );
    }
  }
  ~~~
  - Menambahkan tombol untuk menuju ke screen daftar produk
  ~~~
  ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text('Daftar Produk'),
              onTap: () {
                  // Route menu ke halaman produk
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductPage()),
                  );
              },
          ),
  ~~~
  - Membuat screen daftar produk untuk memunculkan halaman detail saat ditekan
  ~~~
   return ListView.builder(
                    
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailProduct(product: snapshot.data![index],))
                            );
                          },
  ...
  ~~~
### Implementasi Django
- Membuat app baru yang bernama `authenticate` 
- Menambahkan fungsi `login` pada `views.py` app tersebut
  ~~~
  @csrf_exempt
  def login(request):
      username = request.POST['username']
      password = request.POST['password']
      user = authenticate(username=username, password=password)
      if user is not None:
          if user.is_active:
              auth_login(request, user)
              # Status login sukses.
              return JsonResponse({
                  "username": user.username,
                  "status": True,
                  "message": "Login sukses!"
                  # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
              }, status=200)
          else:
              return JsonResponse({
                  "status": False,
                  "message": "Login gagal, akun dinonaktifkan."
              }, status=401)

      else:
          return JsonResponse({
              "status": False,
              "message": "Login gagal, periksa kembali email atau kata sandi."
          }, status=401)
  ~~~
  - Menambahkan url tersebut pada `urls.py` app `authenticate`
  ~~~
  from django.urls import path
  from authentication.views import login

  app_name = 'authentication'

  urlpatterns = [
      path('login/', login, name='login'),
  ]
  ~~~
  - Menambahkan variable baru pada `settings.py` project
  ~~~
  CORS_ALLOW_ALL_ORIGINS = True
  CORS_ALLOW_CREDENTIALS = True
  CSRF_COOKIE_SECURE = True
  SESSION_COOKIE_SECURE = True
  CSRF_COOKIE_SAMESITE = 'None'
  SESSION_COOKIE_SAMESITE = 'None'
  ~~~
  - Menambahkan url app `authenticate` pada `urls.py` project
  ~~~
  ...
  path('auth/', include('authentication.urls')),
  ...
  ~~~
  - Menambahkan views baru pada app `main` untuk handle membuat object model dengan flutter
  ~~~
  @csrf_exempt
  def create_product_flutter(request):
      if request.method == 'POST':
          
          data = json.loads(request.body)

          new_product = Oculi.objects.create(
              user = request.user,
              name = data["name"],
              region = data["region"],
              amount = int(data["amount"]),
              amount_collected = int(data["amount_collected"]),
              description = data["description"]
          )

          new_product.save()

          return JsonResponse({"status": "success"}, status=200)
      else:
          return JsonResponse({"status": "error"}, status=401)
  ~~~
  - Menambahkan views tersebut pada `urls.py`
  ~~~
  path('create-flutter/', create_product_flutter, name='create_product_flutter'),
  ~~~
  - 
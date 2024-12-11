import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/detail_makanan/controllers/detail_controllers.dart';
import 'package:mobile/app/modules/detail_pemesanan/views/detailpem_view.dart';

class DetailMakananPage extends StatelessWidget {
  final DetailControllers controller = Get.put(DetailControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Detail Makanan",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/lontong_sayurkon.png",
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey), // Border abu-abu
                    borderRadius: BorderRadius.circular(10), // Sudut membulat
                  ),
                  child: Row(
                    mainAxisSize:
                        MainAxisSize.min, // Agar elemen tidak memenuhi lebar
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.decreaseQuantity(); // Kurangi jumlah
                        },
                        child: Icon(Icons.remove, color: Colors.black),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFC70039), // Latar belakang merah
                          borderRadius:
                              BorderRadius.circular(5), // Sedikit melengkung
                        ),
                        child: Obx(() => Text(
                              "${controller.quantity.value}", // Tampilkan jumlah dinamis
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Warna teks putih
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.increaseQuantity(); // Tambah jumlah
                        },
                        child: Icon(Icons.add, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lontong Sayur",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      const SizedBox(
                          width: 4), // Spasi antara icon dan teks rating
                      Text(
                        "4.8",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "Lontong lembut disajikan dengan kuah santan gurih, dilengkapi dengan potongan sayuran segar, tahu, tempe, dan telur, menciptakan perpaduan rasa yang kaya dan autentik.",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              const SizedBox(height: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Latar belakang abu-abu muda
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Obx(() => _infoBox("Harga", "",
                          isDynamic: true,
                          dynamicValue:
                              controller.price.string.obs)), // Harga dinamis
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey, // Divider vertikal
                    ),
                    Expanded(
                      child: Obx(() => _infoBox("Kalori", "",
                          isDynamic: true,
                          dynamicValue: controller
                              .calories.string.obs)), // Kalori dinamis
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.grey, // Divider vertikal
                    ),
                    Expanded(
                      child: _infoBox(
                          "Pengantaran", "20 menit"), // Pengantaran statis
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Ulasan Terakhir",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              reviewItem(
                  "Ananta Risky Susanto", "1 November 2024", "Enak Sekali"),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman Detail Pemesanan dengan data harga dan jumlah
                    Get.to(
                      () => DetailPemesananPage(),
                      arguments: {
                        "basePrice": controller.price.value, // Harga makanan
                        "quantity": controller.quantity.value, // Jumlah makanan
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC70039), // Warna merah
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 12),
                  ),
                  child: Text(
                    "Pesan",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoBox(String label, String value,
      {bool isDynamic = false, RxString? dynamicValue}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54, // Warna abu-abu untuk label
          ),
        ),
        const SizedBox(height: 4),
        Text(
          isDynamic && dynamicValue != null
              ? dynamicValue.value // Gunakan nilai dinamis jika tersedia
              : value, // Gunakan nilai statis jika dinamis tidak diperlukan
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color(0xFFC70039), // Warna merah untuk nilai utama
          ),
        ),
      ],
    );
  }

  Widget _reviewItem(String name, String date, String review) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(date,
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(review, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget reviewItem(String name, String date, String review) {
    return Container(
      padding: const EdgeInsets.all(12), // Padding dalam elemen
      margin: const EdgeInsets.symmetric(vertical: 8), // Jarak antar elemen
      decoration: BoxDecoration(
        color: Colors.grey[200], // Latar belakang abu-abu muda
        borderRadius: BorderRadius.circular(10), // Sudut membulat
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey, // Warna abu-abu untuk tanggal
                ),
              ),
            ],
          ),
          const SizedBox(height: 8), // Jarak antara nama dan bintang
          Row(
            children: [
              ...List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 16, // Ukuran bintang
                ),
              ),
            ],
          ),
          const SizedBox(height: 8), // Jarak antara bintang dan review teks
          Text(
            review,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

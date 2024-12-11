import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/detail_pemesanan/controllers/detailpem_controllers.dart';
import 'package:mobile/app/modules/loksaipemesanan/views/lokasi_view.dart';

class DetailPemesananPage extends StatelessWidget {
  final DetailPemesananController controller =
      Get.put(DetailPemesananController());

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments ?? {};
    final int initialPrice =
        arguments['basePrice'] ?? 0; // Ambil harga dari halaman sebelumnya
    final int initialQuantity =
        arguments['quantity'] ?? 1; // Ambil jumlah dari halaman sebelumnya

    controller.setInitialData(
        initialPrice, initialQuantity); // Inisialisasi data controller

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center, // Lokasi pusat radial
            radius: 0.8, // Radius gradient
            colors: [
              Color(0xFFE8D1D3), // Warna dasar (pink lembut)
              Color(0xFFC70039), // Warna merah
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // AppBar manual (karena background gradient tidak mendukung bawaan)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Get.back(),
                    ),
                    Text(
                      "Pesan Makanan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Warna teks putih
                      ),
                    ),
                    SizedBox(width: 48), // Placeholder agar simetris
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Indikator langkah (Step Indicator)
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _stepIndicator("1", true),
                    _stepDivider(false),
                    _stepIndicator("2", false),
                    _stepDivider(false),
                    _stepIndicator("3", false),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Center(
                child: Text(
                  "Detail Pemesanan",
                  style: TextStyle(
                    fontSize: 13, // Ukuran font
                    fontWeight: FontWeight.bold, // Teks tebal
                    color: Colors.white, // Warna putih
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Card untuk detail makanan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _detailMakananCard(),
              ),

              const SizedBox(height: 35),

              // Form Pemesanan
              _detailForm(),

              const SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stepIndicator(String step, bool isActive) {
    return Container(
      width: 28,
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive
            ? Colors.white
            : Color(0xFFFFCDD2), // Warna aktif dan tidak aktif
        borderRadius: BorderRadius.circular(8), // Membuat sudut rounded
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2), // Bayangan hanya untuk aktif
                ),
              ]
            : [],
      ),
      child: Text(
        step,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isActive
              ? Color(0xFFC70039)
              : Color(0xFFC70039), // Warna teks tetap terlihat
        ),
      ),
    );
  }

  Widget _stepDivider(bool isActive) {
    return Container(
      width: 40,
      height: 2,
      color: isActive
          ? Colors.white
          : Colors.white, // Divider dengan warna lembut saat tidak aktif
    );
  }

  Widget _detailMakananCard() {
    return Stack(
      clipBehavior:
          Clip.none, // Membiarkan konten di luar batas box tetap terlihat
      children: [
        // Box putih independen (latar belakang)
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 300, // Sesuaikan lebar box putih
            height: 85, // Sesuaikan tinggi box putih
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
        ),
        // Konten berada di atas box putih
        Positioned(
          top: -17, // Geser konten sedikit ke atas
          left: 0, // Sesuaikan jarak konten dari kiri
          right: 0, // Sesuaikan jarak konten dari kanan
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Gambar di kiri
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      50), // Membuat gambar berbentuk lingkaran
                  child: SizedBox(
                    width: 120, // Lebar gambar yang diperbesar
                    height: 120, // Tinggi gambar yang diperbesar
                    child: Image.asset(
                      "assets/images/lontong_sayurkon.png",
                      fit:
                          BoxFit.cover, // Gambar memenuhi ukuran yang diberikan
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Teks dan harga di tengah
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // "Detail Makanan" dan Harga dalam Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Detail Makanan",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                          Obx(() => Text(
                                "Rp${controller.price.value}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFFC70039),
                                ),
                              )),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Lontong Sayur",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            "4.8",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _detailForm() {
    return Container(
      width: double.infinity, // Membuat box penuh lebar layar
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // Background putih untuk box utama
        borderRadius: BorderRadius.circular(30), // Sudut membulat
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Bayangan lembut
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label "Detail Pemesanan"
          Text(
            "Detail Pemesanan",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Warna teks hitam
            ),
          ),

          const SizedBox(height: 16),

          // Sub-box putih untuk form nama, email, dll, termasuk informasi tambahan
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white, // Latar belakang putih
              borderRadius: BorderRadius.circular(20), // Sudut membulat
              border: Border.all(
                // Border abu-abu
                color: Colors.grey, // Warna grey untuk border
                width: 1, // Ketebalan border
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Field Nama
                _formField("Nama", "Wilson Hutapea"),
                const SizedBox(height: 16),

                // Field Email
                _formField("Email", "example@gmail.com"),
                const SizedBox(height: 16),

                // Field No Telepon
                _formField("No Telepon", "+6285412399102"),
                const SizedBox(height: 16),

                // Tambahkan sebagai pemesan (Switch)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tambahkan sebagai pemesan",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black, // Warna hitam
                      ),
                    ),
                    Obx(() => Switch(
                          value: controller.isPemesan.value,
                          onChanged: (value) {
                            controller.isPemesan.value = value;
                          },
                          activeColor: Color(0xFFC70039), // Warna switch aktif
                        )),
                  ],
                ),
                const SizedBox(height: 16),

                // Informasi tambahan
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color:
                        Color(0xFFFFF6EF), // Warna latar belakang oranye muda
                    borderRadius: BorderRadius.circular(8), // Sudut membulat
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.info,
                          color: Color(0xFFF57C00), size: 24), // Ikon info
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Informasi pesanan dan konfirmasi akan dikirim ke detail kontak tertera.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFFF6F0D),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Tombol Lanjutkan
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Detail Pemesanan dengan data harga dan jumlah
                Get.to(
                  () => LokasiPengirimanPage(),
                  arguments: {
                        "basePrice": controller.price.value, // Harga makanan
                        "quantity": controller.quantity.value, // Jumlah makanan
                      },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFC70039),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 10, // Tinggi bayangan
                shadowColor: Colors.black.withOpacity(1), // Warna bayangan
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "LANJUTKAN",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _formField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label field
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54, // Warna abu-abu untuk label
          ),
        ),
        const SizedBox(height: 4),
        // Nilai field
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black, // Warna teks hitam
          ),
        ),
      ],
    );
  }
}

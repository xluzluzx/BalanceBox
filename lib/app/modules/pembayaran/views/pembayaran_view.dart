import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/pembayaran/controllers/pembayaran_controllers.dart';
import 'package:mobile/app/modules/pembayaran_berhasil/views/berhasil_view.dart';

class PembayaranView extends StatelessWidget {
  final PembayaranControllers controller = Get.put(PembayaranControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.8,
            colors: [
              Color(0xFFE8D1D3),
              Color(0xFFC70039),
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
                    _stepIndicator("1", false),
                    _stepDivider(false),
                    _stepIndicator("2",
                        false), // Indikator langkah kedua diubah menjadi true
                    _stepDivider(false),
                    _stepIndicator("3", true),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Center(
                child: Text(
                  "Pembayaran",
                  style: TextStyle(
                    fontSize: 13, // Ukuran font
                    fontWeight: FontWeight.bold, // Teks tebal
                    color: Colors.white, // Warna putih
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Form detail pemesanan
              _buildForm(context),
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

  Widget _buildForm(BuildContext context) {
    // Ambil data untuk tanggal dan waktu
    final dateTimeArguments = Get.arguments ?? {};
    final DateTime? selectedDate =
        dateTimeArguments['selectedDate'] as DateTime?;
    final TimeOfDay? selectedTime =
        dateTimeArguments['selectedTime'] as TimeOfDay?;

// Format data
    final formattedDate = selectedDate != null
        ? "${selectedDate.day.toString().padLeft(2, '0')} ${_getMonthName(selectedDate.month)} ${selectedDate.year}"
        : "Tanggal tidak dipilih";
    final formattedTime = selectedTime != null
        ? "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}"
        : "Waktu tidak dipilih";

// Ambil data untuk harga dan jumlah
    final priceArguments = Get.arguments ?? {};
    final int initialPrice = priceArguments['basePrice'] ?? 0;
    final int initialQuantity = priceArguments['quantity'] ?? 1;

// Inisialisasi data controller
    controller.setInitialData(initialPrice, initialQuantity);
    // Inisialisasi data controller
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Informasi Pembayaran
          Text(
            "Pembayaran",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          // Box informasi pengiriman
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xFFE0E0E0),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$formattedDate | $formattedTime",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Reguler",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Wilson Hutapea | +6285412399102\nJl. Candi Mendut No 1 Lowokwaru, Malang, Jawa Timur, Indonesia, 67282",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Divider(color: Color(0xFFE0E0E0), thickness: 1),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Harga",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Rp10.000",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Rincian Harga
          Text(
            "Rincian Harga",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          // Detail makanan
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  "assets/images/lontong_sayurkon.png",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lontong Sayur",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Obx(() => Text(
                          "Jumlah (x${controller.quantity.value})",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        )),
                    const SizedBox(height: 4),
                    Text(
                      "Ongkos Kirim\nDiskon",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 25),
                  Text(
                    "Rp${controller.price.value}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Rp10000\n-",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),

          Divider(color: Color(0xFFE0E0E0), thickness: 1),

          // Total Harga
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Harga",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Obx(() => Text(
                    "Rp${(controller.price.value + 10000).toString()}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 16),

          // Checkbox syarat dan ketentuan
          Row(
            children: [
              Obx(
                () => Checkbox(
                  value: controller.isAgreed.value,
                  onChanged: (value) {
                    controller.isAgreed.value = value ?? false;
                  },
                  activeColor: Color(0xFFC70039),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: "Saya telah membaca dan setuju terhadap ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Syarat dan ketentuan pembelian tiket",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFC70039),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Tombol Bayar
          ElevatedButton(
            onPressed: () {
              if (controller.isAgreed.value) {
                // Navigasi ke halaman Detail Pemesanan dengan data harga dan jumlah
                Get.to(
                  () => BerhasilPage(),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFC70039),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                "BAYAR",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Tombol Tambahkan ke Keranjang
          OutlinedButton(
            onPressed: () {
              // Logika tombol tambahkan ke keranjang
            },
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(color: Color(0xFFC70039)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                "TAMBAHKAN KE KERANJANG",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFC70039),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
      {required String title, required String value, Color? color}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _showOpsiPengiriman(BuildContext context) {
    Get.bottomSheet(
      Container(
          // Konten bottom sheet
          ),
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      barrierColor: Colors.black.withOpacity(0.5), // Warna gelap pada latar
      enableDrag: true, // Geser untuk menutup
    );
  }

  String _getMonthName(int month) {
    const monthNames = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];
    return monthNames[month - 1];
  }
}

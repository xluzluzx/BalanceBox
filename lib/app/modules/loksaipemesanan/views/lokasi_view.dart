import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/detail_makanan/controllers/detail_controllers.dart';
import 'package:mobile/app/modules/loksaipemesanan/controllers/lokasi_controllers.dart';
import 'package:mobile/app/modules/pembayaran/views/pembayaran_view.dart';

class LokasiPengirimanPage extends StatelessWidget {
  final DetailControllers controller = Get.put(DetailControllers());
  final LokasiControllers lokasicontroller = Get.put(LokasiControllers());
  final RxString selectedOpsiPengiriman = "Reguler".obs;
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);
  final arguments = Get.arguments ?? {};

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
                        true), // Indikator langkah kedua diubah menjadi true
                    _stepDivider(false),
                    _stepIndicator("3", false),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Center(
                child: Text(
                  "Lokasi Pengiriman",
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
    final int initialPrice =
        arguments['basePrice'] ?? 0; // Ambil harga dari halaman sebelumnya
    final int initialQuantity =
        arguments['quantity'] ?? 1; // Ambil jumlah dari halaman sebelumnya
    lokasicontroller.setInitialData(
        initialPrice, initialQuantity); // Inisialisasi data controller
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Teks Lokasi Pemesanan
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Lokasi Pengiriman",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          // Konten dalam Box Putih
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Informasi Lokasi
                  // Informasi Lokasi
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                "Wilson Hutapea | +6285412399102 Jl. Candi Mendut No 1 Lowokwaru, Malang, Jawa Timur, Indonesia, 67282",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                                softWrap:
                                    true, // Membungkus teks jika terlalu panjang
                                overflow: TextOverflow
                                    .clip, // Memastikan teks tidak terpotong
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  ),

                  Divider(color: Colors.grey[300], thickness: 1),

// Opsi Pengiriman
                  GestureDetector(
                    onTap: () {
                      _showOpsiPengiriman(context);
                    },
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Opsi Pengiriman",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  selectedOpsiPengiriman.value,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey[300], thickness: 1),

// Pilih Tanggal Pengiriman
                  GestureDetector(
                    onTap: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        selectedDate.value = picked;
                      }
                    },
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pilih Tanggal Pengiriman",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  selectedDate.value != null
                                      ? "${selectedDate.value!.toLocal()}"
                                          .split(' ')[0]
                                      : "Pilih Tanggal",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey[300], thickness: 1),

// Pilih Jam Pengiriman
                  GestureDetector(
                    onTap: () async {
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null) {
                        selectedTime.value = picked;
                      }
                    },
                    child: Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pilih Jam Pengiriman",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  selectedTime.value != null
                                      ? "${selectedTime.value!.format(context)}"
                                      : "Pilih Jam",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey[300], thickness: 1),

                  // Catatan Tambahan
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 0),
                    child: TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Catatan Tambahan",
                        hintStyle: TextStyle(
                          color: Colors.grey, // Sesuai desain
                          fontSize: 13,
                        ),
                        filled: true,
                        fillColor:
                            Color(0xFFF9F9F9), // Warna background sesuai desain
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Radius sesuai desain
                          borderSide: BorderSide.none, // Tanpa border
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Tombol Lanjutkan
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman Detail Pemesanan dengan data harga dan jumlah
                Get.to(
                  () => PembayaranView(),
                  arguments: {
                    'selectedDate':
                        selectedDate.value, // Ambil tanggal yang dipilih
                    'selectedTime':
                        selectedTime.value, // Ambil waktu yang dipilih
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
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Center(
                child: Text(
                  "LANJUTKAN",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text("Reguler"),
              onTap: () {
                selectedOpsiPengiriman.value = "Reguler";
                Get.back();
              },
            ),
            ListTile(
              title: Text("Hemat"),
              onTap: () {
                selectedOpsiPengiriman.value = "Hemat";
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}

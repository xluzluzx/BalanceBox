import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/home/views/home_view.dart';

class BerhasilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Bagian atas dengan lingkaran merah radial
          Stack(
            children: [
              Container(
                height: 300, // Tinggi bagian lingkaran merah
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.topCenter,
                    radius: 0.9,
                    colors: [
                      Color(0xFFE8D1D3),
                      Color(0xFFC70039),
                    ],
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(1000, 300),
                  ),
                ),
              ),
              // Konten tambahan di dalam lingkaran merah (opsional jika dibutuhkan)
            ],
          ),
          const SizedBox(height: 40),

          // Konten Selamat
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Selamat",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    "Pembayaran Berhasil",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Terima kasih telah mempercayakan kebutuhan nutrisi Anda pada BalanceBox. "
                    "Pesanan Anda sedang diproses dan akan segera dikirim. "
                    "Selamat menikmati hidangan sehat dari kami!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      height: 1.5,
                    ),
                  ),
                  const Spacer(),

                  // Tombol Kembali
                  ElevatedButton(
                    onPressed: () {
                      Get.to(
                        () => HomePage(),
                      );
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
                        "KEMBALI",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

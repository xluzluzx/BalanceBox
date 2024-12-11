import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mobile/app/modules/onboarding/controllers/onboarding_controllers.dart';

class OnboardingView extends StatelessWidget {
  final OnboardingControllers controller = Get.put(OnboardingControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 50,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  'assets/images/gulai_ayamon.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC70039),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Siap menjalani hidup sehat? BalanceBox siap menemanimu mengatur asupan nutrisi dengan mudah. Yuk, mulai bersama BalanceBox!',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    3,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      width: controller.currentPage.value == index
                          ? 20
                          : 15, // Lebar dinamis
                      height: 5, // Tinggi tetap kecil untuk membentuk garis
                      decoration: BoxDecoration(
                        color: controller.currentPage.value == index
                            ? Color(0xFFC70039) // Warna aktif
                            : Colors.grey[300], // Warna tidak aktif
                        borderRadius:
                            BorderRadius.circular(2.5), // Melengkungkan ujung
                      ),
                    ),
                  ),
                );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tombol Kembali
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), // Tetap berbentuk lingkaran
                      padding: EdgeInsets.all(23), // Ukuran padding lebih besar
                      backgroundColor: Colors.grey[350],
                    ),
                    onPressed: controller.previousPage,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 28, // Ikon lebih besar
                    ),
                  ),
                  const SizedBox(width: 20), // Jarak antara tombol
                  // Tombol Geser
                  GestureDetector(
                    onHorizontalDragUpdate: (details) {
                      // Hitung batas maksimal geser
                      double maxDrag =
                          MediaQuery.of(context).size.width * 0.5 - 48;
                      double newPosition =
                          controller.dragPosition.value + details.delta.dx;

                      // Perbarui posisi hanya jika dalam batas
                      if (newPosition >= 0 && newPosition <= maxDrag) {
                        controller.dragPosition.value = newPosition;
                      } else if (newPosition < 0) {
                        controller.dragPosition.value =
                            0; // Tidak melebihi kiri
                      } else if (newPosition > maxDrag) {
                        controller.dragPosition.value =
                            maxDrag; // Tidak melebihi kanan
                      }
                    },
                    onHorizontalDragEnd: (details) {
                      double maxDrag =
                          MediaQuery.of(context).size.width * 0.5 - 48;
                      if (controller.dragPosition.value >= maxDrag) {
                        // Navigasi ke halaman berikutnya jika mencapai ujung
                        Get.toNamed('/register');
                      } else {
                        // Reset posisi jika tidak mencapai ujung
                        controller.dragPosition.value = 0;
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          0.6, // Lebar tombol abu-abu
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            BorderRadius.circular(50), // Sudut melengkung
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.grey[500]!, // Warna lebih gelap di atas
                            Colors.grey[350]!, // Warna dasar di tengah
                            Colors.grey[300]!, // Warna lebih terang di bawah
                          ],
                          stops: [0.0, 0.1, 1.0], // Distribusi gradien
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Teks "Mulai"
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Mulai",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Bulatan merah dengan panah
                          Obx(() {
                            return Positioned(
                              left: controller.dragPosition.value + 10,
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Color(0xFFC70039),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

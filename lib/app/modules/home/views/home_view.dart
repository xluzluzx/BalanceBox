import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/ai_food_analysis/foodanalysis.dart';
import 'package:mobile/app/modules/detail_makanan/views/detail_view.dart';
import 'package:mobile/app/modules/home/controllers/home_controllers.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Efek dua elips cahaya merah di pojok kanan atas
            Positioned(
              top: -130, // Atur posisi vertikal sesuai kebutuhan
              right: -10, // Atur posisi horizontal sesuai kebutuhan
              child: Container(
                width: 230, // Lebar kotak
                height: 150, // Tinggi kotak
                decoration: BoxDecoration(
                  color: Color(0xFFC70039).withOpacity(
                      0), // Warna merah dengan opacity untuk efek buram
                  borderRadius: BorderRadius.circular(
                      30), // Atur sudut melengkung di sini
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFC70039).withOpacity(0.4),
                      blurRadius: 30,
                      offset:
                          Offset(0, 5), // Atur untuk memberi sedikit bayangan
                    ),
                  ],
                ),
              ),
            ),

            // Konten utama
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Color(0xFFC70039),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Selamat pagi Wilson",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Senin, 07 Oktober 2024",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.notifications,
                        color: Colors.black,
                        size: 28,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Cari makanan anda",
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFC70039), width: 1.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFC70039), width: 1.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Date Selector
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          {'day': 'Sen', 'date': 4},
                          {'day': 'Sel', 'date': 5},
                          {'day': 'Rab', 'date': 6},
                          {'day': 'Kam', 'date': 7},
                          {'day': 'Jum', 'date': 8},
                          {'day': 'Sab', 'date': 9},
                          {'day': 'Min', 'date': 10},
                        ]
                            .map((dayInfo) => GestureDetector(
                                  onTap: () => controller.selectedDate.value =
                                      dayInfo['date'] as int,
                                  child: Container(
                                    width: 45,
                                    height: 60,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 1),
                                    decoration: BoxDecoration(
                                      color: controller.selectedDate.value ==
                                              dayInfo['date']
                                          ? Color(0xFFC70039)
                                          : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          dayInfo['day'] as String,
                                          style: TextStyle(
                                            color:
                                                controller.selectedDate.value ==
                                                        dayInfo['date']
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          (dayInfo['date'] as int).toString(),
                                          style: TextStyle(
                                            color:
                                                controller.selectedDate.value ==
                                                        dayInfo['date']
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      )),

                  const SizedBox(height: 20),

                  // Category Selector
                  Text(
                    "Kategori makanan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          {
                            'label': 'Sarapan',
                            'icon': 'assets/icons/sarapan.png'
                          },
                          {
                            'label': 'Makan siang',
                            'icon': 'assets/icons/makansiang.png'
                          },
                          {
                            'label': 'Makan malam',
                            'icon': 'assets/icons/makanmalam.png'
                          },
                        ]
                            .map((category) => GestureDetector(
                                  onTap: () => controller.selectedCategory
                                      .value = category['label'] as String,
                                  child: Container(
                                    width: 110,
                                    height: 110,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                      color:
                                          controller.selectedCategory.value ==
                                                  category['label']
                                              ? Color(0xFFC70039)
                                              : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          category['icon'] as String,
                                          width: 28,
                                          height: 28,
                                          color: controller
                                                      .selectedCategory.value ==
                                                  category['label']
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          category['label'] as String,
                                          style: TextStyle(
                                            color: controller.selectedCategory
                                                        .value ==
                                                    category['label']
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                            .toList(),
                      )),
                  const SizedBox(height: 20),

// Button for navigating to Food Analysis
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Food Analysis Page
                      Get.to(() => FoodAnalysisScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFC70039),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons
                                .lightbulb_outline, // Use an AI or lightbulb icon for representing AI
                            color: Colors.white,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Analisis Makanan (AI)",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Recommended Food List
                  Text(
                    "Makanan untukmu",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.75,
                      children: [
                        foodItem("Bayam Bening", "12K", 4.8,
                            "assets/images/bayam_bening.png"),
                        foodItem("Cah Kangkung", "12K", 4.8,
                            "assets/images/cah_kangkung.png"),
                        foodItem("Gulai Ayam", "15K", 4.8,
                            "assets/images/gulai_ayam.png"),
                        foodItem("Lontong Sayur", "15K", 4.8,
                            "assets/images/lontong_sayur.png"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Update bagian foodItem() di HomePage
  Widget foodItem(String name, String price, double rating, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (name == "Lontong Sayur") {
          Get.to(() => DetailMakananPage());
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      Icon(Icons.star_border, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text("1 km | 10 min delivery",
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

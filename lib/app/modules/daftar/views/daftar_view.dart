import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/daftar/controllers/daftar_controllers.dart';

class DaftarView extends StatelessWidget {
  DaftarView({super.key});
  final DaftarControllers controller = Get.put(DaftarControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap everything in a scrollable widget
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFC70039),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Buat akun baru anda untuk melanjutkan",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 24),

                // Field Nama
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nama",
                    style: TextStyle(
                      color: Color(0xFFC70039),
                      fontWeight:
                          FontWeight.bold, // Membuat teks "Nama" menjadi bold
                    ),
                  ),
                ),
                TextField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    hintText: "masukkan nama anda",
                    hintStyle:
                        TextStyle(color: Colors.black), // Warna teks hint
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.red), // Warna border default
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.red), // Warna border saat tidak fokus
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0), // Warna border saat fokus
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Field Email
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(
                      color: Color(0xFFC70039),
                      fontWeight:
                          FontWeight.bold, // Membuat teks "Nama" menjadi bold
                    ),
                  ),
                ),
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    hintText: "masukkan alamat email anda",
                    hintStyle:
                        TextStyle(color: Colors.black), // Warna teks hint
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.red), // Warna border default
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.red), // Warna border saat tidak fokus
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0), // Warna border saat fokus
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Field Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(
                      color: Color(0xFFC70039),
                      fontWeight:
                          FontWeight.bold, // Membuat teks "Nama" menjadi bold
                    ),
                  ),
                ),
                TextField(
                  controller: controller.passwordController,
                  obscureText: true, // Make the password text obscure
                  decoration: InputDecoration(
                    hintText: "masukkan password anda",
                    hintStyle:
                        TextStyle(color: Colors.black), // Warna teks hint
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Colors.red), // Warna border default
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.red), // Warna border saat tidak fokus
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0), // Warna border saat fokus
                    ),
                  ),
                ),
                const SizedBox(height: 3),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Lupa Password?",
                    style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration
                          .underline, // Menambahkan garis di bawah teks
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Tombol Daftar
                ElevatedButton(
                  onPressed: () {
                    controller.Register();
                    // Get.toNamed('/onboarding');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC70039),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child:
                        Text("Daftar", style: TextStyle(color: Colors.white)),
                  ),
                ),

                const SizedBox(height: 16),
                Text("atau", style: TextStyle(color: Colors.black)),
                const SizedBox(height: 16),

                // Tombol "Lanjutkan dengan Google" menggunakan Icon
                OutlinedButton.icon(
                  onPressed: () {
                    // Add Google Sign-In logic here
                  },
                  icon: Image.asset(
                    'assets/images/google.png',
                    width: 20,
                  ),
                  label: LayoutBuilder(
                    builder: (context, constraints) {
                      // Calculate the font size dynamically based on the width of the screen
                      double fontSize = constraints.maxWidth > 200 ? 16 : 14;

                      return Text(
                        "Lanjutkan dengan Google",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: fontSize,
                        ),
                        overflow: TextOverflow
                            .ellipsis, // Ensure text doesn't overflow
                      );
                    },
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Color(0xFFC70039)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 85),
                  ),
                ),

                const SizedBox(height: 150),

                // Teks "Sudah punya akun? masuk"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sudah punya akun?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/login'); // Navigasi ke halaman login
                      },
                      child: Text(
                        "masuk",
                        style: TextStyle(
                          color: Color(0xFFC70039),
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Color(0xFFC70039), // Menambahkan garis bawah
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

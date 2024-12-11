import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/splash/controllers/splash_controllers.dart';

class SplashView extends StatelessWidget {
  final SplashControllers controller = Get.put(SplashControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset(
              'assets/images/logo.png', // Sesuaikan dengan path logo Anda
              width: 200, // Atur ukuran logo
            ),
            Spacer(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

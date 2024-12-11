import 'package:get/get.dart';

class SplashControllers extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final currentPage = 0.obs;
  @override
  void onInit() {
    super.onInit();
    navigateToNext();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void previousPage() {}
  void nextPage() {
    Get.toNamed("/home");
  }

  void navigateToNext() async {
    await Future.delayed(Duration(seconds: 3)); // Waktu delay 3 detik
    Get.offAllNamed('/onboarding'); // Navigasi ke halaman onboarding
  }

  void increment() => count.value++;
}

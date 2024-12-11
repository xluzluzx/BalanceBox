import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../services/auth_controllers.dart';

class DaftarControllers extends GetxController {
  //TODO: Implement HomeController
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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

  void increment() => count.value++;
  void Register() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
          'Information!', 'Masukkan email dan password yang benerrrr bebbbb');
      return;
    }
    await _authController.registerUser(email, password);
    // if (email == "user@mail.com" && password == "user") {
    //   Get.snackbar('Login Berhasil', "Welcome to Dhaf's Cakees");
    //   Get.toNamed('/home');
    // } else {
    //   Get.snackbar('Login gagal', 'Harap Cek Email dan Password Anda');
    // }
  }

  bool getIsloading() {
    return _authController.isLoading.value;
  }
}

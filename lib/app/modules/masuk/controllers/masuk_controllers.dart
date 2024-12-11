import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mobile/app/modules/services/auth_controllers.dart';

class MasukControllers extends GetxController {
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

  void increment() => count.value++;
  void login() {
    _authController.loginUser(emailController.text, passwordController.text);
  }
}

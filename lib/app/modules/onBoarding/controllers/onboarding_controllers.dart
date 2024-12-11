import 'package:get/get.dart';

class OnboardingControllers extends GetxController {
  //TODO: Implement HomeController
  var dragPosition = 0.0.obs; // Posisi tombol geser
  final double dragThreshold = 200.0; // Batas untuk menyelesaikan geser

  final count = 0.obs;
  final currentPage = 0.obs;
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
    Get.toNamed("/daftar");
  }

  void updateDragPosition(double delta) {
    dragPosition.value += delta;
    if (dragPosition.value < 0) dragPosition.value = 0;
  }

  bool isDragComplete(double containerWidth) {
    return dragPosition.value >= containerWidth - 70; // Geser penuh
  }

  void resetDragPosition() {
    dragPosition.value = 0;
  }

  void increment() => count.value++;
}

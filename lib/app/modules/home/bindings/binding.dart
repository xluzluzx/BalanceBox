import 'package:get/get.dart';
import 'package:mobile/app/modules/home/controllers/home_controllers.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}

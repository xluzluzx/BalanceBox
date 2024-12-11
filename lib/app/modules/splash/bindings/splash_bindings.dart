import 'package:get/get.dart';
import 'package:mobile/app/modules/splash/controllers/splash_controllers.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashControllers>(
      () => SplashControllers(),
    );
  }
}

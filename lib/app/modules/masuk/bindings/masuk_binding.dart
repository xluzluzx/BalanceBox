import 'package:get/get.dart';
import 'package:mobile/app/modules/masuk/controllers/masuk_controllers.dart';

class MasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MasukControllers>(() => MasukControllers());
  }
}

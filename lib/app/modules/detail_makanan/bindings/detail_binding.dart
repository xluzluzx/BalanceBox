import 'package:get/get.dart';
import 'package:mobile/app/modules/detail_makanan/controllers/detail_controllers.dart';

class DetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailControllers>(() => DetailControllers());
  }
}

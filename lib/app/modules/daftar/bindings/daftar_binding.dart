import 'package:get/get.dart';
import 'package:mobile/app/modules/daftar/controllers/daftar_controllers.dart';

class DaftarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarControllers>(() => DaftarControllers());
  }
}

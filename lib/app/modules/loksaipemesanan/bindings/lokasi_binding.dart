import 'package:get/get.dart';
import 'package:mobile/app/modules/loksaipemesanan/controllers/lokasi_controllers.dart';

class LokasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LokasiControllers>(() => LokasiControllers());
  }
}

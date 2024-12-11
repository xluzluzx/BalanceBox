import 'package:get/get.dart';
import 'package:mobile/app/modules/pembayaran_berhasil/controllers/berhasil_controllers.dart';

class BerhasilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BerhasilControllers>(() => BerhasilControllers());
  }
}

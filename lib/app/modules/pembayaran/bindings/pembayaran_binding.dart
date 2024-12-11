import 'package:get/get.dart';
import 'package:mobile/app/modules/pembayaran/controllers/pembayaran_controllers.dart';

class LokasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembayaranControllers>(() => PembayaranControllers());
  }
}

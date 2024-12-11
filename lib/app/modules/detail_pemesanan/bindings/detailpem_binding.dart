import 'package:get/get.dart';
import 'package:mobile/app/modules/detail_pemesanan/controllers/detailpem_controllers.dart';

class DetailpemBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPemesananController>(() => DetailPemesananController());
  }
}

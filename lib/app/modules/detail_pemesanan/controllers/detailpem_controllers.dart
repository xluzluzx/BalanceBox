import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DetailPemesananController extends GetxController {
  var basePrice = 0.obs; // Harga dasar per item
  var quantity = 1.obs; // Jumlah makanan
  var price = 0.obs; // Harga total
  var isPemesan = false.obs; // Status switch pemesan

  // Inisialisasi data harga dan jumlah
  void setInitialData(int initialBasePrice, int initialQuantity) {
    basePrice.value = initialBasePrice;
    quantity.value = initialQuantity;
    price.value = basePrice.value; // Hitung total harga
  }
}

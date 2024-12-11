import 'package:get/get.dart';

class DetailControllers extends GetxController {
  var quantity = 1.obs; // Jumlah makanan
  var basePrice = 15000; // Harga dasar per makanan
  var baseCalories = 200; // Kalori per makanan
  var price = 15000.obs; // Total harga
  var calories = 200.obs; // Total kalori

  // Logika untuk menambah jumlah makanan
  void increaseQuantity() {
    quantity.value++;
    price.value = basePrice * quantity.value; // Harga bertambah sesuai jumlah
    calories.value =
        baseCalories * quantity.value; // Kalori bertambah sesuai jumlah
  }

  // Logika untuk mengurangi jumlah makanan
  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
      price.value = basePrice * quantity.value; // Harga berkurang
      calories.value = baseCalories * quantity.value; // Kalori berkurang
    }
  }
}

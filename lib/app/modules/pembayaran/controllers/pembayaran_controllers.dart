import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PembayaranControllers extends GetxController {
  var basePrice = 0.obs; // Harga dasar per item
  var quantity = 1.obs; // Jumlah makanan
  var price = 0.obs; // Harga total
  var isPemesan = false.obs; // Status switch pemesan
  RxString selectedOpsiPengiriman = "Reguler".obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);
  RxBool isAgreed = false.obs;

  void setSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  void setSelectedTime(TimeOfDay time) {
    selectedTime.value = time;
  }

  void toggleAgreement() {
    isAgreed.value = !isAgreed.value;
  }

  void setInitialData(int initialBasePrice, int initialQuantity) {
    basePrice.value = initialBasePrice;
    quantity.value = initialQuantity;
    price.value = basePrice.value; // Hitung total harga
  }
}

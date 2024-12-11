import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

// Clarifai API Key dan Model ID
const String clarifaiApiKey =
    "5dbf933c6b294ad1a9fd52691061344e"; // Ganti dengan API Key Clarifai Anda
const String clarifaiModelId =
    "food-item-recognition"; // Model pengenalan makanan

// USDA API Key
const String usdaApiKey =
    "uitjrNXjQmd4DVELmAfZanqrGODkN9RHSA4EGPJf"; // Ganti dengan API Key USDA Anda

/// Fungsi untuk menganalisis gambar makanan menggunakan Clarifai
Future<List<Map<String, dynamic>>> analyzeFood(File image) async {
  final url = "https://api.clarifai.com/v2/models/$clarifaiModelId/outputs";

  // Konversi gambar menjadi Base64
  final imageBytes = image.readAsBytesSync();
  final base64Image = base64Encode(imageBytes);

  // Kirim permintaan ke API Clarifai
  final response = await http.post(
    Uri.parse(url),
    headers: {
      "Authorization": "Key $clarifaiApiKey",
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "inputs": [
        {
          "data": {
            "image": {"base64": base64Image}
          }
        }
      ]
    }),
  );

  // Periksa apakah respons berhasil
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List<Map<String, dynamic>> results = [];

    // Ekstrak nama makanan dan confidence dari `concepts`
    final outputs = data['outputs'];
    for (var output in outputs) {
      final concepts = output['data']['concepts'];
      for (var concept in concepts) {
        results.add({
          'name': concept['name'], // Nama makanan
          'value': concept['value'], // Confidence value
        });
      }
    }

    return results; // Kembalikan daftar nama makanan dan confidence
  } else {
    throw Exception("Failed to analyze image: ${response.body}");
  }
}

/// Fungsi untuk mendapatkan informasi nutrisi makanan dari USDA
Future<Map<String, dynamic>> getNutritionInfo(String foodName) async {
  final url =
      "https://api.nal.usda.gov/fdc/v1/foods/search?query=$foodName&api_key=$usdaApiKey";

  // Kirim permintaan ke API USDA
  final response = await http.get(Uri.parse(url));

  // Periksa apakah respons berhasil
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final foodItems = data['foods'];

    if (foodItems.isNotEmpty) {
      final food = foodItems[0]; // Ambil hasil pertama
      return {
        'description': food['description'], // Nama makanan
        'calories': food['foodNutrients']?.firstWhere(
            (n) => n['nutrientName'] == "Energy",
            orElse: () => {'value': 'N/A'})['value'], // Kalori
        'protein': food['foodNutrients']?.firstWhere(
            (n) => n['nutrientName'] == "Protein",
            orElse: () => {'value': 'N/A'})['value'], // Protein
        'fat': food['foodNutrients']?.firstWhere(
            (n) => n['nutrientName'] == "Total lipid (fat)",
            orElse: () => {'value': 'N/A'})['value'], // Lemak
        'carbohydrates': food['foodNutrients']?.firstWhere(
            (n) => n['nutrientName'] == "Carbohydrate, by difference",
            orElse: () => {'value': 'N/A'})['value'], // Karbohidrat
      };
    } else {
      throw Exception("No nutrition data found for $foodName");
    }
  } else {
    throw Exception("Failed to fetch nutrition info: ${response.body}");
  }
}

/// Fungsi utama untuk menggabungkan pengenalan makanan dan informasi nutrisi
Future<List<Map<String, dynamic>>> analyzeAndFetchNutrition(File image) async {
  // Panggil API Clarifai untuk mengenali makanan
  final foodResults = await analyzeFood(image);

  final List<Map<String, dynamic>> nutritionResults = [];
  for (var food in foodResults) {
    try {
      // Dapatkan informasi nutrisi dari USDA berdasarkan nama makanan
      final nutrition = await getNutritionInfo(food['name']);
      nutritionResults.add({
        'name': food['name'],
        'confidence':
            (food['value'] * 100).toStringAsFixed(2), // Confidence dalam persen
        'calories': nutrition['calories'],
        'protein': nutrition['protein'],
        'fat': nutrition['fat'],
        'carbohydrates': nutrition['carbohydrates'],
      });
    } catch (e) {
      // Jika terjadi error untuk makanan tertentu, tambahkan pesan error
      nutritionResults.add({
        'name': food['name'],
        'confidence': (food['value'] * 100).toStringAsFixed(2),
        'error': e.toString(),
      });
    }
  }

  return nutritionResults;
}

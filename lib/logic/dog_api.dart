import 'package:http/http.dart' as http;
import 'dart:convert';

class DogApi { //Creamos una clase DogApi que contenga la parte lógica
  final String apiKey = 'live_m0YgjyLOeztVhXWdXoRwOpGVd925VwaXJVk0EopVIdqDbbEi4ggOxldOYRWRHsF0';
  final String baseUrl = 'https://api.thedogapi.com/v1';

  Future<List<dynamic>> searchBreeds(String query) async {
    final url = Uri.parse('$baseUrl/breeds/search?q=$query');
    try {
      final response = await http.get(
        url,
        headers: {'x-api-key': apiKey},
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Error searching breeds: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error searching breeds: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> getBreedImage(String breedId) async {
    final url = Uri.parse('$baseUrl/images/search?breed_ids=$breedId&limit=1');
    try {
      final response = await http.get(
        url,
        headers: {'x-api-key': apiKey},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return data.first;
        }
      } else {
        print('Error getting breed image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error getting breed image: $e');
    }
    return null;
  }
}
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';

class DogApi {
  final String apiKey = 'live_m0YgjyLOeztVhXWdXoRwOpGVd925VwaXJVk0EopVIdqDbbEi4ggOxldOYRWRHsF0';
  final String baseUrl = 'https://api.thedogapi.com/v1';
  final _logger = Logger();

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
        _logger.e('Error searching breeds: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      _logger.e('Error searching breeds: $e');
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
        _logger.e('Error getting breed image: ${response.statusCode}');
      }
    } catch (e) {
      _logger.e('Error getting breed image: $e');
    }
    return null;
  }
}
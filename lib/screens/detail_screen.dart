import 'package:flutter/material.dart';
import '../models/personality.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailScreen extends StatefulWidget {
  final Personality personality;

  const DetailScreen({super.key, required this.personality});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Map<String, dynamic>> _breedDetails = [];
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchBreedDetails();
  }

  Future<void> _fetchBreedDetails() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    List<Map<String, dynamic>> details = [];
    for (final breedName in widget.personality.compatibleBreeds) {
      final url = Uri.parse('https://api.thedogapi.com/v1/breeds/search?q=$breedName');
      try {
        final response = await http.get(
          url,
          headers: {'x-api-key': 'YOUR_API_KEY'}, // Reemplaza con tu API Key
        );

        if (response.statusCode == 200) {
          final List<dynamic> data = json.decode(response.body);
          if (data.isNotEmpty) {
            details.add(data.first); // Tomamos el primer resultado si lo hay
          } else {
            print('No se encontraron detalles para la raza: $breedName');
          }
        } else {
          setState(() {
            _errorMessage = 'Error al cargar los detalles de las razas: ${response.statusCode}';
          });
          print('Error al cargar los detalles de las razas: ${response.statusCode}');
          return;
        }
      } catch (e) {
        setState(() {
          _errorMessage = 'Error de conexión: $e';
        });
        print('Error de conexión: $e');
        return;
      }
    }

    setState(() {
      _breedDetails = details;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.personality.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.personality.imageUrl),
            const SizedBox(height: 20),
            Text(
              widget.personality.description,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Text(
              'Razas compatibles:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_errorMessage.isNotEmpty)
              Text(_errorMessage, style: const TextStyle(color: Colors.red))
            else if (_breedDetails.isEmpty)
              const Text('No se encontraron detalles de las razas.')
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _breedDetails.length,
                  itemBuilder: (context, index) {
                    final breed = _breedDetails[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(breed['name'] ?? 'Nombre no disponible', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          if (breed['temperament'] != null)
                            Text('Temperamento: ${breed['temperament']}', style: const TextStyle(fontSize: 16)),
                          if (breed['life_span'] != null)
                            Text('Esperanza de vida: ${breed['life_span']}', style: const TextStyle(fontSize: 16)),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

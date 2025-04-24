import 'package:flutter/material.dart';
import '../models/personality.dart';
import '../logic/dog_api.dart';
import 'package:logger/logger.dart';

class DetailScreen extends StatefulWidget {
  final Personality personality;

  const DetailScreen({super.key, required this.personality});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final DogApi _dogApi = DogApi();
  List<Map<String, dynamic>> _breedDetails = [];
  bool _isLoading = false;
  String _errorMessage = '';
  final _logger = Logger();

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
      final results = await _dogApi.searchBreeds(breedName);
      if (results.isNotEmpty) {
        details.add(results.first);
      } else {
        _logger.i('Could not find details for the breed: $breedName');
      }
    }

    // Fetch images for the found breeds
    List<Map<String, dynamic>> detailsWithImage = [];
    for (final breedDetail in details) {
      final breedId = breedDetail['id']?.toString();
      if (breedId != null) {
        _logger.d('Fetching image for breed ID: $breedId');
        final image = await _dogApi.getBreedImage(breedId);
        _logger.d('Image response for $breedId: $image');
        detailsWithImage.add({...breedDetail, 'image': image?['url']});
      } else {
        detailsWithImage.add({...breedDetail, 'image': null});
      }
    }

    setState(() {
      _breedDetails = detailsWithImage;
      _isLoading = false;
      _logger.d('Final _breedDetails: $_breedDetails');
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
              'Compatible breeds:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (_isLoading)
              const Center(child: CircularProgressIndicator())
            else if (_errorMessage.isNotEmpty)
              Text(_errorMessage, style: const TextStyle(color: Colors.red))
            else if (_breedDetails.isEmpty)
              const Text('No compatible breeds found.')
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _breedDetails.length,
                  itemBuilder: (context, index) {
                    final breed = _breedDetails[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (breed['image'] != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: SizedBox(
                                  width: 100, // Define el ancho deseado (igual a la altura para un círculo)
                                  height: 100, // Define la altura deseada
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50), // BorderRadius del 50% para hacerlo redondo
                                    child: Image.network(
                                      breed['image'],
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const SizedBox(
                                            width: 100,
                                            height: 100,
                                            child: Center(child: Icon(Icons.broken_image)));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(breed['name'] ?? 'Name not available', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  if (breed['temperament'] != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text('Temperament: ${breed['temperament']}', style: const TextStyle(fontSize: 16)),
                                    ),
                                  if (breed['life_span'] != null)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text('Life span: ${breed['life_span']}', style: const TextStyle(fontSize: 16)),
                                    ),
                                  // Aquí puedes añadir más detalles de la API
                                ],
                              ),
                            ),
                          ],
                        ),
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
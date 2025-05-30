import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageService {
  final String? _apiKey = dotenv.env['API_KEY'];
  // Corrected model name to a generally available one if 'imagen-3.0-generate-002' is too specific or restricted
  // For public Gemini API, one might use a model like 'gemini-pro-vision' for image understanding
  // or a specific image generation model endpoint if available directly.
  // The user specified 'imagen-3.0-generate-002', so we'll use that.
  final String _modelName = 'imagen-3.0-generate-002'; 

  Future<String?> generatePixelArt(String userPrompt) async {
    if (_apiKey == null || _apiKey!.isEmpty) {
      print('API Key is missing. Make sure you have a .env file with API_KEY set.');
      throw Exception('API Key is missing.');
    }

    final String apiUrl = 'https://generativelanguage.googleapis.com/v1beta/models/$_modelName:predict?key=$_apiKey';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'instances': [
            {
              'prompt': userPrompt,
            }
          ],
          'parameters': {
            'sampleCount': 1, // Generate 1 image
            'aspectRatio': '1:1', // Explicitly set aspect ratio
            // 'personGeneration': 'allow_adult' // Default
          }
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        // The exact structure of the response needs to be verified from API documentation.
        // Assuming 'predictions' is an array and each prediction has 'bytesBase64Encoded'.
        if (responseBody.containsKey('predictions') &&
            responseBody['predictions'] is List &&
            (responseBody['predictions'] as List).isNotEmpty) {
          final firstPrediction = responseBody['predictions'][0];
          if (firstPrediction.containsKey('bytesBase64Encoded')) {
            return 'data:image/png;base64,${firstPrediction['bytesBase64Encoded']}';
          } else if (firstPrediction.containsKey('url')) { // Fallback if URL is provided instead
            return firstPrediction['url'];
          }
        }
        throw Exception('Failed to parse image data from response: ${response.body}');
      } else {
        print('API Error: ${response.statusCode}');
        print('API Response: ${response.body}');
        throw Exception('Failed to generate image. Status Code: ${response.statusCode}. Response: ${response.body}');
      }
    } catch (e) {
      print('Error generating image: $e');
      rethrow; // Rethrow to be caught by the UI
    }
  }
}

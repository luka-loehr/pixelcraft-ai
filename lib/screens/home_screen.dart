import 'package:flutter/material.dart';
import 'package:pixelcraft_ai/services/image_service.dart';
import 'package:pixelcraft_ai/widgets/header_widget.dart';
import 'package:pixelcraft_ai/widgets/prompt_input_widget.dart';
import 'package:pixelcraft_ai/widgets/generate_button_widget.dart';
import 'package:pixelcraft_ai/widgets/image_display_widget.dart';
import 'package:pixelcraft_ai/widgets/download_button_widget.dart';
import 'package:pixelcraft_ai/widgets/error_message_widget.dart';
import 'package:pixelcraft_ai/widgets/footer_widget.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart'; // Added
import 'dart:typed_data'; // For Uint8List
import 'dart:convert'; // For base64Decode
import 'package:google_fonts/google_fonts.dart'; // For global theme font
import 'package:flutter/foundation.dart'; // For kIsWeb

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImageService _imageService = ImageService();
  final TextEditingController _promptController = TextEditingController();

  String _currentPrompt = '';
  String? _generatedImageUrl;
  bool _isLoading = false;
  String? _errorMessage;
  bool _showDownloadSuccessFeedback = false; // New state for download button feedback
  bool _isSavingImage = false; // Flag to prevent concurrent save operations

  void _handleGenerateImage() async {
    if (_promptController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Prompt cannot be empty.';
      });
      return;
    }
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _generatedImageUrl = null;
      _currentPrompt = _promptController.text;
    });

    try {
      String enhancedPrompt = _promptController.text +
          ', pixel art, 8-bit style, retro video game aesthetic, vibrant colors, clear outlines';
      
      final imageUrl = await _imageService.generatePixelArt(enhancedPrompt);
      setState(() {
        _generatedImageUrl = imageUrl;
        if (imageUrl == null && !_isLoading) { // Only set error if not already loading a new image
            _errorMessage = 'Failed to generate image. The service might be unavailable or the prompt was too complex.';
        }
      });
    } catch (e) {
      if(mounted){
        setState(() {
          _errorMessage = e.toString().replaceFirst("Exception: ", "");
        });
      }
    } finally {
      if(mounted){
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _handleDownloadImage() async {
    if (_isSavingImage) return; // Prevent concurrent saves

    setState(() {
      _isSavingImage = true;
      _errorMessage = null; // Clear previous errors when starting a new save
    });

    try {
      if (_generatedImageUrl == null || !_generatedImageUrl!.startsWith('data:image/png;base64,')) {
        if (mounted) {
          setState(() {
            _errorMessage = 'No image to download or image format is not supported.';
          });
        }
        return;
      }
      final String base64String = _generatedImageUrl!.split(',').last;
      final Uint8List bytes = base64Decode(base64String);
      
      String fileName;
      if (_currentPrompt.isNotEmpty) {
        // Replace non-alphanumeric characters (except spaces) with nothing, then spaces with underscores
        String safePrompt = _currentPrompt.replaceAll(RegExp(r'[^a-zA-Z0-9 ]'), '').trim();
        // Further ensure it's mostly alphanumeric and underscores, and not too long
        fileName = safePrompt.replaceAll(' ', '_').replaceAll(RegExp(r'__+'), '_');
        if (fileName.length > 50) {
          fileName = fileName.substring(0, 50);
        }
        // Remove trailing underscores that might result from substring or replacements
        fileName = fileName.replaceAll(RegExp(r'_+$'), '');
        if (fileName.isEmpty) {
            fileName = 'pixel_art';
        }
      } else {
        fileName = 'pixel_art';
      }
      fileName += '.png';

      // Save to gallery instead of downloads folder
      if (!kIsWeb) { // image_gallery_saver doesn't support web
        final result = await ImageGallerySaver.saveImage(
          bytes,
          quality: 90, // Quality for JPEG, ignored for PNG
          name: fileName,
          isReturnImagePathOfIOS: true, // Recommended for iOS
        );
        if (result['isSuccess'] == true) {
          // Optionally, show a success message
          if (mounted) {
             setState(() {
              _showDownloadSuccessFeedback = true; // Set for button feedback
              _errorMessage = null; // Clear any previous error messages
            });
            // Clear the button feedback after a few seconds
            Future.delayed(Duration(seconds: 2), () { 
              if (mounted && _showDownloadSuccessFeedback) {
                setState(() {
                  _showDownloadSuccessFeedback = false;
                });
              }
            });
          }
        } else {
          if (mounted) {
            setState(() {
              _errorMessage = 'Failed to save image: ${result['errorMessage'] ?? 'Unknown error'}';
            });
          }
        }
      } else {
        // Fallback for web (or show a message that saving to gallery is not supported on web)
        // For now, let's indicate it's not supported on web directly
        if (mounted) {
          setState(() {
            _errorMessage = 'Saving to gallery is not supported on Web. Use browser download.';
          });
        }
      }

    } catch (e) {
      if(mounted){
        setState(() {
          _errorMessage = 'Failed to save image: ${e.toString().replaceFirst("Exception: ", "")}';
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSavingImage = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2D3748), // Main background from screenshot (dark blue-gray)
      body: SafeArea(
        child: Container( // Changed from SingleChildScrollView to Container for static layout
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Further reduced vertical padding
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 480), // Adjusted max width to better match screenshot proportions
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // This will center the column if there's space
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // It's possible the content might overflow. 
                  // If so, we might need to wrap flexible parts with Expanded or Flexible,
                  // or further reduce spacing/font sizes.
                  HeaderWidget(),
                  SizedBox(height: 12), // Reduced spacing
                  Expanded( // Make the card Expanded so it takes available vertical space
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16), // Further reduced vertical padding
                      decoration: BoxDecoration(
                        color: Color(0xFF4A5568), // Card background from screenshot (medium blue-gray)
                        borderRadius: BorderRadius.circular(12.0),
                        // No border or shadow for the card as per screenshot
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text( // Instruction text from screenshot
                            'Enter a prompt to generate pixel art.', // Simplified instruction text
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoMono(
                              color: Colors.grey[300],
                              fontSize: 12.5, // Further reduced font size
                              height: 1.3, // Line height
                            ),
                          ),
                          SizedBox(height: 12), // Reduced spacing
                          PromptInputWidget(
                            controller: _promptController,
                            onChanged: (value) {
                              if (_errorMessage != null && value.isNotEmpty){
                                setState(() {
                                  _errorMessage = null; 
                                });
                              }
                            },
                          ),
                          SizedBox(height: 10), // Reduced spacing
                          GenerateButtonWidget(
                            onPressed: _handleGenerateImage,
                            isLoading: _isLoading,
                          ),
                          SizedBox(height: 12), // Reduced spacing
                          Expanded( // This will allow the ImageDisplayWidget to take up remaining space in the card
                            child: Center( // Center the AspectRatio within the Expanded space
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: ImageDisplayWidget(
                                  imageUrl: _generatedImageUrl,
                                  isLoading: _isLoading,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10), // Reduced spacing
                          DownloadButtonWidget(
                            onPressed: _isSavingImage ? null : _handleDownloadImage, // Disable while saving
                            isSuccess: _showDownloadSuccessFeedback, // Pass success state
                          ),
                          if (_errorMessage != null && _errorMessage!.isNotEmpty)
                             Padding(
                               padding: const EdgeInsets.only(top: 8.0), // Reduced padding
                               child: ErrorMessageWidget(message: _errorMessage),
                             ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12), // Reduced spacing for Footer
                  FooterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

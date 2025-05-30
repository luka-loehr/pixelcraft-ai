import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart'; // For kTransparentImage

class ImageDisplayWidget extends StatelessWidget {
  final String? imageUrl;
  final bool isLoading;

  const ImageDisplayWidget({Key? key, this.imageUrl, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // For the gradient border effect inspired by the screenshot
    // Using a Stack with multiple Containers to simulate a gradient border effect.
    // The AspectRatio is removed from here and will be handled by the parent in home_screen.
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer border (pinkish part of the gradient)
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFF56565), // Pinkish-red from screenshot border
            borderRadius: BorderRadius.circular(10.0), // Slightly larger for border effect
          ),
        ),
        // Inner border (purplish part of the gradient)
        Padding(
          padding: const EdgeInsets.all(2.5), // Creates the outer border thickness
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF9F2BFE), // Purplish from screenshot border
              borderRadius: BorderRadius.circular(7.5), // Slightly smaller than outer
            ),
          ),
        ),
        // Actual content container
        Padding(
          padding: const EdgeInsets.all(5), // Creates the inner border thickness and reveals gradient
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF4A5568), // Background for image/placeholder content
              borderRadius: BorderRadius.circular(5.0),
              // The screenshot does not show an inner border on the content itself, only the gradient effect
            ),
            child: Center(
              child: SizedBox.expand( // Ensure the content tries to fill the available space
                child: _buildContent(context),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    if (isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // No CircularProgressIndicator in the new screenshot for loading, just text
          Text(
            'Generating...', // Simplified loading text
            style: GoogleFonts.robotoMono(color: Colors.grey[300], fontSize: 18), // Increased font size
          ),
        ],
      );
    }
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      if (imageUrl!.startsWith('data:image')) {
        final UriData? data = Uri.tryParse(imageUrl!)?.data;
        if (data != null && data.contentAsBytes().isNotEmpty) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(5.0), // Match inner container's effective radius
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: MemoryImage(data.contentAsBytes()),
              fadeInDuration: Duration(milliseconds: 300),
              fit: BoxFit.cover,
            ),
          );
        }
      } else {
        return ClipRRect(
          borderRadius: BorderRadius.circular(5.0), // Match inner container's effective radius
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: imageUrl!,
            fadeInDuration: Duration(milliseconds: 300),
            fit: BoxFit.cover,
          ),
        );
      }
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.image_outlined,
          size: 80,
          color: Color(0xFFA0AEC0),
        ),
        SizedBox(height: 16),
        Text(
          'Pixel Art',
          textAlign: TextAlign.center,
          style: GoogleFonts.robotoMono(color: Color(0xFFCBD5E0), fontSize: 15),
        ),
      ],
    );
  }
}

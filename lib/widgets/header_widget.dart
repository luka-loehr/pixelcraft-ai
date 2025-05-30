import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder for "PixelCraft AI" title with gradient and animation
    // Inspired by: text-4xl sm:text-5xl font-extrabold text-center
    // bg-gradient-to-r from-purple-600 via-pink-500 to-red-500 text-transparent bg-clip-text animate-pulse
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column( // Use Column for title and subtitle
        children: [
          Text(
            'PixelCraft AI',
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoMono(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xFF9F7AEA), // Purple color from screenshot (approx.)
            ),
          ),
          SizedBox(height: 6), // Reduced space
          Text(
            'Your Retro Image Generator',
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoMono(
              fontSize: 16,
              color: Colors.grey[300], // Light gray
            ),
          ),
        ],
      ),
    );
  }
}

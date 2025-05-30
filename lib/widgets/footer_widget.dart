import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder for footer
    // Inspired by: mt-8 text-center text-sm text-slate-500
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
      child: Column( // Use Column for multiple lines of text
        children: [
          Text(
            '© ${DateTime.now().year} PixelCraft AI. Powered by Gemini.', // Updated text
            textAlign: TextAlign.center,
            style: GoogleFonts.robotoMono(color: Color(0xFFA0AEC0), fontSize: 11), // Slightly reduced font size
          ),
        ],
      ),
    );
  }
}
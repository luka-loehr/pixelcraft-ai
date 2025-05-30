import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromptInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const PromptInputWidget({Key? key, required this.controller, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder for styled text input
    // Inspired by: w-full p-4 bg-slate-800 text-slate-200 border-2 border-slate-700 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent placeholder-slate-500 transition-all duration-300 text-lg shadow-inner
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: GoogleFonts.robotoMono(color: Colors.grey[200], fontSize: 15), // Slightly reduced font size
      decoration: InputDecoration(
        hintText: 'Enter your pixel art prompt...',
        hintStyle: GoogleFonts.robotoMono(color: Color(0xFFCBD5E0), fontSize: 15), // Slightly reduced font size
        filled: true,
        fillColor: Color(0xFF4A5568), // Darker blue-gray from screenshot
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Color(0xFF718096), width: 1.5), // Border color from screenshot
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Color(0xFF9F2BFE), width: 2.5), // Bright purple from new screenshot
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0), // Reduced vertical padding
      ),
      cursorColor: Color(0xFF9F2BFE), // Bright purple cursor to match focused border
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String? message;

  const ErrorMessageWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder for error message display
    // Inspired by: mt-4 p-3 bg-red-200 border border-red-400 text-red-700 rounded-lg text-sm
    if (message == null || message!.isEmpty) {
      return SizedBox.shrink();
    }
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.red[100], // bg-red-200
        border: Border.all(color: Colors.red[400]!), // border-red-400
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        message!,
        style: GoogleFonts.robotoMono(color: Colors.red[700], fontSize: 14), // text-red-700 text-sm
        textAlign: TextAlign.center,
      ),
    );
  }
}

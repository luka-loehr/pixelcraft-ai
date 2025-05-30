import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenerateButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const GenerateButtonWidget({Key? key, required this.onPressed, this.isLoading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Remove the outer shadow container for a flatter design based on screenshot
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8.0),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Color.fromRGBO(71, 85, 105, 1),
      //       offset: Offset(8, 8),
      //       blurRadius: 0,
      //     )
      //   ],
      // ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          backgroundColor: Color(0xFF38A169), // Vibrant green from screenshot
          disabledBackgroundColor: Color(0xFF38A169).withOpacity(0.5),
          textStyle: GoogleFonts.robotoMono(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          elevation: 0, 
        ).copyWith(
             foregroundColor: MaterialStateProperty.resolveWith<Color?>((states) {
              // Text color should be dark for a light green button if not specified directly in textStyle
              return Colors.white; // Keeping white as it seems to be in the screenshot
            }),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.white.withOpacity(0.1); // Subtle press effect
                }
                return null; // Defer to the default
              },
            ),
        ),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 18, height: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5)),
                  SizedBox(width: 10),
                  Text('Generating...', style: GoogleFonts.robotoMono(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white))
                ],
              )
            : Text('Craft Pixels!'),
      ),
    );
  }
}

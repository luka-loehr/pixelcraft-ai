import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed; // Nullable if image not available
  final bool isSuccess; // New parameter for success state

  const DownloadButtonWidget({Key? key, this.onPressed, this.isSuccess = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onPressed == null && !isSuccess) { // Only shrink if not in success state either
      return SizedBox.shrink(); 
    }

    final buttonText = isSuccess ? 'Success!' : 'Download Art';
    final buttonColor = isSuccess ? Colors.green[600] : Color(0xFF4299E1);
    final iconData = isSuccess ? Icons.check_circle_outline_rounded : Icons.download_rounded;

    return Container(
      // Removed shadow container for consistency with GenerateButtonWidget
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
      child: ElevatedButton.icon(
        onPressed: isSuccess ? null : onPressed, // Disable button during success feedback, or if original onPressed is null
        icon: Icon(iconData, color: Colors.white, size: 20),
        label: Text(buttonText),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          backgroundColor: buttonColor, 
          disabledBackgroundColor: buttonColor, // Keep color when disabled during success
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.robotoMono(fontWeight: FontWeight.bold, fontSize: 17),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          elevation: 0, 
        ).copyWith(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed) && !isSuccess) {
                return Colors.white.withOpacity(0.1); 
              }
              return null; 
            },
          ),
        ),
      ),
    );
  }
}

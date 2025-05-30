import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pixelcraft_ai/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme baseTextTheme = Theme.of(context).textTheme;
    final Color primaryTextColor = Colors.grey[200]!;

    return MaterialApp(
      title: 'PixelCraft AI',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF9F2BFE), // Updated primary accent to match focused elements
        scaffoldBackgroundColor: Color(0xFF2D3748),
        fontFamily: GoogleFonts.robotoMono().fontFamily,
        textTheme: baseTextTheme.copyWith(
          bodyLarge: GoogleFonts.robotoMono(textStyle: baseTextTheme.bodyLarge?.copyWith(color: primaryTextColor, fontSize: 16)),
          bodyMedium: GoogleFonts.robotoMono(textStyle: baseTextTheme.bodyMedium?.copyWith(color: primaryTextColor, fontSize: 14)),
          displayLarge: GoogleFonts.robotoMono(textStyle: baseTextTheme.displayLarge?.copyWith(color: primaryTextColor)),
          displayMedium: GoogleFonts.robotoMono(textStyle: baseTextTheme.displayMedium?.copyWith(color: primaryTextColor)),
          displaySmall: GoogleFonts.robotoMono(textStyle: baseTextTheme.displaySmall?.copyWith(color: primaryTextColor)),
          headlineLarge: GoogleFonts.robotoMono(textStyle: baseTextTheme.headlineLarge?.copyWith(color: primaryTextColor)),
          headlineMedium: GoogleFonts.robotoMono(textStyle: baseTextTheme.headlineMedium?.copyWith(color: primaryTextColor)),
          headlineSmall: GoogleFonts.robotoMono(textStyle: baseTextTheme.headlineSmall?.copyWith(color: primaryTextColor)),
          titleLarge: GoogleFonts.robotoMono(textStyle: baseTextTheme.titleLarge?.copyWith(color: primaryTextColor)),
          titleMedium: GoogleFonts.robotoMono(textStyle: baseTextTheme.titleMedium?.copyWith(color: primaryTextColor)),
          titleSmall: GoogleFonts.robotoMono(textStyle: baseTextTheme.titleSmall?.copyWith(color: primaryTextColor)),
          labelLarge: GoogleFonts.robotoMono(textStyle: baseTextTheme.labelLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)), // Ensure button text is white and sized
          bodySmall: GoogleFonts.robotoMono(textStyle: baseTextTheme.bodySmall?.copyWith(color: Colors.grey[400])),
          labelSmall: GoogleFonts.robotoMono(textStyle: baseTextTheme.labelSmall?.copyWith(color: Colors.grey[400])),
        ).apply(
          bodyColor: primaryTextColor,
          displayColor: primaryTextColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              // This will be used by button children if they don't have their own explicit style
              GoogleFonts.robotoMono(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white), 
            ),
            foregroundColor: MaterialStateProperty.all(Colors.white), // Default text/icon color for buttons
             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              )
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 20, horizontal: 24)
            ),
            elevation: MaterialStateProperty.all(0)
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: GoogleFonts.robotoMono(color: Color(0xFFCBD5E0), fontSize: 16), // Ensure hint style matches screenshot
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Color(0xFF718096), width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Color(0xFF9F2BFE), width: 2.5), // Match focused color
            ),
            enabledBorder: OutlineInputBorder( // Ensure enabled border is also defined for consistency
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Color(0xFF718096), width: 1.5),
            ),
            filled: true,
            fillColor: Color(0xFF4A5568),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          color: Color(0xFF4A5568),
        ),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

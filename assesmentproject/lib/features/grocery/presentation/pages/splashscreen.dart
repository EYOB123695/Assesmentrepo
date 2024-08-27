import 'package:assesmentproject/features/grocery/presentation/pages/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the next screen after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Homescreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'lib/assets/imagesplashscreen.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Positioned Text
          Positioned(
            bottom: 50, // Adjust as needed for exact positioning
            left: 20, // Adjust for left positioning
            right: 20, // Adjust for right positioning
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.white, // Change color if needed
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'SPEEDY CHOW',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w900,
                    fontSize: 40, // Adjust size as needed
                    color: Colors.white, // Change color if needed
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

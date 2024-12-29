import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeadText extends StatelessWidget {
  const CustomHeadText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        text,
        style: GoogleFonts.amiri(
          textStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

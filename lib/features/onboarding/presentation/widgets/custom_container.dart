import 'package:bookly_application/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.onTap,
    required this.containerText,
  });

  final void Function()? onTap;
  final String containerText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kPrimaryColor,
        ),
        child: Center(
          child: Text(
            containerText,
            style: GoogleFonts.amiri(
              textStyle: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}

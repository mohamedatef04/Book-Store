import 'package:bookly_application/core/constants.dart';
import 'package:flutter/material.dart';

class CustomSigninContainer extends StatelessWidget {
  const CustomSigninContainer({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 327,
        height: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: mainColor,
            border: Border.all(color: Colors.blueGrey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 16,
              height: 16,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bookly_application/core/constants.dart';
import 'package:bookly_application/features/onboarding/presentation/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomOnboardingViewItem extends StatelessWidget {
  const CustomOnboardingViewItem({
    super.key,
    required this.image,
    required this.headText,
    required this.subText,
    required this.containerText,
    this.onTap,
  });

  final String image;

  final String headText;

  final String subText;

  final String containerText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push('/LoginView');
                  },
                  child: Text(
                    'Skip',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ),
            ),
            Image.asset(
              image,
              width: 320,
              height: 320,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                headText,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              child: Text(
                subText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffA6A6A6),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child:
                  CustomContainer(onTap: onTap, containerText: containerText),
            )
          ],
        ),
      ),
    );
  }
}

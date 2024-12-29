import 'package:bookly_application/features/onboarding/presentation/widgets/custom_onboarding_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  PageController pageController = PageController();
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: pageController,
          children: [
            CustomOnboardingViewItem(
              image: 'assets/images/Frame.png',
              headText: 'Now reading books\nwill be easier',
              subText:
                  ' Discover new worlds, join a vibrant\nreading community. Start your reading\nadventure effortlessly with us.',
              containerText: 'Continue',
              onTap: () {
                pageController.jumpToPage(1);
              },
            ),
            CustomOnboardingViewItem(
              image: 'assets/images/Frame (1).png',
              headText: 'Your Bookish Soulmate\nAwaits',
              subText:
                  'Let us be your guide to the perfect read.\nDiscover books tailored to your tastes\nfor a truly rewarding experience.',
              containerText: 'Get Started',
              onTap: () {
                GoRouter.of(context).push('/LoginView');
              },
            ),
            CustomOnboardingViewItem(
              image: 'assets/images/Frame (2).png',
              headText: 'Start Your\nNew Adventure',
              subText:
                  'Ready to embark on a quest for\ninspiration and knowledge? Your\nadventure begins now. Let\'s go!',
              containerText: 'Get Started',
              onTap: () {
                GoRouter.of(context).push('/LoginView');
              },
            ),
          ],
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * .45,
          top: MediaQuery.of(context).size.height * .75,
          child: SmoothPageIndicator(
            controller: pageController, // PageController
            count: 3,
            effect: WormEffect(), // your preferred effect
          ),
        ),
      ],
    ));
  }
}

import 'package:flutter/material.dart';

class OnBoardingFirstImage extends StatelessWidget {
  const OnBoardingFirstImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/market_image_onboarding.png')),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OnBoardingSecondImage extends StatelessWidget {
  const OnBoardingSecondImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 337,
      width: 293,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/onboarding_track_order_image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

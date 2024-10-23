import 'package:flutter/material.dart';

class OnBoardingThirdImage extends StatelessWidget {
  const OnBoardingThirdImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 316,
      width: 298,
      decoration:const  BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/onboarding_box_image.png'),
        ),
      ),
    );
  }
}

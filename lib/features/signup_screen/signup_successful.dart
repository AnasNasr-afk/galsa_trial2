import 'package:flutter/material.dart';
import 'package:galsa_trial2/core/theming/color_manager.dart';
import 'package:galsa_trial2/features/home_screen/home_screen.dart';

import '../../core/helpers/navigation.dart';
import '../../core/theming/text_styles.dart';

class SignupSuccessfulScreen extends StatelessWidget {
  const SignupSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check,
                  color: ColorManager.darkBlue,
                  size: 90,
                ),
                const SizedBox(height: 20),
                Text(
                  'Your Sign up was successful',
                  style: TextStyles.font16BlackRegular,
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigation.navigateTo(context, const HomeScreen());
                  },
                  child: Text(
                    'Continue to Home',
                    style: TextStyles.font20DarkBlueMedium.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

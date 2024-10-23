import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:galsa_trial2/core/helpers/spacing.dart';
import 'package:galsa_trial2/core/theming/color_manager.dart';

import '../../../core/theming/text_styles.dart';

class TermsAndVerification extends StatelessWidget {
  const TermsAndVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){},
              child: Icon(Icons.check_box_outlined,
                color: ColorManager.darkBlue,
              ),
            ),
            horizontalSpacing(8),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: 'By clicking on ‘sign up’, you’re agreeing to the Galsa app ',
                  style: TextStyles.font10BlackRegular, // default style
                  children: [
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyles.font10BlackRegular.copyWith(
                        color: ColorManager.darkBlue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {

                      },
                    ),
                    const TextSpan(
                      text: ' and ',
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyles.font10BlackRegular.copyWith(
                        color: ColorManager.darkBlue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {

                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

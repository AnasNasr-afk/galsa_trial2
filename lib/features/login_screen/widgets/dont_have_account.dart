import 'package:flutter/material.dart';
import 'package:galsa_trial2/features/signup_screen/signup_screen.dart';

import '../../../core/helpers/navigation.dart';
import '../../../core/theming/text_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?' ,
        style: TextStyles.font13BlackRegular,),
        TextButton(
            onPressed: (){
              Navigation.navigateTo(context, const SignUpScreen());
            },
            style:const ButtonStyle(
              padding: WidgetStatePropertyAll(
                EdgeInsets.zero
              )
            ),
            child: Text('Sign Up' ,
            style: TextStyles.font13DarkBlueBold,
            ),
        ),
      ],
    );
  }
}

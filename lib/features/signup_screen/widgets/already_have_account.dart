import 'package:flutter/material.dart';
import 'package:galsa_trial2/features/login_screen/login_screen.dart';
import '../../../core/helpers/navigation.dart';
import '../../../core/theming/text_styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account?' ,
          style: TextStyles.font13BlackRegular,
        ),
        TextButton(
          onPressed: (){
            Navigation.navigateTo(context, const LoginScreen());
          },
          style:const ButtonStyle(
              padding: WidgetStatePropertyAll(
                  EdgeInsets.zero,
              )
          ),
          child: Text('LogIn' ,
            style: TextStyles.font13DarkBlueBold,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/theming/color_manager.dart';
import '../../../core/theming/text_styles.dart';
import '../cubit/signup_cubit.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SignUpCubit.get(context);
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: TextButton(
          style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor:  WidgetStatePropertyAll(
                ColorManager.blueDark,
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              minimumSize: const WidgetStatePropertyAll(
                  Size(196,50)
              )
          ),
          onPressed: (){
            if(cubit.formKey.currentState!.validate()){
              cubit.emitSignUpState();
            }
          },
          child: Text(
            'Sign Up' ,
            style: TextStyles.font20WhiteSemiBold,
          )
          ,),
      ),
    );
  }
}

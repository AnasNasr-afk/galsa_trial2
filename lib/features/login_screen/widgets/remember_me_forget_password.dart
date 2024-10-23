import 'package:flutter/material.dart';

import '../../../core/theming/color_manager.dart';
import '../../../core/theming/text_styles.dart';

class RememberMeForgetPassword extends StatelessWidget {
  const RememberMeForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
      ),
      child: Row(
        children: [
          Icon(Icons.check_box ,
          color: ColorManager.blueDark,),
          Text('Remember Me' ,
          style: TextStyles.font14BlackRegular,
          ),
          const Spacer(),
          Text('Forget Password?',
            style: TextStyles.font14BlackRegular,
          ),
        ],
      ),
    );
  }
}

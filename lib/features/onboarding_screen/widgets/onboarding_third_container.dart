import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helpers/navigation.dart';
import '../../../core/theming/text_styles.dart';
import '../../login_screen/login_screen.dart';

class OnBoardingThirdContainer extends StatelessWidget {
  const OnBoardingThirdContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/onboarding_shape3.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                TextButton(onPressed: (){
                  Navigation.navigateTo(context, const LoginScreen());
                },
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        backgroundColor: const WidgetStatePropertyAll(
                            Colors.white
                        )
                    ),
                    child:Text('Skip' ,
                      style: TextStyles.font20SmoothGreenBold,) ),
                const Spacer(),
                SvgPicture.asset('assets/svgs/cart_world_logo_white.svg'),
              ],
            ),
            Text('eCommerce Shop',
              style: TextStyles.font28WhiteBold,
            ),
            const Text('_________________________________',
              style: TextStyle(color: Colors.white),),
            const SizedBox(height: 10,),
            Text('Professional App for your\neCommerce business',
              style: TextStyles.font16WhiteRegular,),
          ],
        ),
      ),
    );
  }
}

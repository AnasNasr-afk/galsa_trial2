import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/helpers/navigation.dart';
import '../../../core/theming/text_styles.dart';
import '../../login_screen/login_screen.dart';


class OnBoardingSecondContainer extends StatelessWidget {
  const OnBoardingSecondContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/onboarding_shape2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 16),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svgs/cart_world_logo_white.svg'),
                  const Spacer(),
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
                ],
              ),
              Text('eCommerce Shop',
                style: TextStyles.font28MatBlueBold,
              ),
              const Text('_________________________________',
                style: TextStyle(color: Colors.black),),
              const SizedBox(height: 10,),
              Text('Professional App for your\neCommerce business',
                style: TextStyles.font16LightBlackRegular,),
            ],
          ),
        ),
      ),
    );
  }
}

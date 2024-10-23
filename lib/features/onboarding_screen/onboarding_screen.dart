import 'package:flutter/material.dart';
import 'package:galsa_trial2/core/theming/color_manager.dart';
import 'package:galsa_trial2/features/onboarding_screen/widgets/onboarding_first_image.dart';
import 'package:galsa_trial2/features/onboarding_screen/widgets/onboarding_first_container.dart';
import 'package:galsa_trial2/features/onboarding_screen/widgets/onboarding_second_container.dart';
import 'package:galsa_trial2/features/onboarding_screen/widgets/onboarding_second_image.dart';
import 'package:galsa_trial2/features/onboarding_screen/widgets/onboarding_third_container.dart';
import 'package:galsa_trial2/features/onboarding_screen/widgets/onboarding_third_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/theming/text_styles.dart';
import 'model/boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final List <BoardingModel> board = [
      BoardingModel(
          onBoardingContainer: const OnBoardingFirstContainer(),
          onBoardingImage: const OnBoardingFirstImage(),
          onBoardingText: 'Purchase Online !!',
      ),
      BoardingModel(
        onBoardingContainer: const OnBoardingSecondContainer(),
        onBoardingImage: const OnBoardingSecondImage(),
        onBoardingText: 'Track Order !!',
      ),
      BoardingModel(
        onBoardingContainer: const OnBoardingThirdContainer(),
        onBoardingImage: const OnBoardingThirdImage(),
        onBoardingText: 'Get Your Order !!',
      ),
    ];
    var boardController = PageController();
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                controller: boardController,
                itemBuilder: (context , index) => buildOnBoardingItem(board[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 28),
            child: SmoothPageIndicator(
                controller: boardController,
                count: 3 ,
                effect: ExpandingDotsEffect(
                  activeDotColor: ColorManager.matBlue,
                  dotColor: ColorManager.lightBlue,
                  dotWidth: 12,
                  dotHeight: 12,
                  expansionFactor: 2,
                  spacing: 20,
                ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOnBoardingItem(BoardingModel model) {
    return Column(
      children: [
        if (model.onBoardingContainer != null)
          model.onBoardingContainer!,

        const SizedBox(height: 30,),
        if (model.onBoardingImage != null)
          model.onBoardingImage!,
        const SizedBox(height: 30,),
        if (model.onBoardingText != null)
          Text(
            model.onBoardingText!,
            style: TextStyles.font26BlackBold,
          ),
      ],
    );
  }
}

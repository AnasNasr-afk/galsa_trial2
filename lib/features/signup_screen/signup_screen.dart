import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galsa_trial2/core/di/dependency_injection.dart';
import 'package:galsa_trial2/core/helpers/spacing.dart';
import 'package:galsa_trial2/core/theming/color_manager.dart';
import 'package:galsa_trial2/features/signup_screen/cubit/signup_cubit.dart';
import 'package:galsa_trial2/features/signup_screen/cubit/signup_states.dart';
import 'package:galsa_trial2/features/signup_screen/signup_successful.dart';
import 'package:galsa_trial2/features/signup_screen/widgets/already_have_account.dart';
import 'package:galsa_trial2/features/signup_screen/widgets/signup_button.dart';
import 'package:galsa_trial2/features/signup_screen/widgets/signup_text_field.dart';

import '../../core/components/components.dart';
import '../../core/helpers/navigation.dart';
import '../../core/theming/text_styles.dart';
import 'widgets/terms_and_verification.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context ) => SignUpCubit(getIt()),
      child: BlocConsumer<SignUpCubit,SignUpStates>(
        listener: (context, state) {
          if (state is SignUpLoadingState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.darkBlue,
                    ),
                  );
                },
              );
            });
          }
          if (state is SignUpSuccessState) {
            Navigator.of(context).pop(); // Dismiss loading dialog
            Navigation.navigateTo(context, const SignupSuccessfulScreen());
          }
          if (state is SignUpErrorState) {
            Navigator.of(context).pop(); // Dismiss loading dialog
            setUpErrorState(context, 'Sign Up Failed');
          }
        },
        builder: (context , state) => Scaffold(
          backgroundColor: ColorManager.lightGreen,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text('Welcome!' ,
                        style: TextStyles.font24BlackRegular,),
                    ),
                    verticalSpacing(20),
                    Text('Sign up for the Galsa app',
                      style: TextStyles.font18BlackRegular,
                    ),
                    const SignUpTextField(),
                    const TermsAndVerification(),
                    const SignUpButton(),
                    const AlreadyHaveAccount(),
                  ],
                ),
              ),
            ),
          ),
        ),
      
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galsa_trial2/core/di/dependency_injection.dart';
import 'package:galsa_trial2/core/theming/color_manager.dart';
import 'package:galsa_trial2/features/home_screen/home_screen.dart';
import 'package:galsa_trial2/features/login_screen/widgets/dont_have_account.dart';
import 'package:galsa_trial2/features/login_screen/widgets/email_password_form_field.dart';
import 'package:galsa_trial2/features/login_screen/widgets/login_button.dart';
import 'package:galsa_trial2/features/login_screen/widgets/login_with_google.dart';
import 'package:galsa_trial2/features/login_screen/widgets/remember_me_forget_password.dart';
import '../../core/components/components.dart';
import '../../core/helpers/navigation.dart';
import '../../core/theming/text_styles.dart';
import 'cubit/login_cubit.dart';
import 'cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: BlocConsumer<LoginCubit , LoginStates>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: ColorManager.mainBlue,
                ),
              ),
            );
          }
          if (state is LoginSuccessState) {
            Navigation.navigateTo(context, const HomeScreen());
          }
          if (state is LoginErrorState) {
            setUpErrorState(context, state.error);
          }
        },
      
        builder:(context , state) => Scaffold(
          backgroundColor: ColorManager.lightGreen,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text('Welcome back!',
                        style: TextStyles.font24BlackRegular,
                      ),
                    ),
                    const SizedBox(height: 50,),
                    Text('Log In to your account' ,
                      style: TextStyles.font18BlackRegular,
                    ),
                    const SizedBox(height: 30,),
                    const EmailPasswordFormField(),
                    const RememberMeForgetPassword(),
                    const LoginButton(),
                    const Align(
                      alignment: Alignment.center,
                      child: Text('OR',),
                    ),
                    const LoginWithGoogle(),
                    const DontHaveAccount(),
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

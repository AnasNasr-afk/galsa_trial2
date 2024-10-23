import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:galsa_trial2/features/home_screen/home_screen.dart';

import '../../../core/authentication/authentication.dart';
import '../../../core/helpers/navigation.dart';
import '../../../core/theming/text_styles.dart';

class LoginWithGoogle extends StatelessWidget {

  const LoginWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Authentication auth = Authentication();
        User? user = await auth.signInWithGoogle();
        if (user != null) {
          // Optionally navigate to another screen or show success message
          print('User signed in: ${user.displayName}');
          Navigation.navigateTo(context, const HomeScreen());
        } else {
          // Show an error message or indication of failure
          print('Sign in failed or was canceled.');
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sign in failed or was canceled.')),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35),
        child: Container(
          height: 55,
          width: 340,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/google_icon.png',
                  fit: BoxFit.cover,
                  height: 25,
                  width: 25,
                ),
                const SizedBox(width: 20),
                Text(
                  'Log in with your Google account',
                  style: TextStyles.font16BlackRegular,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

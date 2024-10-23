import 'package:flutter/material.dart';
import 'package:galsa_trial2/core/helpers/app_regex.dart';

import '../../../core/theming/text_styles.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../cubit/login_cubit.dart';

class EmailPasswordFormField extends StatefulWidget {
  const EmailPasswordFormField({super.key});

  @override
  State<EmailPasswordFormField> createState() => _EmailPasswordFormFieldState();
}

class _EmailPasswordFormFieldState extends State<EmailPasswordFormField> {
  bool isObscured = true;
  String? emailError;
  String? passwordError;

  void updateErrorMessages(String email, String password) {
    setState(() {
      emailError = (!AppRegex.isEmailValid(email)) ? 'Enter a valid email' : null;
      passwordError = (!AppRegex.hasSpecialCharacter(password) ||
          !AppRegex.hasUpperCase(password) ||
          !AppRegex.hasLowerCase(password) ||
          !AppRegex.hasMinLength(password) ||
          !AppRegex.hasNumber(password))
          ? 'Enter a valid password'
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          // Email TextFormField
          AppTextFormField(
            hintText: 'Enter your email',
            validator: (value) {
              if (value == null || value.isEmpty ) {
                return 'Enter a valid email';
              }
              return null;
            },
            inputTextStyle: TextStyles.font15BlackRegular,
            backgroundColor: Colors.white,
            controller: cubit.emailController,
            onChanged: (value) {
              updateErrorMessages(value, cubit.passwordController.text);
            },
          ),
          const SizedBox(height: 30,),

          // Password TextFormField
          AppTextFormField(
            hintText: 'Enter your password',
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
                return 'Enter a valid password';
              }
              return null;
            },
            inputTextStyle: TextStyles.font15BlackRegular,
            controller: cubit.passwordController,
            backgroundColor: Colors.white,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscured = !isObscured;
                });
              },
              child: Icon(
                isObscured ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            isObscureText: isObscured,
            onChanged: (value) {
              updateErrorMessages(cubit.emailController.text, value);
            },
            onFieldSubmitted: (value){
              if(LoginCubit.get(context).formKey.currentState!.validate()) {
                LoginCubit.get(context).emitLoginState();
              }
            },
          ),
        ],
      ),
    );
  }
}

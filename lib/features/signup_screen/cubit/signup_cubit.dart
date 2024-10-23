
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galsa_trial2/features/signup_screen/cubit/signup_states.dart';
import 'package:galsa_trial2/features/signup_screen/data/models/signup_request_body.dart';
import 'package:galsa_trial2/features/signup_screen/data/repos/signup_repo.dart';

class SignUpCubit extends Cubit<SignUpStates> {

  final SignUpRepo signupRepo;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmationController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  SignUpCubit(this.signupRepo) : super (SignUpInitialState());

  static SignUpCubit get (context) => BlocProvider.of(context);

  void emitSignUpState () async {
    emit(SignUpLoadingState());
    var response = await signupRepo.signUp(
        SignUpRequestBody(
            name: nameController.text,
            email: emailController.text,
            phone: phoneNumberController.text,
            password: passwordController.text,
            passwordConfirmation: passwordConfirmationController.text,
            gender: 0,
        ));
    response.when(
        success: (value){
          emit(SignUpSuccessState(value));
        },
        failure: (value){
          emit(SignUpErrorState());
        },
    );
  }

}
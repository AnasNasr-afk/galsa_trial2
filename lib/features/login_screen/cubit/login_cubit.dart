
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/constants.dart';
import '../../../core/helpers/shared_pref_helper.dart';
import '../data/models/login_request_body.dart';
import '../data/repos/login_repo.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepo loginRepo;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginCubit(this.loginRepo) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void emitLoginState() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      emit(LoginErrorState("Email or password cannot be empty"));
      return;
    }

    emit(LoginLoadingState());

    var response = await loginRepo.login(LoginRequestBody(
      email: emailController.text,
      password: passwordController.text,
    ));

    response.when(
      success: (loginResponse) async {
        await SharedPrefHelper.saveData(Constants.userToken, loginResponse.data.token);
        emit(LoginSuccessState(data: loginResponse));
      },
      failure: (error) {
        emit(LoginErrorState(error));
      },
    );
  }
}

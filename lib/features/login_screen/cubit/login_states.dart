abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState<T> extends LoginStates {
  final T data;
  LoginSuccessState({required this.data});
}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}



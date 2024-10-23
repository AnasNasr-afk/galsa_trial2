abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState<T> extends SignUpStates {
  final T data;

  SignUpSuccessState(this.data);
}

class SignUpErrorState extends SignUpStates {}
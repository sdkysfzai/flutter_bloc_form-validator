abstract class SignInState {}

class SignInStateInitial extends SignInState {}

class SignInStateSuccess extends SignInState {}

class SignInStateLoading extends SignInState {}

class SignInStateError extends SignInState {
  final String error;

  SignInStateError(this.error);
}

abstract class SignInEvent {}

class SignInPressedEvent extends SignInEvent {
  String? email;
  String? pass;
  SignInPressedEvent(this.email, this.pass);
}

class SignInLoadedEvent extends SignInEvent {}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_form_validator/screens/sign_in_screen/bloc/sign_in_state.dart';
import 'package:flutter_bloc_form_validator/screens/sign_in_screen/bloc/sing_in_event.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInStateInitial()) {
    on<SignInPressedEvent>((event, emit) async => {
          if (event.email!.isEmpty)
            {emit(SignInStateError('Email cannot be empty!'))}
          else if (event.pass!.length <= 7)
            {emit(SignInStateError('Password must be greater than 7 words!'))}
          else
            {
              emit(SignInStateLoading()),
            }
        });

    on<SignInLoadedEvent>((event, emit) => emit(SignInStateSuccess()));
  }
}

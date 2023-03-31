import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_form_validator/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:flutter_bloc_form_validator/screens/sign_in_screen/bloc/sign_in_state.dart';
import 'package:flutter_bloc_form_validator/screens/sign_in_screen/bloc/sing_in_event.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInScreenBody();
  }
}

class SignInScreenBody extends StatefulWidget {
  const SignInScreenBody({super.key});

  @override
  State<SignInScreenBody> createState() => _SignInScreenBodyState();
}

class _SignInScreenBodyState extends State<SignInScreenBody> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _passController,
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInStateError) {
                  return Text(
                    state.error,
                    style: const TextStyle(color: Colors.red),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInStateSuccess) {
                  return ElevatedButton(
                      onPressed: () {}, child: const Text('Logged In'));
                } else if (state is SignInStateLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ElevatedButton(
                    onPressed: () async {
                      BlocProvider.of<SignInBloc>(context).add(
                          SignInPressedEvent(_emailController.text.trim(),
                              _passController.text.trim()));
                      await Future.delayed(const Duration(seconds: 3));
                      // ignore: use_build_context_synchronously
                      BlocProvider.of<SignInBloc>(context)
                          .add(SignInLoadedEvent());
                    },
                    child: const Text('Sign In'));
              },
            )
          ],
        ),
      ),
    );
  }
}

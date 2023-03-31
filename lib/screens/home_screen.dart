import 'package:flutter/material.dart';
import 'package:flutter_bloc_form_validator/screens/sign_in_screen/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter bloc form validator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
                },
                child: const Text('Sign in with Email')),
          )
        ],
      ),
    );
  }
}

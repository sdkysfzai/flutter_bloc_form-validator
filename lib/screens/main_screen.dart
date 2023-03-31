import 'package:flutter/material.dart';
import 'package:flutter_bloc_form_validator/screens/sign_in_screen/sign_in_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('You are logged in'),
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
                child: const Text('Go back')),
          )
        ],
      ),
    );
  }
}

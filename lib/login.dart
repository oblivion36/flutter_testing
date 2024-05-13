import 'package:flutter/material.dart';
import 'package:testing/demo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String? email;
    String? password;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                key: const Key('email_field'),
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid email";
                  }
                  if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                      .hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                key: const Key('password_field'),
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                      .hasMatch(value)) {
                    return "Password must contain at least 8 characters including uppercase, lowercase, number, and special character";
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                key: const Key('login_button'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // Perform login logic with _email and _password
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Demo()),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'toto@pop.com',
                border: OutlineInputBorder(),
              ),
              validator: (email) {
                if (email == null) {
                  return null;
                }
                return EmailValidator.validate(email) ? null : 'wrong format';
              },
              onSaved: (newEmail) => setState(() => email = newEmail),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (password) {
                if (password != null && password.length > 8) {
                  return null;
                }
                return 'wrong password format';
              },
              onSaved: (newPassword) => setState(() => password = newPassword),
              obscureText: true,
            ),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: () {
              final isValid = formKey.currentState?.validate();
              if (isValid == true) {
                formKey.currentState?.save();
                Navigator.popAndPushNamed(context, '/forecast');
              }
            }, child: const Text('Validate'))
          ],
        ),
      ),
    );
  }
}

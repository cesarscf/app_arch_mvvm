import 'package:app_arch_mvvm/config/dependencies.dart';
import 'package:app_arch_mvvm/domain/dtos/credentials.dart';
import 'package:app_arch_mvvm/domain/validators/credentials_validator.dart';
import 'package:app_arch_mvvm/ui/auth/login/viewmodels/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final viewModel = injector.get<LoginViewmodel>();

  final validator = CredentialsValidator();
  final credentials = Credentials();

  @override
  void initState() {
    viewModel.loginCommand.addListener(_listenable);
    super.initState();
  }

  void _listenable() {
    if (viewModel.loginCommand.isFailure) {
      final error = viewModel.loginCommand.value as FailureCommand;

      final snackBar = SnackBar(content: Text(error.error.toString()));

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    viewModel.loginCommand.removeListener(_listenable);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (String value) {
                credentials.email = value;
              },
              validator: validator.byField(credentials, 'email'),
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: (String value) {
                credentials.password = value;
              },
              validator: validator.byField(credentials, 'password'),
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ListenableBuilder(
                listenable: viewModel.loginCommand,
                builder: (context, _) {
                  return ElevatedButton(
                    onPressed: viewModel.loginCommand.isRunning
                        ? null
                        : () {
                            if (validator.validate(credentials).isValid) {
                              viewModel.loginCommand.execute(credentials);
                            }
                          },
                    child: Text('Login'),
                  );
                })
          ],
        ),
      ),
    );
  }
}

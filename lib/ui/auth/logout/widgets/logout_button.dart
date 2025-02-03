import 'package:app_arch_mvvm/config/dependencies.dart';
import 'package:app_arch_mvvm/ui/auth/logout/viewmodels/logout_viewmodel.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({super.key});

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  final viewModel = injector.get<LogoutViewmodel>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: viewModel.logoutCommand.execute,
      child: const Text('Logout'),
    );
  }
}

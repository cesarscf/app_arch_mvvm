import 'package:app_arch_mvvm/ui/auth/logout/widgets/logout_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: LogoutButton(),
      ),
    );
  }
}

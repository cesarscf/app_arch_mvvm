import 'package:app_arch_mvvm/data/repositories/auth/auth_repository.dart';
import 'package:app_arch_mvvm/domain/dtos/credentials.dart';
import 'package:app_arch_mvvm/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class LoginViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository;

  LoginViewmodel(this._authRepository);

  late final loginCommand = Command1(_login);

  AsyncResult<LoggedUser> _login(Credentials credentials) async {
    return _authRepository.login(credentials);
  }
}

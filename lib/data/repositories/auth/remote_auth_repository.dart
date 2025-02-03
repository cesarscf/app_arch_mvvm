import 'dart:async';

import 'package:app_arch_mvvm/data/repositories/auth/auth_repository.dart';
import 'package:app_arch_mvvm/data/services/auth/auth_client_http.dart';
import 'package:app_arch_mvvm/data/services/auth/auth_local_storage.dart';
import 'package:app_arch_mvvm/domain/dtos/credentials.dart';
import 'package:app_arch_mvvm/domain/entities/user_entity.dart';
import 'package:app_arch_mvvm/domain/validators/credentials_validator.dart';
import 'package:app_arch_mvvm/utils/validation/lucid_validator_extension.dart';
import 'package:result_dart/result_dart.dart';

class RemoteAuthRepository implements AuthRepository {
  RemoteAuthRepository(this._authLocalStoragel, this._authClientHttp);

  final AuthLocalStorage _authLocalStoragel;
  final AuthClientHttp _authClientHttp;

  final _streamController = StreamController<User>.broadcast();

  @override
  AsyncResult<LoggedUser> getUser() {
    return _authLocalStoragel.getUser();
  }

  @override
  AsyncResult<LoggedUser> login(Credentials credentials) {
    final validator = CredentialsValidator();

    return validator //
        .validateResult(credentials)
        .flatMap(_authClientHttp.login)
        .flatMap(_authLocalStoragel.saveUser)
        .onSuccess(_streamController.add);
  }

  @override
  AsyncResult<Unit> logout() {
    return _authLocalStoragel //
        .removeUser()
        .onSuccess(
          (_) => _streamController.add(const NotLoggedUser()),
        );
  }

  @override
  Stream<User> userObserver() {
    return _streamController.stream;
  }

  @override
  void dispose() {
    _streamController.close();
  }
}

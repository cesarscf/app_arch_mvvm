import 'package:app_arch_mvvm/domain/dtos/credentials.dart';
import 'package:app_arch_mvvm/domain/entities/user_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class AuthRepository {
  AsyncResult<LoggedUser> login(Credentials credentials);
  AsyncResult<Unit> logout();
  AsyncResult<LoggedUser> getUser();
  Stream<User> userObserver();

  void dispose();
}

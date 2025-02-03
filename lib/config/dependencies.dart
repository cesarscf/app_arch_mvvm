import 'package:app_arch_mvvm/data/repositories/auth/auth_repository.dart';
import 'package:app_arch_mvvm/data/repositories/auth/remote_auth_repository.dart';
import 'package:app_arch_mvvm/data/services/auth/auth_client_http.dart';
import 'package:app_arch_mvvm/data/services/auth/auth_local_storage.dart';
import 'package:app_arch_mvvm/data/services/client_http.dart';
import 'package:app_arch_mvvm/data/services/local_storage.dart';
import 'package:app_arch_mvvm/main_viewmodel.dart';
import 'package:app_arch_mvvm/ui/auth/login/viewmodels/login_viewmodel.dart';
import 'package:app_arch_mvvm/ui/auth/logout/viewmodels/logout_viewmodel.dart';
import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';

final injector = AutoInjector();

void setupDependencies() {
  injector.addInstance(Dio());

  injector.addSingleton(ClientHttp.new);
  injector.addSingleton(LocalStorage.new);

  injector.addSingleton(AuthClientHttp.new);
  injector.addSingleton(AuthLocalStorage.new);

  injector.addSingleton<AuthRepository>(RemoteAuthRepository.new);

  injector.addSingleton(MainViewmodel.new);
  injector.addSingleton(LoginViewmodel.new);
  injector.addSingleton(LogoutViewmodel.new);
}

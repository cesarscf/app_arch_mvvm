import 'dart:async';

import 'package:app_arch_mvvm/data/repositories/auth/auth_repository.dart';
import 'package:app_arch_mvvm/domain/entities/user_entity.dart';
import 'package:flutter/foundation.dart';

class MainViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository;

  User _user = NotLoggedUser();
  User get user => _user;

  late final StreamSubscription _userSubscription;

  MainViewmodel(this._authRepository) {
    _authRepository.userObserver().listen(
      (user) {
        _user = user;
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }
}

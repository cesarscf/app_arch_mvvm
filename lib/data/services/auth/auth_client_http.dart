import 'package:app_arch_mvvm/data/services/client_http.dart';
import 'package:app_arch_mvvm/domain/dtos/credentials.dart';
import 'package:app_arch_mvvm/domain/entities/user_entity.dart';
import 'package:result_dart/result_dart.dart';

class AuthClientHttp {
  final ClientHttp _clientHttp;

  AuthClientHttp(this._clientHttp);

  AsyncResult<LoggedUser> login(Credentials credentials) async {
    final response = await _clientHttp.post('/login', {
      'email': credentials.email,
      'password': credentials.password,
    });

    return response.map((response) => LoggedUser.fromJson(response.data));

    // await Future.delayed(const Duration(seconds: 2));
    // return const Success(
    //   LoggedUser(
    //     id: 1,
    //     name: 'Cesar Silva',
    //     email: 'cesar@gmail.com',
    //     token:
    //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMjM0NTYiLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3MDA3Njg4MDB9.9z8G7qXsJjF5h1qUOeLJr3H7Z8xZgP6w4VfYkI8xYZU',
    //     refreshToken:
    //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiIxMjM0NTYiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTcwMDc2ODgwMH0.Z0kzF5yGvYXx7LJ8hWZyQ6vT1B9oNfM2QrA3dD2LhJc',
    //   ),
    // );

    // return Failure(
    //   Exception('Login error'),
    // );
  }
}

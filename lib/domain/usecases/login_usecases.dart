import 'package:senae_app/data/repository/auth_repository.dart';

class LoginUseCases {
  final AuthRepository _authRepository;
  LoginUseCases(this._authRepository);

  /*  <Future<void>> login({
    required String email,
    required String password,
  }) async =>
      _authRepository.login(
        email: email,
        password: password,
      ); */
}

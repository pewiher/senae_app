import 'package:senae_app/data/repository/auth_repository.dart';
import 'package:senae_app/domain/models/auth/auth_user.dart';
import 'package:senae_app/domain/models/data_result.dart';

class LoginUseCases {
  final AuthRepository _authRepository;
  LoginUseCases(this._authRepository);

  Future<DataResult<AuthUser>> login({
    required String email,
    required String password,
  }) async =>
      await _authRepository.login(
        email: email,
        password: password,
      );

  Future<DataResult<bool>> validate({
    required String code,
  }) async =>
      await _authRepository.validarCode(
        code: code,
      );
}

enum AuthenticationStatus { unknown, authenticated, unauthenticated, failed }

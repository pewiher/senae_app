import 'dart:async';

import 'package:senae_app/domain/models/auth/auth_user.dart';
import 'package:senae_app/domain/models/data_result.dart';

abstract class AuthRepository {
  Future<DataResult<AuthUser>> login({
    required String email,
    required String password,
  });

  Future<DataResult<bool>> validarCode({required String code});

  Future<void> logOut();
}

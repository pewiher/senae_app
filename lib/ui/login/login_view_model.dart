import 'package:flutter/material.dart';
import 'package:senae_app/domain/models/auth/auth_user.dart';
import 'package:senae_app/domain/models/data_result.dart';
import 'package:senae_app/domain/usecases/login_usecases.dart';

class LoginViewModel with ChangeNotifier {
  final LoginUseCases _loginUseCases;
  LoginViewModel(this._loginUseCases);
  late bool _obscureText;
  late DataResult<AuthUser> _resultLogin;
  bool get obscureText => _obscureText;
  DataResult<AuthUser> get resultLogin => _resultLogin;
  void init() {
    _obscureText = true;
    _resultLogin = DataResult.initial();
  }

  void changeObscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  void _changeLoginResult(DataResult<AuthUser> value) {
    _resultLogin = value;
    notifyListeners();
  }

  Future<DataResult<AuthUser>> login({
    required String email,
    required String password,
  }) async {
    _changeLoginResult(DataResult.loading());
    final result = await _loginUseCases.login(email: email, password: password);
    _changeLoginResult(result);
    return result;
  }

  Future<DataResult<bool>> verificateCode({
    required String code,
  }) async {
    final result = await _loginUseCases.validate(code: code);
    return result;
  }
}

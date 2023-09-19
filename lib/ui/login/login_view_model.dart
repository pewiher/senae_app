import 'package:flutter/material.dart';
import 'package:senae_app/domain/usecases/login_usecases.dart';

class LoginViewModel with ChangeNotifier {
  final LoginUseCases _loginUseCases;
  LoginViewModel(this._loginUseCases);
  init() {}
}

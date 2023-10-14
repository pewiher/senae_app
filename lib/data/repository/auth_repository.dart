import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, failed }

abstract class AuthRepository {
  final _controller = StreamController<AuthenticationStatus>();
  String full_name = "";
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    assert(email != null);
    assert(password != null);
    String body = "";
    final prefs = await SharedPreferences.getInstance();
    try {
      //body = await http.attemptLogIn(email, password);
      if (body != "") {
        Map<String, dynamic> user = jsonDecode(body);
        prefs.setString("refresh", user['refresh']);
        prefs.setString("access", user['access']);
        prefs.setString("full_name", user['full_name']);
        prefs.setInt("user_id", user['user_id']);
        prefs.setString("lineaNegocio", user['lineaNegocio']);

        full_name = prefs.getString("full_name")!;
        //loadViews(user['token']);

        _controller.add(AuthenticationStatus.authenticated);
      }
    } on Exception catch (e) {
      _controller.add(AuthenticationStatus.failed);
      // print(e);
    }
  }

  Future<void> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void failed() {
    _controller.add(AuthenticationStatus.unknown);
  }

  void dispose() => _controller.close();
}

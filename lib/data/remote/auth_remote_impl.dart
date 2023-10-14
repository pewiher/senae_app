import 'package:senae_app/data/repository/auth_repository.dart';

abstract class AuthRemoteImpl implements AuthRepository {
  @override
  Future<bool> login({
    required Comparable<String> email,
    required String password,
  }) async {
    try {
      return true;
    } catch (e) {
      return false;
    }
  }
}

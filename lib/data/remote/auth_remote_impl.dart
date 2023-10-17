import 'dart:math';
import 'package:bot_toast/bot_toast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/hotmail.dart';
import 'package:random_string/random_string.dart';
import 'package:senae_app/data/const/constants.dart';
import 'package:senae_app/data/repository/auth_repository.dart';
import 'package:senae_app/domain/models/auth/auth_user.dart';
import 'package:senae_app/domain/models/auth/auth_userError.dart';
import 'package:senae_app/domain/models/data_result.dart';
import 'package:senae_app/domain/models/senae_client.dart';
import 'package:senae_app/domain/models/senae_exception.dart';
import 'package:senae_app/domain/usecases/login_usecases.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRemoteImpl implements AuthRepository {
  final SenaeClient _client;
  AuthRemoteImpl(this._client);

  @override
  Future<DataResult<AuthUser>> login({
    required String email,
    required String password,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = {
        "email": email,
        "password": password,
      };

      final result = await _client.post('/auth/sign_in', data: data);

      if (result.statusCode == 200) {
        final code = randomNumeric(4);
        prefs.setString("CODE", code.toString());
        prefs.setString("email", email.toString());
        prefs.setString(
            "access", AuthUser.fromJson(result.data["data"]).access);
        prefs.setString(
            "refresh", AuthUser.fromJson(result.data["data"]).refresh);
        prefs.setString(
            "full_name", AuthUser.fromJson(result.data["data"]).fullName);
        prefs.setString("lineaNegocio",
            AuthUser.fromJson(result.data["data"]).lineaNegocio);

        //Funcion para enviar el correo
        _sendEmail(email, code);
      }
      return DataResult.success(AuthUser.fromJson(result.data["data"]));
    } catch (e) {
      //QUEMADO
      // final prefs = await SharedPreferences.getInstance();
      //final code = _generateCode(4, 4);

      /* prefs.setString("LineaNegocio", 'IMP');
      prefs.setString("full_name", 'Sayda');

      final code = randomNumeric(4);
      prefs.setString("CODE", code.toString());
      _sendEmail(email, code);
      return DataResult.success(
        AuthUser(
          refresh:
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2OTg1Mzk2NDYsImlhdCI6MTY5NzI0MzY0Nn0.Z4ygoPGA9wQDXLgOnk41piM3w-AanzPzvRJ1ei7znzs',
          access:
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJyb2xlIjpbXSwiZXhwIjoxNjk3MjQ0MjQ2LCJpYXQiOjE2OTcyNDM2NDZ9.u_ylZlgmM119R_ysf1ihtW9fC_x7SXl7E0ZxVwk9E9U',
          fullName: 'Sayda',
          userId: 1,
          lineaNegocio: 'IMP',
        ),
      ); */

      return DataResult.exception(
          SenaeException.fromException(e, StackTrace.current));
    }
  }

  @override
  Future<void> logOut() async {
    // TODO: implement logOut
    // throw UnimplementedError();
  }

  @override
  Future<DataResult<bool>> validarCode({required String code}) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final codeSave = prefs.getString("CODE");
      if (codeSave != code) throw Exception('Codigo invalido');

      return DataResult.success(true);
    } catch (e) {
      return DataResult.exception(
          SenaeException.fromException(e, StackTrace.current));
    }
  }

  _sendEmail(String email, String values) async {
    String username = 'farbot@farletza.com.ec';
    String password = 'Farl3tzaBot@022';

    final smtpServer = hotmail(username, password);

    final message = Message()
      ..from = Address(username, 'NOTIFICACION')
      ..recipients.add(email)
      ..subject = 'Codigo de Verificacion AppSenae '
      //..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>Test</h1>\n<p>Hey! Su codigo de verificacion para Iniciar Sesion es\n  $values</p>";

    try {
      final sendReport = await send(message, smtpServer);
      //BotToast.showText(text: 'Message sent: $sendReport');
      BotToast.showText(text: 'Message sent');
    } on MailerException catch (e) {
      BotToast.showText(text: 'Message not sent.');
      for (var p in e.problems) {
        BotToast.showText(text: 'Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}

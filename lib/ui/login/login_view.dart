import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senae_app/domain/usecases/login_usecases.dart';
import 'package:senae_app/ui/login/login_view_model.dart';
import 'package:senae_app/ui/widgets/input_text.dart';
import 'package:senae_app/ui/widgets/primary_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(
        context.read<LoginUseCases>(),
      )..init(),
      child: const Scaffold(body: _LoginWidget()),
    );
  }
}

class _LoginWidget extends StatelessWidget {
  const _LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Column(
        children: <Widget>[
          const Align(
            alignment: Alignment(0.0, 0.497),
            child: SizedBox(
              width: 156.0,
              height: 19.0,
              child: Stack(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      SizedBox.expand(
                          child: Text(
                        'Recuperar contraseña',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Color(0xff0091ff),
                          decoration: TextDecoration.underline,
                          height: 1.25,
                        ),
                        textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, -0.218),
            child: SizedBox(
              width: 210.0,
              height: 42.0,
              child: Text(
                'Ingrese sus credenciales\npara empezar a transmitir.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 18,
                  color: const Color(0xff707070),
                  height: 1.1111111111111112,
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          InputText(
            title: 'Usuario',
          ),
          InputText(
            title: 'contraseña',
          ),
          PrimaryButton(onPressed: () {}, text: 'Iniciar sesión'),
        ],
      ),
    );
  }
}

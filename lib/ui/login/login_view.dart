import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/hotmail.dart';
import 'package:provider/provider.dart';
import 'package:senae_app/data/repository/theme_preferences.dart';
import 'package:senae_app/domain/models/auth/auth_user.dart';
import 'package:senae_app/domain/models/data_result.dart';
import 'package:senae_app/domain/usecases/login_usecases.dart';
import 'package:senae_app/ui/home/home.dart';
import 'package:senae_app/ui/login/login_view_model.dart';
import 'package:senae_app/ui/widgets/CustomDialog.dart';
import 'package:senae_app/ui/widgets/UsersBloqueado.dart';

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

class _LoginWidget extends StatefulWidget {
  const _LoginWidget({Key? key}) : super(key: key);

  @override
  State<_LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<_LoginWidget> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    //double screenheight = MediaQuery.of(context).size.height;

    final obscureText = context.watch<LoginViewModel>().obscureText;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 252, 252),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/svg/Farletza.svg',
                    height: MediaQuery.of(context).size.width * 0.26,
                    width: MediaQuery.of(context).size.width * 0.26,
                  ),
                ),
                const SizedBox(height: 50),
                const Align(
                  alignment: Alignment(0.0, -0.296),
                  child: SizedBox(
                    width: 130.0,
                    height: 24.0,
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        color: Color(0xff004172),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment(0.0, -0.221),
                  child: SizedBox(
                    width: 210.0,
                    height: 44.0,
                    child: Text(
                      'Ingrese sus credenciales\npara empezar a transmitir.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Color(0xff707070),
                        height: 1.1111111111111112,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment(-0.636, -0.064),
                  child: SizedBox(
                    width: 60.0,
                    height: 21.0,
                    child: Text(
                      'Usuario:',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Color(0xff004172),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  ),
                ),
                SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: Stack(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          TextFormField(
                            controller: _emailController,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff004172),
                            ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xff004172)),
                              ),
                              hintText: 'Ingrese su correo',
                              hintStyle: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                color: Color(0xffa1b2c3),
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment(-0.595, 0.128),
                  child: SizedBox(
                    width: 87.0,
                    height: 21.0,
                    child: Text(
                      'Contraseña:',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Color(0xff004172),
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    ),
                  ),
                ),
                SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: //Stack(
                      // children: <Widget>[
                      TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff004172),
                    ),
                    obscureText: obscureText,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Color(0xff004172)),
                        ),
                        hintText: 'Ingrese su contraseña',
                        hintStyle: const TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: Color(0xffa1b2c3),
                          fontStyle: FontStyle.italic,
                        ),
                        suffix: IconButton(
                          icon: const Icon(
                            Icons.remove_red_eye_outlined,
                            color: Color(0xff004172),
                          ),
                          onPressed: () => context
                              .read<LoginViewModel>()
                              .changeObscureText(!obscureText),
                        )),
                  ),
                  // ],
                  //),
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: const Alignment(0.007, 0.404),
                  child: SizedBox(
                    width: 154.0,
                    height: 41.0,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff004172),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        _LoginUserInformationButton(
                          onPressed: () => _loginAction(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment(0.0, 0.496),
                  child: SizedBox(
                    width: 156.0,
                    height: 21.0,
                    child: Stack(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            SizedBox.expand(
                                child: Text(
                              'Recuperar contraseña',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0xff0091ff),
                                decoration: TextDecoration.underline,
                                height: 1.25,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: const Alignment(0.004, 0.646),
                  child: SizedBox(
                    width: 215.0,
                    height: 50.0,
                    child: Stack(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Switch(
                                value: true,
                                onChanged: (value) {
                                  String newTheme = value
                                      ? ThemePreference.DARK
                                      : ThemePreference.LIGHT;
                                }),
                            const Text(
                              'Activar modo oscuro',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                color: Color(0xff707070),
                              ),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  child: Text(
                    'Copyright © Farletza 2023',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      color: Color(0xff707070),
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _loginAction() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      return;
    }
    final result = await context.read<LoginViewModel>().login(
          email: _emailController.text,
          password: _passwordController.text,
        );
    if (result.state == ResultState.exception) return;
    _goToDialog();
  }

  _goToDialog() {
    showDialog(
      context: context,
      builder: (context) => const CustomDialog(),
    );
  }
}

class _LoginUserInformationButton extends StatelessWidget {
  const _LoginUserInformationButton({Key? key, required this.onPressed})
      : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Selector<LoginViewModel, DataResult<AuthUser>>(
      builder: (_, dataResult, child) {
        switch (dataResult.state) {
          case ResultState.exception:
          case ResultState.initial:
            if (dataResult.state == ResultState.exception) {
              BotToast.showText(text: "Error");
            }

            return child!;
          case ResultState.success:
            return child!;
          case ResultState.loading:
            //Modificar  cargando
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
        }
      },
      selector: (_, vm) => vm.resultLogin,
      child: MaterialButton(
        minWidth: double.infinity,
        height: MediaQuery.of(context).size.height * 0.26,
        onPressed: () => onPressed(),
        child: const Text(
          'INGRESAR',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            color: Color(0xffffffff),
          ),
          textAlign: TextAlign.center,
          softWrap: false,
        ),
      ),
    );
  }
}

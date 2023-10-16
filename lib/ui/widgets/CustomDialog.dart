import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:senae_app/domain/models/data_result.dart';
import 'package:senae_app/ui/home/home.dart';
import 'package:senae_app/ui/login/login_view_model.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: Colors.black),
      ),
    );
    return Container(
      margin: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(
              top: 18.0,
            ),
            margin: const EdgeInsets.only(top: 20.0, right: 12.0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text('Validación',
                          style: TextStyle(
                              fontSize: 18.0, color: Color(0xff004172))),
                    )
                  ], //
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Text(
                          'Ingrese el código de validación,\nque hemos enviado a su correo.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13.0, color: Color(0xff004172))),
                    )
                  ], //
                ),
                const SizedBox(height: 20),
                Pinput(
                  defaultPinTheme: defaultPinTheme,
                  onCompleted: (value) {
                    _Validate(context, value);
                  },
                ),
                const SizedBox(height: 20),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 250,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Tu código de verificación tiene una validez de 5 minutos, si no te ha llegado el código de verificación, puedes volver a reenviarlo.',
                            textAlign: TextAlign.center,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13.0,
                              color: Color(0xff004172),
                            ),
                          ),
                        ),
                      )
                    ], //
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.close, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _Validate(BuildContext context, String value) async {
    final result =
        await context.read<LoginViewModel>().verificateCode(code: value);
    if (result.state == ResultState.exception) {
      BotToast.showText(text: "Codigo invalido");
      return;
    }
    Navigator.pushNamed(context, '/home');
  }
}

import 'package:flutter/material.dart';

import '../login/verification_code.dart';

class CustomDialog extends StatelessWidget {
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
    return Container(
      margin: const EdgeInsets.only(
          left: 0.0, right: 0.0, top: 150.0, bottom: 150.0),
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
            child: const Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text('Validación',
                          style: TextStyle(
                              fontSize: 13.0, color: Color(0xff004172))),
                    )
                  ], //
                ),
                SizedBox(height: 20),
                Row(
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
                SizedBox(height: 20),
                //AQUI VA EL CODIGO ENVIADO AL EMAIL
                VerificationCodeScreen(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Text(
                          'Tu código de verificación tiene una\n validez de 5 minutos, si no te ha llegado\n el código de verificación, puedes volver a\n reenviarlo.\n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13.0, color: Color(0xff004172))),
                    )
                  ], //
                ),
              ],
            ),
          ),
          Positioned(
            right: 0.0,
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
}

void _showSnackBar(String pin, BuildContext context) {
  final snackBar = SnackBar(
    duration: const Duration(seconds: 5),
    content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        )),
    backgroundColor: Colors.greenAccent,
  );
  // Scaffold.of(context).showSnackBar(snackBar);
}

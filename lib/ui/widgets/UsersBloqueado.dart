import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UsersBloqueado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogBox(),
    );
  }

  Widget dialogBox() {
    return Container(
      width: 250,
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  /*  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      5.00,
                    ),
                  ), */
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Positioned(
                      right: 0.0,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.of(context).pop();
                        },
                        child: const Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            child: Icon(Icons.close, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        'assets/svg/candado_rojo.svg',
                        height: 70,
                        width: 70,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),

                      /* padding: getPadding(
                        left: 18,
                        top: 14,
                        right: 18,
                      ), */
                      child: Text(
                        "Usuario Bloqueado",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromARGB(255, 214, 6, 6),
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      child: const Text(
                        "Usted ha excedido el máximo \nde intentos permitidos.",
                        maxLines: null,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 15,
                          color: Color(0xff707070),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Text(
                        "Para desbloquear su usuario debe\n contactar al eqipo de soporte \ntécnico. ",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          color: Color(0xff707070),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: 'Roboto',
                              fontSize: 15,
                              color: Color(0xff004172),
                              fontWeight: FontWeight.w700,
                            ),
                            text: "Contactar a soporte",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

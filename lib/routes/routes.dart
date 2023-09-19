import 'package:flutter/material.dart';
import 'package:senae_app/ui/login/login_view.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(settings) {
    switch (settings.name) {
      case '/':
        return _goToRoute(const LoginView(), const RouteSettings(name: "/login-view"));

      default:
        return MaterialPageRoute(builder: (context) => const ErrorView());
    }
  }

  MaterialPageRoute<dynamic> _goToRoute(Widget widget, [RouteSettings? settings]) {
    return MaterialPageRoute(settings: settings, builder: (context) => widget);
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        //popAllAndPush(context, '/overview');
        return Future.value(false);
      },
      child: const Scaffold(
        body: Center(child: Text('esta vista no existe')),
      ),
    );
  }
}

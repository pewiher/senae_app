import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senae_app/di/dependencies.dart';
import 'package:senae_app/routes/routes.dart';
import 'package:senae_app/ui/network_connectivity_bloc/network_connectivity_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: buildRepositories(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NetworkConnectivityBloc(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Reinspet',
          builder: BotToastInit(),
          //theme: ThemesToe.getThemeDefault(),
          initialRoute: '/',
          onGenerateRoute: AppRouter().onGenerateRoute,
        ),
      ),
    );
  }
}

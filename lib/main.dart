import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:senae_app/data/repository/theme_preferences.dart';
import 'package:senae_app/di/dependencies.dart';
import 'package:senae_app/domain/usecases/login_usecases.dart';
import 'package:senae_app/domain/usecases/theme.dart';
import 'package:senae_app/routes/routes.dart';
import 'package:senae_app/ui/login/login_view.dart';
import 'package:senae_app/ui/login/login_view_model.dart';
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
          ),
          // BlocProvider(
          //   create: (context) => LoginViewModel(context.read<LoginUseCases>(),),
          // )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'APPSENAE',
          builder: BotToastInit(),
          //theme: ThemesToe.getThemeDefault(),
          initialRoute: '/',
          onGenerateRoute: AppRouter().onGenerateRoute,
          theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.lightBlue[800],
          ),
        ),
      ),
    );
  }
}

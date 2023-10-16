import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senae_app/data/remote/auth_remote_impl.dart';
import 'package:senae_app/data/repository/auth_repository.dart';
import 'package:senae_app/domain/models/senae_client.dart';
import 'package:senae_app/domain/usecases/login_usecases.dart';

//Routes
List<RepositoryProvider> buildRepositories() {
  return [
    //Repositories
    RepositoryProvider<SenaeClient>(
      create: (context) => SenaeClient(),
    ),
    RepositoryProvider<AuthRepository>(
      create: (_) => AuthRemoteImpl(SenaeClient()),
    ),

    //UseCases
    RepositoryProvider<LoginUseCases>(
      create: (context) => LoginUseCases(
        context.read<AuthRepository>(),
      ),
    ),
  ];
}

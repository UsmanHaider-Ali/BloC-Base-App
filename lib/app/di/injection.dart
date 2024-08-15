import 'package:bloc_base_app/data/repositories/auth/auth_repository.dart';
import 'package:bloc_base_app/domain/blocs/login/login_bloc.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthRepository());
  locator.registerFactory(() => LoginBloc(authRepository: locator<AuthRepository>()));
}

import 'package:get_it/get_it.dart';

import 'applications/auth/authentication_cubit.dart';
import 'domain/auth/authentication_client.dart';
import 'domain/auth/authentication_service.dart';

GetIt getIt = GetIt.instance;
class IoC {
  void initServices() {
    getIt.registerSingleton(
      AuthenticationService(
        authenticationClient: AuthenticationClient(),
      ),
    );}
  IoC() {
    initServices();
    getIt.registerSingleton(
      AuthenticationCubit(
        getIt(),
      ),
    );}
}



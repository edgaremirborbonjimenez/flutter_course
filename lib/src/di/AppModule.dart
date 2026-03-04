import 'package:e_commerce/src/data/dataSource/local/SharedPref.dart';
import 'package:e_commerce/src/data/repository/AuthRepositoryImpl.dart';
import 'package:e_commerce/src/data/dataSource/remote/services/AuthService.dart';
import 'package:e_commerce/src/domain/repository/AuthRepository.dart';
import 'package:e_commerce/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:e_commerce/src/domain/useCase/auth/GetUserSessionUseCase.dart';
import 'package:e_commerce/src/domain/useCase/auth/LoginUseCase.dart';
import 'package:e_commerce/src/domain/useCase/auth/LogoutUseCase.dart';
import 'package:e_commerce/src/domain/useCase/auth/RegisterUseCase.dart';
import 'package:e_commerce/src/domain/useCase/auth/SaveUserSessionUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  AuthService get authService => AuthService();

  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authService, sharedPref);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    loginUseCase: LoginUseCase(authRepository),
    registerUseCase: RegisterUseCase(authRepository),
    saveUserSesionUseCase: SaveUserSesionUseCase(authRepository),
    getUserSesionUseCase: GetUserSesionUseCase(authRepository),
    logout: LogoutUseCase(authRepository),
  );
}

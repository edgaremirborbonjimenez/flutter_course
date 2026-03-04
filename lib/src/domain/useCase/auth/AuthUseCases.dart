import 'package:e_commerce/src/domain/useCase/auth/GetUserSessionUseCase.dart';
import 'package:e_commerce/src/domain/useCase/auth/LoginUseCase.dart';
import 'package:e_commerce/src/domain/useCase/auth/LogoutUseCase.dart';
import 'package:e_commerce/src/domain/useCase/auth/RegisterUseCase.dart';
import 'package:e_commerce/src/domain/useCase/auth/SaveUserSessionUseCase.dart';
import 'package:injectable/injectable.dart';

class AuthUseCases {
  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;
  SaveUserSesionUseCase saveUserSesionUseCase;
  GetUserSesionUseCase getUserSesionUseCase;
  LogoutUseCase logout;

  AuthUseCases({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.saveUserSesionUseCase,
    required this.getUserSesionUseCase,
    required this.logout,
  });
}

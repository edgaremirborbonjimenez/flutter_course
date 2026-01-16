import 'package:e_commerce/src/domain/useCase/auth/LoginUseCase.dart';
import 'package:e_commerce/src/domain/useCase/auth/RegisterUseCase.dart';
import 'package:injectable/injectable.dart';

class AuthUseCases {
  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;

  AuthUseCases({required this.loginUseCase, required this.registerUseCase});
}

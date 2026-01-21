import 'package:e_commerce/src/data/repository/AuthRepositoryImpl.dart';
import 'package:e_commerce/src/domain/repository/AuthRepository.dart';
import 'package:injectable/injectable.dart';

class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  dynamic run(String email, String password) =>
      authRepository.login(email, password);
}

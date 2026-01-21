import 'package:e_commerce/src/domain/models/AuthResponse.dart';
import 'package:e_commerce/src/domain/repository/AuthRepository.dart';

class SaveUserSesionUseCase {
  AuthRepository authRepository;
  SaveUserSesionUseCase(this.authRepository);

  run(AuthResponse authResponse) =>
      authRepository.saveUserSession(authResponse);
}

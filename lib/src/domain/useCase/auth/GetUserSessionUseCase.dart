import 'package:e_commerce/src/domain/repository/AuthRepository.dart';

class GetUserSesionUseCase {
  AuthRepository authRepository;
  GetUserSesionUseCase(this.authRepository);

  run() => authRepository.getUserSession();
}

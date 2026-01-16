import 'package:e_commerce/src/domain/models/User.dart';
import 'package:e_commerce/src/domain/repository/AuthRepository.dart';

class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  dynamic run(User user) => authRepository.register(user);
}

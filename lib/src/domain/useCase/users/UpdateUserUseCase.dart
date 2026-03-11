import 'dart:io';

import 'package:e_commerce/src/domain/models/User.dart';
import 'package:e_commerce/src/domain/repository/UserRepository.dart';

class UpdateUserUserCase {
  UserRepository userRepository;

  UpdateUserUserCase(this.userRepository);

  run(int id, User user, File? file) =>
      userRepository.update(id, user, file);
}

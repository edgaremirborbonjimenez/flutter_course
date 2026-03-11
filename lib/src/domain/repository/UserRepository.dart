import 'dart:io';

import 'package:e_commerce/src/domain/models/User.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';

abstract class UserRepository {
  Future<Resource<User>> update(int id, User user, File? image);
}

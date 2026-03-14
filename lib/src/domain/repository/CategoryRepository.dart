import 'dart:io';

import 'package:e_commerce/src/domain/models/Category.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';

abstract class CategoryRepository {
  Future<Resource<Category>> create(Category category, File? file);
}

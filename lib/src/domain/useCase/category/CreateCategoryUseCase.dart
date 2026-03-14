import 'dart:io';

import 'package:e_commerce/src/domain/models/Category.dart';
import 'package:e_commerce/src/domain/repository/CategoryRepository.dart';

class CreateCategoryUseCase {
  CategoryRepository categoryRepository;

  CreateCategoryUseCase(this.categoryRepository);

  // run(Category category, File file) =>
  //     categoryRepository.create(category, file);
    run(Category category, File? file) =>
      categoryRepository.create(category, file);
}

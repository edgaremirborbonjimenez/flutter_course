import 'dart:io';

import 'package:e_commerce/src/data/dataSource/remote/services/CategoryService.dart';
import 'package:e_commerce/src/domain/models/Category.dart';
import 'package:e_commerce/src/domain/repository/CategoryRepository.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';

class CategoryRepositoryImp implements CategoryRepository {
  CategoryService categoryService;

  CategoryRepositoryImp(this.categoryService);
  @override
  Future<Resource<Category>> create(Category category, File? file) {
    return this.categoryService.create(category, file);
  }
}

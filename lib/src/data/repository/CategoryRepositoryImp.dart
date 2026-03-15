import 'dart:convert';
import 'dart:io';

import 'package:e_commerce/src/data/api/ApiConfig.dart';
import 'package:e_commerce/src/data/dataSource/local/SharedPref.dart';
import 'package:e_commerce/src/data/dataSource/remote/services/CategoryService.dart';
import 'package:e_commerce/src/domain/models/AuthResponse.dart';
import 'package:e_commerce/src/domain/models/Category.dart';
import 'package:e_commerce/src/domain/repository/CategoryRepository.dart';
import 'package:e_commerce/src/domain/utils/ListToString.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;

class CategoryRepositoryImp implements CategoryRepository {
  CategoryService categoryService;

  CategoryRepositoryImp(this.categoryService);
  @override
  Future<Resource<Category>> create(Category category, File? file) {
    return this.categoryService.create(category, file);
  }

  @override
  Future<Resource<List<Category>>> getCategories() {
    return categoryService.getCategories();
  }
}

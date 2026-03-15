import 'package:e_commerce/src/domain/useCase/category/CreateCategoryUseCase.dart';
import 'package:e_commerce/src/domain/useCase/category/GetCategoriesUseCase.dart';

class CategoryUseCases {
  CreateCategoryUseCase create;
  GetCategoriesUseCase getCategories;

  CategoryUseCases({required this.create, required this.getCategories});
}

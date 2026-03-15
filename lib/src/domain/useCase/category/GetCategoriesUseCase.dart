import 'package:e_commerce/src/domain/repository/CategoryRepository.dart';

class GetCategoriesUseCase{
  CategoryRepository categoryRepository;

  GetCategoriesUseCase(this.categoryRepository);

  run() => categoryRepository.getCategories();
}
import 'package:e_commerce/src/data/dataSource/local/SharedPref.dart';
import 'package:e_commerce/src/data/dataSource/remote/services/CategoryService.dart';
import 'package:e_commerce/src/data/dataSource/remote/services/UserService.dart';
import 'package:e_commerce/src/data/repository/AuthRepositoryImpl.dart';
import 'package:e_commerce/src/data/dataSource/remote/services/AuthService.dart';
import 'package:e_commerce/src/data/repository/CategoryRepositoryImp.dart';
import 'package:e_commerce/src/data/repository/UserRepositoryImpl.dart';
import 'package:e_commerce/src/domain/repository/AuthRepository.dart';
import 'package:e_commerce/src/domain/repository/CategoryRepository.dart';
import 'package:e_commerce/src/domain/repository/UserRepository.dart';
import 'package:e_commerce/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:e_commerce/src/domain/useCase/auth/GetUserSessionUseCase.dart';
import 'package:e_commerce/src/domain/useCase/auth/LoginUseCase.dart';
import 'package:e_commerce/src/domain/useCase/auth/LogoutUseCase.dart';
import 'package:e_commerce/src/domain/useCase/auth/RegisterUseCase.dart';
import 'package:e_commerce/src/domain/useCase/auth/SaveUserSessionUseCase.dart';
import 'package:e_commerce/src/domain/useCase/category/CategoryUseCases.dart';
import 'package:e_commerce/src/domain/useCase/category/CreateCategoryUseCase.dart';
import 'package:e_commerce/src/domain/useCase/category/GetCategoriesUseCase.dart';
import 'package:e_commerce/src/domain/useCase/users/UpdateUserUseCase.dart';
import 'package:e_commerce/src/domain/useCase/users/UsersUseCases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  AuthService get authService => AuthService();

  @injectable
  UserService get userService => UserService(sharedPref);

  @injectable
  CategoryService get categoryService => CategoryService(sharedPref);

  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authService, sharedPref);

  @injectable
  UserRepository get userRepository => UserRepositoryImpl(userService);

  @injectable
  CategoryRepository get categoryRepository =>
      CategoryRepositoryImp(categoryService);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    loginUseCase: LoginUseCase(authRepository),
    registerUseCase: RegisterUseCase(authRepository),
    saveUserSesionUseCase: SaveUserSesionUseCase(authRepository),
    getUserSesionUseCase: GetUserSesionUseCase(authRepository),
    logout: LogoutUseCase(authRepository),
  );

  @injectable
  UsersUseCases get usersUseCases =>
      UsersUseCases(updateUser: UpdateUserUserCase(userRepository));

  @injectable
  CategoryUseCases get categoryUseCases => CategoryUseCases(
    create: CreateCategoryUseCase(categoryRepository),
    getCategories: GetCategoriesUseCase(categoryRepository),
  );
}

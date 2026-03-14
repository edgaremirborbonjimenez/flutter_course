// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'src/data/dataSource/local/SharedPref.dart' as _i344;
import 'src/data/dataSource/remote/services/AuthService.dart' as _i204;
import 'src/data/dataSource/remote/services/CategoryService.dart' as _i978;
import 'src/data/dataSource/remote/services/UserService.dart' as _i565;
import 'src/di/AppModule.dart' as _i199;
import 'src/domain/repository/AuthRepository.dart' as _i1048;
import 'src/domain/repository/CategoryRepository.dart' as _i737;
import 'src/domain/repository/UserRepository.dart' as _i149;
import 'src/domain/useCase/auth/AuthUseCases.dart' as _i1030;
import 'src/domain/useCase/category/CategoryUseCases.dart' as _i1029;
import 'src/domain/useCase/users/UsersUseCases.dart' as _i842;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i344.SharedPref>(() => appModule.sharedPref);
    gh.factory<_i204.AuthService>(() => appModule.authService);
    gh.factory<_i565.UserService>(() => appModule.userService);
    gh.factory<_i978.CategoryService>(() => appModule.categoryService);
    gh.factory<_i1048.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i149.UserRepository>(() => appModule.userRepository);
    gh.factory<_i737.CategoryRepository>(() => appModule.categoryRepository);
    gh.factory<_i1030.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i842.UsersUseCases>(() => appModule.usersUseCases);
    gh.factory<_i1029.CategoryUseCases>(() => appModule.categoryUseCases);
    return this;
  }
}

class _$AppModule extends _i199.AppModule {}

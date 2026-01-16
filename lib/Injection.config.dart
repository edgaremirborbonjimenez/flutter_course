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

import 'src/data/dataSource/remote/services/AuthService.dart' as _i204;
import 'src/di/AppModule.dart' as _i199;
import 'src/domain/repository/AuthRepository.dart' as _i1048;
import 'src/domain/useCase/auth/AuthUseCases.dart' as _i1030;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i204.AuthService>(() => appModule.authService);
    gh.factory<_i1048.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i1030.AuthUseCases>(() => appModule.authUseCases);
    return this;
  }
}

class _$AppModule extends _i199.AppModule {}

import 'package:e_commerce/Injection.dart';
import 'package:e_commerce/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:e_commerce/src/presentation/pages/auth/login/bloc/LoginBloc.dart';
import 'package:e_commerce/src/presentation/pages/auth/login/bloc/LoginEvent.dart';
import 'package:e_commerce/src/presentation/pages/auth/register/RegisterBlocCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(locator<AuthUseCases>())..add(InitEvent()),
  ),
  BlocProvider<RegisterBlocCubit>(
    create: (context) => RegisterBlocCubit(locator<AuthUseCases>()),
  ),
];

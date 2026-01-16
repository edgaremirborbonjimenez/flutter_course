import 'package:e_commerce/src/data/dataSource/remote/services/AuthService.dart';
import 'package:e_commerce/src/domain/models/AuthResponse.dart';
import 'package:e_commerce/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:e_commerce/src/domain/useCase/auth/LoginUseCase.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:e_commerce/src/presentation/pages/auth/login/LoginBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {
  AuthUseCases authUseCases;

  LoginBlocCubit(this.authUseCases) : super(LoginInitial());

  final _responseController = BehaviorSubject<Resource>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<Resource> get responseStream => _responseController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;

  void changeEmail(String email) {
    if (email.isNotEmpty && email.length < 6) {
      _emailController.sink.addError('Email length is less than 6');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 6) {
      _passwordController.sink.addError('Password length is less than 6');
    } else {
      _passwordController.sink.add(password);
    }
  }

  Stream<bool> get validateForm =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  void dispose() {
    changeEmail('');
    changePassword('');
  }

  void login() async {
    _responseController.add(Loading());
    Resource response = await authUseCases.loginUseCase.run(
      _emailController.value,
      _passwordController.value,
    );
    _responseController.add(response);
    // Esto soluciona en caso de que el estado de la respuesta no llega a cabiar, lo regresamos al estado Inicial manualmente
    // Future.delayed(Duration(seconds: 1),(){
    //   _responseController.add(Initial());
    // });
  }
}

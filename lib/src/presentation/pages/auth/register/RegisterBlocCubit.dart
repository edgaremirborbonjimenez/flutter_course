import 'package:e_commerce/src/domain/models/AuthResponse.dart';
import 'package:e_commerce/src/domain/models/User.dart';
import 'package:e_commerce/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:e_commerce/src/presentation/pages/auth/register/RegisterBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBlocCubit extends Cubit<RegisterBlocState> {
  AuthUseCases authUseCases;

  RegisterBlocCubit(this.authUseCases) : super(RegisterInitial());

  final _nameController = BehaviorSubject<String>();
  final _lastNameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _validatePasswordController = BehaviorSubject<String>();
  final _responseController = BehaviorSubject<Resource>();

  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get lastNameStream => _lastNameController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get phoneStream => _phoneController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get validatePasswordStream =>
      _validatePasswordController.stream;
  Stream<Resource> get responseStream => _responseController.stream;

  Stream<bool> get validateForm => Rx.combineLatest6(
    nameStream,
    lastNameStream,
    emailStream,
    phoneStream,
    passwordStream,
    validatePasswordStream,
    (a, b, c, d, e, f) => true,
  );

  toUser() => User(
    name: _nameController.value,
    lastName: _lastNameController.value,
    email: _emailController.value,
    phone: _phoneController.value,
    password: _passwordController.value,
  );

  void register() async {
    _responseController.add(Loading());
    Resource<AuthResponse> response = await authUseCases.registerUseCase.run(
      toUser(),
    );
    _responseController.add(response);
  }

  void changeName(String name) {
    if (name.isNotEmpty && name.length < 2) {
      _nameController.sink.addError("Invalid Name lenght");
    } else {
      _nameController.sink.add(name);
    }
  }

  void changeLastName(String lastName) {
    if (lastName.isNotEmpty && lastName.length < 2) {
      _lastNameController.sink.addError("Invalid Last Name lenght");
    } else {
      _lastNameController.sink.add(lastName);
    }
  }

  void changeEmail(String email) {
    bool emailFormatValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
    if (email.isNotEmpty && email.length < 5) {
      _emailController.sink.addError('Al menos 5 caracteres');
    } else if (email.isNotEmpty && !emailFormatValid) {
      _emailController.sink.addError('El email no es valido');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePhone(String phone) {
    if (phone.isNotEmpty && phone.length < 10) {
      _phoneController.sink.addError("Invalid Phone lenght");
    } else {
      _phoneController.sink.add(phone);
    }
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 6) {
      _passwordController.sink.addError(
        "Invalid Password lenght, at least 6 characters",
      );
    } else {
      _passwordController.sink.add(password);
    }
  }

  void changeValidatePassword(String password) {
    if (password.isNotEmpty && password.length < 6) {
      _validatePasswordController.sink.addError(
        "Invalid Password lenght, at least 6 characters",
      );
    } else if (password.isNotEmpty && password != _passwordController.value) {
      _validatePasswordController.sink.addError('Password do not match');
    } else {
      _validatePasswordController.sink.add(password);
    }
  }

  void dispose() {
    changeName("");
    changeLastName("");
    changeEmail("");
    changePhone("");
    changePassword("");
    changeValidatePassword("");
  }
}

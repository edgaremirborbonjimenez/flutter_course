import 'package:e_commerce/src/domain/models/User.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:e_commerce/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const RegisterState({
    this.name = const BlocFormItem(error: 'Enter a name'),
    this.lastName = const BlocFormItem(error: 'Enter a last name'),
    this.email = const BlocFormItem(error: 'Enter a email'),
    this.phone = const BlocFormItem(error: 'Enter a phone'),
    this.password = const BlocFormItem(error: 'Enter a password'),
    this.confirmPassword = const BlocFormItem(
      error: 'Enter a confirm password',
    ),
    this.formKey,
    this.response,
  });

  User toUser() => User(
    name: name.value,
    lastName: lastName.value,
    email: email.value,
    phone: email.value,
    password: password.value,
  );

  RegisterState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? email,
    BlocFormItem? phone,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return RegisterState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [
    name,
    lastName,
    email,
    phone,
    password,
    confirmPassword,
    response,
  ];
}

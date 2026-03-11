import 'dart:io';

import 'package:e_commerce/src/domain/models/User.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:e_commerce/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileUpdateState extends Equatable {
  final int id;
  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem email;
  final BlocFormItem phone;
  final File? image;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const ProfileUpdateState({
    this.id = 0,
    this.name = const BlocFormItem(error: 'Enter name'),
    this.lastName = const BlocFormItem(error: 'Enter Last Name'),
    this.email = const BlocFormItem(error: 'Enter Email'),
    this.phone = const BlocFormItem(error: 'Enter Phone'),
    this.formKey,
    this.image,
    this.response,
  });

  toUser() => User(
    id: id,
    name: name.value,
    lastName: lastName.value,
    email: email.value,
    phone: phone.value,
  );

  ProfileUpdateState copyWith({
    int? id,
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? email,
    BlocFormItem? phone,
    File? image,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return ProfileUpdateState(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    lastName,
    email,
    phone,
    image,
    response,
  ];
}

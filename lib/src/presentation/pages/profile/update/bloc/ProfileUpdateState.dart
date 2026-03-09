import 'dart:io';

import 'package:e_commerce/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileUpdateState extends Equatable{

  final BlocFormItem name;
  final BlocFormItem lastName;
  final BlocFormItem email;
  final BlocFormItem phone;
  final File? image;
  final GlobalKey<FormState>? formKey;

  const ProfileUpdateState({
    this.name = const BlocFormItem(error: 'Enter name'),
    this.lastName = const BlocFormItem(error: 'Enter Last Name'),
    this.email = const BlocFormItem(error: 'Enter Email'),
    this.phone = const BlocFormItem(error: 'Enter Phone'),
    this.formKey,
    this.image
  });

  ProfileUpdateState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastName,
    BlocFormItem? email,
    BlocFormItem? phone,
    File? image,
    GlobalKey<FormState>? formKey
  }){
    return ProfileUpdateState(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      image: image,
      formKey: formKey
    );
  }

  @override
  List<Object?> get props => [name,lastName,email,phone,image];

}
import 'dart:io';

import 'package:e_commerce/src/domain/models/Category.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:e_commerce/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AdminCategoryCreateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem description;
  final File? file;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const AdminCategoryCreateState({
    this.name = const BlocFormItem(error: 'Enter name'),
    this.description = const BlocFormItem(error: 'Enter description'),
    this.formKey,
    this.response,
    this.file,
  });

  toCategory() => Category(name: name.value, description: description.value);

  AdminCategoryCreateState resetForm() {
    return AdminCategoryCreateState(
      name: const BlocFormItem(error: 'Enter name'),
      description: const BlocFormItem(error: 'Enter description'),
    );
  }

  AdminCategoryCreateState copyWith({
    BlocFormItem? name,
    BlocFormItem? description,
    File? file,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return AdminCategoryCreateState(
      name: name ?? this.name,
      description: description ?? this.description,
      file: file ?? this.file,
      formKey: formKey,
      response: response,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, description, file, response];
}

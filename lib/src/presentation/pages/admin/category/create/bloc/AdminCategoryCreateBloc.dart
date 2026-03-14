import 'dart:io';

import 'package:e_commerce/src/domain/useCase/category/CategoryUseCases.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:e_commerce/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateEvents.dart';
import 'package:e_commerce/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateState.dart';
import 'package:e_commerce/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AdminCategoryCreateBloc
    extends Bloc<AdminCategoryCreateEvent, AdminCategoryCreateState> {
  CategoryUseCases categyUseCases;
  final formKey = GlobalKey<FormState>();

  AdminCategoryCreateBloc(this.categyUseCases)
    : super(AdminCategoryCreateState()) {
    on<AdminCategoryCreateInitEvent>(_onInitEvent);
    on<NameChange>(_onNameChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<FormSubmit>(_onSubmit);
    on<ResetForm>(_onResetForm);
    on<PickImage>(_onPickImage);
    on<TakePhoto>(_onTakePhoto);
  }

  Future<void> _onPickImage(
    PickImage event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(file: File(image.path)));
    }
  }

  Future<void> _onTakePhoto(
    TakePhoto event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(file: File(image.path)));
    }
  }

  Future<void> _onInitEvent(
    AdminCategoryCreateInitEvent event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNameChanged(
    NameChange event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isNotEmpty ? null : 'Enter valid name',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onDescriptionChanged(
    DescriptionChanged event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    emit(
      state.copyWith(
        description: BlocFormItem(
          value: event.description.value,
          error: event.description.value.isNotEmpty
              ? null
              : 'Enter valid description',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onSubmit(
    FormSubmit event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await categyUseCases.create.run(
      state.toCategory(),
      state.file,
    );
    emit(state.copyWith(response: response));
  }

  Future<void> _onResetForm(
    ResetForm event,
    Emitter<AdminCategoryCreateState> emit,
  ) async {
    emit(state.resetForm());
    // state.formKey?.currentState?.reset();
  }
}

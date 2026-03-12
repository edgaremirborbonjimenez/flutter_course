import 'dart:io';

import 'package:e_commerce/src/domain/models/AuthResponse.dart';
import 'package:e_commerce/src/domain/useCase/auth/AuthUseCases.dart';
import 'package:e_commerce/src/domain/useCase/users/UsersUseCases.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:e_commerce/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:e_commerce/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:e_commerce/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  UsersUseCases userUseCases;
  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();

  ProfileUpdateBloc(this.userUseCases, this.authUseCases)
    : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>(_onInitEvent);
    on<ProfileUpdateNameChange>(_onNameChange);
    on<ProfileUpdateLastNameChange>(_onLastNameChange);
    on<ProfileUpdateEmailChange>(_onEmailChange);
    on<ProfileUpdatePhoneChange>(_onPhoneChange);
    on<ProfileUpdatePickImage>(_onPickImage);
    on<ProfileUpdateTakePhoto>(_onTakePhoto);
    on<ProfileUpdateFromSubmit>(_onFormSubmit);
    on<ProfileUpdateUpdateUserSession>(_onUpdateUserSession);
  }

  Future<void> _onInitEvent(
    ProfileUpdateInitEvent event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        id: event.user?.id,
        name: BlocFormItem(value: event.user?.name ?? ''),
        lastName: BlocFormItem(value: event.user?.lastName ?? ''),
        email: BlocFormItem(value: event.user?.email ?? ''),
        phone: BlocFormItem(value: event.user?.phone ?? ''),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onUpdateUserSession(
    ProfileUpdateUpdateUserSession event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    AuthResponse authResponse = await authUseCases.getUserSesionUseCase.run();
    authResponse.user.name = event.user.name;
    authResponse.user.lastName = event.user.lastName;
    authResponse.user.phone = event.user.phone;
    authResponse.user.email = event.user.email;
    authResponse.user.image = event.user.image;
    await authUseCases.saveUserSesionUseCase.run(authResponse);
  }

  Future<void> _onFormSubmit(
    ProfileUpdateFromSubmit event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(state.copyWith(response: Loading(), formKey: formKey));
    Resource response = await userUseCases.updateUser.run(
      state.id,
      state.toUser(),
      state.image,
    );
    emit(state.copyWith(response: response, formKey: formKey));
  }

  Future<void> _onPickImage(
    ProfileUpdatePickImage event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(state.copyWith(image: File(image.path)));
    }
  }

  Future<void> _onTakePhoto(
    ProfileUpdateTakePhoto event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      emit(state.copyWith(image: File(image.path)));
    }
  }

  Future<void> _onNameChange(
    ProfileUpdateNameChange event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isNotEmpty ? null : 'Enter valid Name',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onLastNameChange(
    ProfileUpdateLastNameChange event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.lastName.value,
          error: event.lastName.value.isNotEmpty
              ? null
              : 'Enter valid LastName',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onEmailChange(
    ProfileUpdateEmailChange event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.email.value,
          error: event.email.value.isNotEmpty ? null : 'Enter valid Email',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPhoneChange(
    ProfileUpdatePhoneChange event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(
      state.copyWith(
        name: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isNotEmpty ? null : 'Enter valid Phone',
        ),
        formKey: formKey,
      ),
    );
  }
}

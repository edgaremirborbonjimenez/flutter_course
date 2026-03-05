import 'package:e_commerce/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:e_commerce/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:e_commerce/src/presentation/utils/BlocFormItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  final formKey = GlobalKey<FormState>();

  ProfileUpdateBloc() : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>(_onInitEvent);
    on<ProfileUpdateNameChange>(_onNameChange);
    on<ProfileUpdateLastNameChange>(_onLastNameChange);
    on<ProfileUpdateEmailChange>(_onEmailChange);
    on<ProfileUpdatePhoneChange>(_onPhoneChange);
  }

  Future<void> _onInitEvent(
    ProfileUpdateInitEvent event,
    Emitter<ProfileUpdateState> emit,
  ) async {
    emit(state.copyWith(formKey: formKey));
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

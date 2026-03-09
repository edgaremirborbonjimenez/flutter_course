import 'package:e_commerce/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileUpdateEvent extends Equatable {
  const ProfileUpdateEvent();

  @override
  List<Object?> get props => [];
}

class ProfileUpdateInitEvent extends ProfileUpdateEvent{
  const ProfileUpdateInitEvent();
}

class ProfileUpdateNameChange extends ProfileUpdateEvent {
  final BlocFormItem name;

  const ProfileUpdateNameChange({required this.name});

  @override
  List<Object?> get props => [name];
}

class ProfileUpdateLastNameChange extends ProfileUpdateEvent {
  final BlocFormItem lastName;

  const ProfileUpdateLastNameChange({required this.lastName});

  @override
  List<Object?> get props => [lastName];
}

class ProfileUpdateEmailChange extends ProfileUpdateEvent {
  final BlocFormItem email;

  const ProfileUpdateEmailChange({required this.email});

  @override
  List<Object?> get props => [email];
}

class ProfileUpdatePhoneChange extends ProfileUpdateEvent {
  final BlocFormItem phone;

  const ProfileUpdatePhoneChange({required this.phone});

  @override
  List<Object?> get props => [phone];
}

class ProfileUpdateFromSubmit extends ProfileUpdateEvent {
  const ProfileUpdateFromSubmit();
}

class ProfileUpdatePickImage extends ProfileUpdateEvent{
  const ProfileUpdatePickImage();
}


class ProfileUpdateTakePhoto extends ProfileUpdateEvent{
  const ProfileUpdateTakePhoto();
}
import 'package:e_commerce/src/presentation/utils/BlocFormItem.dart';
import 'package:equatable/equatable.dart';

abstract class AdminCategoryCreateEvent extends Equatable {
  const AdminCategoryCreateEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AdminCategoryCreateInitEvent extends AdminCategoryCreateEvent {
  const AdminCategoryCreateInitEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NameChange extends AdminCategoryCreateEvent {
  final BlocFormItem name;

  const NameChange({required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}

class DescriptionChanged extends AdminCategoryCreateEvent {
  final BlocFormItem description;

  const DescriptionChanged({required this.description});

  @override
  // TODO: implement props
  List<Object?> get props => [description];
}

class FormSubmit extends AdminCategoryCreateEvent {
  const FormSubmit();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ResetForm extends AdminCategoryCreateEvent {
  const ResetForm();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PickImage extends AdminCategoryCreateEvent {
  const PickImage();
}

class TakePhoto extends AdminCategoryCreateEvent {
  const TakePhoto();
}

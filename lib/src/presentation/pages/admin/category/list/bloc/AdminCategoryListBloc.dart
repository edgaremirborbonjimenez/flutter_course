import 'package:e_commerce/src/domain/useCase/category/CategoryUseCases.dart';
import 'package:e_commerce/src/domain/utils/Resource.dart';
import 'package:e_commerce/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';
import 'package:e_commerce/src/presentation/pages/admin/category/list/bloc/AdminCategoryListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminCategoryListBloc
    extends Bloc<AdminCategoryListEvent, AdminCategoryListState> {
  CategoryUseCases categoryUseCases;

  AdminCategoryListBloc(this.categoryUseCases)
    : super(AdminCategoryListState()) {
    on<GetCategories>(_onGetCategories);
  }

  Future<void> _onGetCategories(
    GetCategories event,
    Emitter<AdminCategoryListState> emit,
  ) async {
    emit(state.copyWith(response: Loading()));

    Resource response = await categoryUseCases.getCategories.run();
    emit(state.copyWith(response: response));
  }
}

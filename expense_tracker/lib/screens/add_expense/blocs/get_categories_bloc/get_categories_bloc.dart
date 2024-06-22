import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

part 'get_categories_event.dart';
part 'get_categories_state.dart';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  final ExpenseRepo expenseRepo;
  GetCategoriesBloc(this.expenseRepo) : super(GetCategoriesInitial()) {
    on<GetCategories>((event, emit) async {
      emit(GetCategoriesLoading());
      try {
        List<CategoryModel> categories = await expenseRepo.getCategory();
        emit(GetCategoriesSuccess(categories));
      } catch (e) {
        emit(GetCategoriesFailure());
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

part 'get_expenses_event.dart';
part 'get_expenses_state.dart';

class GetExpensesBloc extends Bloc<GetExpensesEvent, GetExpensesState> {
  final ExpenseRepo expenseRepo;
  GetExpensesBloc(this.expenseRepo) : super(GetExpensesInitial()) {
    on<GetExpenses>((event, emit) async{
      emit(GetExpensesLoading());
      try {
        List<ExpenseModel> expenses = await expenseRepo.getExpense();
        emit(GetExpensesSuccess(expenses));
      } catch (e) {
        emit(GetExpensesFailure());
      }
    });
  }
}

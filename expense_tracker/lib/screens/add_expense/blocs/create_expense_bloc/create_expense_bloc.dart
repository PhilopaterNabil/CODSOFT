import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

part 'create_expense_event.dart';
part 'create_expense_state.dart';

class CreateExpenseBloc extends Bloc<CreateExpenseEvent, CreateExpenseState> {
  final ExpenseRepo expenseRepo;
  CreateExpenseBloc(this.expenseRepo) : super(CreateExpenseInitial()) {
    on<CreateExpense>((event, emit) async {
      emit(CreateExpenseLoading());
      try {
        await expenseRepo.createExpense(event.expense);
        emit(CreateExpenseSuccess());
      } catch (e) {
        emit(CreateExpenseFailure());
      }
    });
  }
}

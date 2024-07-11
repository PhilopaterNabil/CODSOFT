import 'package:expense_repository/src/models/models.dart';

abstract class ExpenseRepo {
  Future<void> createCategory(CategoryModel category);

  Future<List<CategoryModel>> getCategory();

  Future<void> createExpense(ExpenseModel expense);

  Future<List<ExpenseModel>> getExpense();
}

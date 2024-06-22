import 'package:expense_repository/expense_repository.dart';

class ExpenseModel {
  String expenseId;
  double amount;
  CategoryModel categoryModel;
  DateTime date;

  ExpenseModel({
    required this.expenseId,
    required this.amount,
    required this.categoryModel,
    required this.date,
  });

  static final empty = ExpenseModel(
    expenseId: '',
    amount: 0,
    categoryModel: CategoryModel.empty,
    date: DateTime.now(),
  );

  ExpenseEntity toEntity() {
    return ExpenseEntity(
      expenseId: expenseId,
      amount: amount,
      category: categoryModel,
      date: date,
    );
  }

  static ExpenseModel fromEntity(ExpenseEntity expenseEntity) {
    return ExpenseModel(
      expenseId: expenseEntity.expenseId,
      amount: expenseEntity.amount,
      categoryModel: expenseEntity.category,
      date: expenseEntity.date,
    );
  }
}

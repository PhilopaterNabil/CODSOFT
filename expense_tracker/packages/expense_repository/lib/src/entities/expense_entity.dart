import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/expense_repository.dart';

class ExpenseEntity {
  String expenseId;
  double amount;
  CategoryModel category;
  DateTime date;

  ExpenseEntity({
    required this.expenseId,
    required this.amount,
    required this.category,
    required this.date,
  });

  Map<String, Object?> toDocument() {
    return {
      'expenseId': expenseId,
      'amount': amount,
      'category': category.toEntity().toDocument(),
      'date': date,
    };
  }

  static ExpenseEntity fromDocument(Map<String, Object?> document) {
    return ExpenseEntity(
      expenseId: document['expenseId'] as String,
      amount: document['amount'] as double,
      category: CategoryModel.fromEntity(CategoryEntity.fromDocument(
          document['category'] as Map<String, Object?>)),
      date: (document['date'] as Timestamp).toDate(),
    );
  }
}

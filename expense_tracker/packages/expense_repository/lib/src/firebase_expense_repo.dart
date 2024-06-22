import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:expense_repository/src/entities/entities.dart';

class FirebaseExpenseRepo implements ExpenseRepo {
  final categoryCollection =
      FirebaseFirestore.instance.collection('categories');
  final expenseCollection = FirebaseFirestore.instance.collection('expenses');

  @override
  Future<void> createCategory(CategoryModel category) async {
    try {
      await categoryCollection
          .doc(category.categoryId)
          .set(category.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<CategoryModel>> getCategory() async {
    try {
      return await categoryCollection.get().then(
            (value) => value.docs
                .map(
                  (e) => CategoryModel.fromEntity(
                      CategoryEntity.fromDocument(e.data())),
                )
                .toList(),
          );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> createExpense(ExpenseModel expense) async {
    try {
      await expenseCollection
          .doc(expense.expenseId)
          .set(expense.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<ExpenseModel>> getExpense() async {
    try {
      return await expenseCollection.get().then(
            (value) => value.docs
                .map(
                  (e) => ExpenseModel.fromEntity(
                      ExpenseEntity.fromDocument(e.data())),
                )
                .toList(),
          );
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/screens/home/views/widgets/custom_credit_card_calculator.dart';
import 'package:expense_tracker/screens/home/views/widgets/custom_credit_card_list.dart';
import 'package:expense_tracker/screens/home/views/widgets/home_body_app_bar.dart';
import 'package:expense_tracker/screens/home/views/widgets/text_title_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key, required this.expenseList});
  final List<ExpenseModel> expenseList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const HomeBodyAppBar(),
            const SizedBox(height: 20),
            CustomCreditCardCalculator(expenses: expenseList),
            const SizedBox(height: 30),
            const TextTitleListView(),
            const SizedBox(height: 20),
            CustomCreditCardList(expenses: expenseList),
          ],
        ),
      ),
    );
  }
}

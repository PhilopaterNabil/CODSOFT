import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCreditCardList extends StatelessWidget {
  const CustomCreditCardList({super.key, required this.expenses});
  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(expenses[index].categoryModel.color),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        expenses[index].categoryModel.icon,
                        scale: 1.5,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      expenses[index].categoryModel.name,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$ ${expenses[index].amount.toString()}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(expenses[index].date),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/constants/my_primary_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCreditCardCalculator extends StatelessWidget {
  const CustomCreditCardCalculator({super.key, required this.expenses});
  final List<ExpenseModel> expenses;

  @override
  Widget build(BuildContext context) {
    double totalBalance = 6000.00;
    double sumExpense = 0;
    for (var element in expenses) {
      sumExpense += element.amount;
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            MyPrimaryColors.myLightBlue,
            MyPrimaryColors.myPurple,
            MyPrimaryColors.myOrange,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Total Balance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              '\$ ${(totalBalance - sumExpense).toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white30,
                  ),
                  child: const Icon(
                    CupertinoIcons.arrow_down,
                    color: Colors.greenAccent,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Income',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '\$ 2.700.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white30,
                  ),
                  child: Icon(
                    CupertinoIcons.arrow_up,
                    color: Colors.red[600],
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Expenses',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '\$ ${sumExpense.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

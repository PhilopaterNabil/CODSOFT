import 'dart:math';

import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/constants/my_primary_colors.dart';
import 'package:expense_tracker/screens/add_expense/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:expense_tracker/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:expense_tracker/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:expense_tracker/screens/add_expense/views/add_expense.dart';
import 'package:expense_tracker/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
import 'package:expense_tracker/screens/home/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:expense_tracker/screens/home/views/widgets/home_screen_body.dart';
import 'package:expense_tracker/screens/stats/views/stats_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final FirebaseExpenseRepo firebaseExpenseRepo = FirebaseExpenseRepo();
  void changeItem(int value) {
    setState(() {
      currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetExpensesBloc(FirebaseExpenseRepo())..add(GetExpenses()),
      child: BlocBuilder<GetExpensesBloc, GetExpensesState>(
        builder: (context, state) {
          if (state is GetExpensesSuccess) {
            return Scaffold(
              backgroundColor: Colors.grey.shade200,
              bottomNavigationBar: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: CustomBottomNavigationBar(
                  currentIndex: currentIndex,
                  onTap: changeItem,
                  turnOnColor: Colors.pink,
                  turnOffColor: MyPrimaryColors.myLightBlue.withOpacity(0.8),
                  milliseconds: 180,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  var newExpense = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) =>
                                CreateCategoryBloc(firebaseExpenseRepo),
                          ),
                          BlocProvider(
                            create: (context) =>
                                GetCategoriesBloc(firebaseExpenseRepo)
                                  ..add(
                                    GetCategories(),
                                  ),
                          ),
                          BlocProvider(
                            create: (context) =>
                                CreateExpenseBloc(firebaseExpenseRepo),
                          ),
                        ],
                        child: const AddExpense(),
                      ),
                    ),
                  );

                  if (newExpense != null) {
                    setState(() {
                      state.expense.insert(0, newExpense);
                    });
                  }
                },
                shape: const CircleBorder(),
                elevation: 5,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    gradient: const LinearGradient(
                      colors: [
                        MyPrimaryColors.myOrange,
                        MyPrimaryColors.myPurple,
                        MyPrimaryColors.myLightBlue,
                      ],
                      transform: GradientRotation(pi / 4),
                    ),
                  ),
                  child: const Icon(CupertinoIcons.add),
                ),
              ),
              body: currentIndex == 0
                  ? HomeScreenBody(expenseList: state.expense)
                  : const StatsScreen(),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

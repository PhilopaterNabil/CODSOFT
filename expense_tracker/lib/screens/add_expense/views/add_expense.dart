import 'dart:math';

import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/constants/my_primary_colors.dart';
import 'package:expense_tracker/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:expense_tracker/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:expense_tracker/screens/add_expense/views/get_category_creation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime dateTime = DateTime.now();
  late ExpenseModel expenseModel;
  bool isLoading = false;
  bool actionButton = false;

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(dateTime);
    expenseModel = ExpenseModel.empty;
    expenseModel.expenseId = const Uuid().v1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateExpenseBloc, CreateExpenseState>(
      listener: (context, state) {
        if (state is CreateExpenseSuccess) {
          Navigator.pop(context, expenseModel);
        } else if (state is CreateExpenseLoading) {
          setState(() {
            isLoading = true;
          });
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(CupertinoIcons.clear),
              ),
            ],
            backgroundColor: Theme.of(context).colorScheme.surface,
            elevation: 0,
          ),
          body: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
            builder: (context, state) {
              if (state is GetCategoriesSuccess) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Add Expenses ',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: TextFormField(
                            controller: expenseController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.purple,
                            ),
                            decoration: InputDecoration(
                              hintText: '0',
                              hintStyle: const TextStyle(fontSize: 30),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: const Icon(
                                FontAwesomeIcons.dollarSign,
                                size: 16,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        TextFormField(
                          controller: categoryController,
                          keyboardType: TextInputType.text,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'Category',
                            hintStyle: const TextStyle(fontSize: 20),
                            fillColor: expenseModel.categoryModel ==
                                    CategoryModel.empty
                                ? Colors.white
                                : Color(expenseModel.categoryModel.color),
                            filled: true,
                            prefixIcon: expenseModel.categoryModel ==
                                    CategoryModel.empty
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        actionButton = !actionButton;
                                      });
                                    },
                                    icon: actionButton
                                        ? const Icon(
                                            FontAwesomeIcons.list,
                                            size: 16,
                                            color: Colors.grey,
                                          )
                                        : const Icon(
                                            FontAwesomeIcons.list,
                                            size: 16,
                                          ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        actionButton = !actionButton;
                                      });
                                    },
                                    child: Image.asset(
                                      expenseModel.categoryModel.icon,
                                      scale: 1.5,
                                    ),
                                  ),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                var newCategory =
                                    await getCategoryCreation(context);
                                setState(() {
                                  newCategory == null
                                      ? null
                                      : state.categories.insert(0, newCategory);
                                });
                              },
                              icon: const Icon(
                                FontAwesomeIcons.plus,
                                size: 16,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: actionButton
                                  ? const BorderRadius.vertical(
                                      top: Radius.circular(10),
                                    )
                                  : BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        actionButton
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.22,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(10),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                    itemCount: state.categories.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        elevation: 5,
                                        color: Color(
                                            state.categories[index].color),
                                        child: ListTile(
                                          onTap: () {
                                            setState(() {
                                              expenseModel.categoryModel =
                                                  state.categories[index];
                                              categoryController.text =
                                                  expenseModel
                                                      .categoryModel.name;
                                            });
                                          },
                                          leading: Image.asset(
                                            state.categories[index].icon,
                                            scale: 1.5,
                                          ),
                                          title: Text(
                                            state.categories[index].name,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: dateController,
                          keyboardType: TextInputType.datetime,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              initialDate: expenseModel.date,
                              context: context,
                              firstDate: dateTime,
                              lastDate: dateTime.add(const Duration(days: 365)),
                            );

                            if (pickedDate != null) {
                              setState(() {
                                dateController.text =
                                    DateFormat('dd/MM/yyyy').format(pickedDate);
                                expenseModel.date = pickedDate;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Date',
                            hintStyle: const TextStyle(fontSize: 20),
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: const Icon(
                              FontAwesomeIcons.clock,
                              size: 16,
                              color: Colors.grey,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        Container(
                          width: double.infinity,
                          height: kToolbarHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: const LinearGradient(
                              colors: [
                                MyPrimaryColors.myLightBlue,
                                MyPrimaryColors.myPurple,
                                MyPrimaryColors.myOrange,
                              ],
                              transform: GradientRotation(pi / 5),
                            ),
                          ),
                          child: isLoading == false
                              ? TextButton(
                                  clipBehavior: Clip.antiAlias,
                                  onPressed: () {
                                    setState(() {
                                      expenseModel.amount =
                                          double.parse(expenseController.text);
                                    });
                                    context
                                        .read<CreateExpenseBloc>()
                                        .add(CreateExpense(expenseModel));
                                  },
                                  child: const Text(
                                    'SAVE',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

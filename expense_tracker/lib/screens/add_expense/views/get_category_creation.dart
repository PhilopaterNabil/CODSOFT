import 'dart:math';

import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/constants/my_primary_colors.dart';
import 'package:expense_tracker/constants/my_primary_strings.dart';
import 'package:expense_tracker/data/my_categories_icons.dart';
import 'package:expense_tracker/screens/add_expense/blocs/create_category_bloc/create_category_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:uuid/uuid.dart';

Future getCategoryCreation(BuildContext context) {
  return showDialog(
    context: context,
    builder: (ctx) {
      String iconSelected = '';
      bool isExpandedIcon = false;
      Color categoryColor = Colors.white;
      TextEditingController categoryNameController = TextEditingController();
      TextEditingController categoryIconController = TextEditingController();
      TextEditingController categoryColorController = TextEditingController();
      bool isLoading = false;
      CategoryModel category = CategoryModel.empty;

      return BlocProvider.value(
        value: context.read<CreateCategoryBloc>(),
        child: StatefulBuilder(
          builder: (ctx, setState) {
            return BlocListener<CreateCategoryBloc, CreateCategoryState>(
              listener: (context, state) {
                if (state is CreateCategorySuccess) {
                  Navigator.pop(ctx, category);
                  isLoading = false;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Category created sucessfully'),
                    ),
                  );
                } else if (state is CreateCategoryLoading) {
                  setState(() {
                    isLoading = true;
                  });
                } else if (state is CreateCategoryFailure) {
                  isLoading = false;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to create category'),
                    ),
                  );
                }
              },
              child: StatefulBuilder(
                builder: (ctx, setState) {
                  return AlertDialog(
                    title: const Center(
                      child: Text('Create a Category'),
                    ),
                    backgroundColor: Colors.lightBlue[100],
                    content: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: isExpandedIcon
                          ? MediaQuery.of(context).size.height * 0.55
                          : MediaQuery.of(context).size.height * 0.33,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: categoryNameController,
                              decoration: InputDecoration(
                                hintText: 'Name',
                                hintStyle: const TextStyle(fontSize: 20),
                                fillColor: Colors.white,
                                isDense: true,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: categoryIconController,
                              onTap: () {
                                setState(() {
                                  isExpandedIcon = !isExpandedIcon;
                                });
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Icon',
                                hintStyle: const TextStyle(fontSize: 20),
                                fillColor: Colors.white,
                                isDense: true,
                                filled: true,
                                suffixIcon: Icon(
                                  isExpandedIcon
                                      ? CupertinoIcons.chevron_up
                                      : CupertinoIcons.chevron_down,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: isExpandedIcon
                                      ? const BorderRadius.vertical(
                                          top: Radius.circular(12),
                                        )
                                      : BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            isExpandedIcon
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.22,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(12),
                                      ),
                                    ),
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                      ),
                                      itemCount: myCategoriesIcons.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              iconSelected =
                                                  myCategoriesIcons[index]
                                                      [MyPrimaryStrings.icon]!;
                                            });
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.8,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.07,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 3,
                                                color: iconSelected ==
                                                        myCategoriesIcons[index]
                                                            [MyPrimaryStrings
                                                                .icon]
                                                    ? Colors.green
                                                    : Colors.deepPurpleAccent,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 8,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Image.asset(
                                                myCategoriesIcons[index]
                                                        [MyPrimaryStrings.icon]
                                                    as String,
                                                width: 24,
                                                height: 24,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : const SizedBox(),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: categoryColorController,
                              onTap: () {
                                setState(() {
                                  categoryColor = categoryColor;
                                });
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: categoryColor == Colors.white
                                    ? 'Color'
                                    : 'Color Selected',
                                hintStyle: categoryColor == Colors.white
                                    ? const TextStyle(fontSize: 20)
                                    : TextStyle(
                                        fontSize: 20,
                                        color: categoryColor,
                                      ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (ctx2) {
                                        return AlertDialog(
                                          backgroundColor:
                                              Colors.lightBlue[100],
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('Pick a color!'),
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  CupertinoIcons.check_mark,
                                                  size: 25,
                                                  color: Colors.green[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                          content: SingleChildScrollView(
                                            child: ColorPicker(
                                              pickerColor: categoryColor,
                                              onColorChanged: (value) {
                                                setState(() {
                                                  categoryColor = value;
                                                });
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: categoryColor == Colors.white
                                      ? const Icon(
                                          CupertinoIcons.color_filter,
                                          color: Colors.grey,
                                          size: 30,
                                        )
                                      : Icon(
                                          CupertinoIcons.color_filter_fill,
                                          color: categoryColor,
                                          size: 30,
                                        ),
                                ),
                                fillColor: Colors.white,
                                isDense: true,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
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
                              child: isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : TextButton(
                                      clipBehavior: Clip.antiAlias,
                                      onPressed: () {
                                        setState(
                                          () {
                                            category.categoryId =
                                                const Uuid().v1();
                                            category.name =
                                                categoryNameController.text;
                                            category.icon = iconSelected;
                                            category.color =
                                                categoryColor.value;
                                          },
                                        );
                                        context
                                            .read<CreateCategoryBloc>()
                                            .add(CreateCategory(category));
                                      },
                                      child: const Text(
                                        'SAVE',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      );
    },
  );
}

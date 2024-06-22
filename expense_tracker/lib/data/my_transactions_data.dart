import 'package:expense_tracker/constants/my_primary_strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> myTransactionsData = [
  {
    MyPrimaryStrings.name: 'Food',
    MyPrimaryStrings.icon:
        const Icon(FontAwesomeIcons.burger, color: Colors.white),
    MyPrimaryStrings.color: Colors.yellow[700],
    MyPrimaryStrings.totalAmount: '\$45.00',
    MyPrimaryStrings.data: 'Today',
  },
  {
    MyPrimaryStrings.name: 'Shopping',
    MyPrimaryStrings.icon:
        const Icon(FontAwesomeIcons.bagShopping, color: Colors.white),
    MyPrimaryStrings.color: Colors.purple[700],
    MyPrimaryStrings.totalAmount: '\$280.00',
    MyPrimaryStrings.data: 'Today',
  },
  {
    MyPrimaryStrings.name: 'Entertainment',
    MyPrimaryStrings.icon:
        const Icon(FontAwesomeIcons.film, color: Colors.white),
    MyPrimaryStrings.color: Colors.red[700],
    MyPrimaryStrings.totalAmount: '\$60.00',
    MyPrimaryStrings.data: 'Yesterday',
  },
  {
    MyPrimaryStrings.name: 'Travel',
    MyPrimaryStrings.icon:
        const Icon(FontAwesomeIcons.plane, color: Colors.white),
    MyPrimaryStrings.color: Colors.green[700],
    MyPrimaryStrings.totalAmount: '\$350.00',
    MyPrimaryStrings.data: 'Yesterday',
  },
  {
    MyPrimaryStrings.name: 'Health',
    MyPrimaryStrings.icon:
        const Icon(FontAwesomeIcons.heartCircleCheck, color: Colors.white),
    MyPrimaryStrings.color: Colors.blue[700],
    MyPrimaryStrings.totalAmount: '\$79.00',
    MyPrimaryStrings.data: 'Yesterday',
  },
  {
    MyPrimaryStrings.name: 'Grocery',
    MyPrimaryStrings.icon:
        const Icon(FontAwesomeIcons.shoppingBasket, color: Colors.white),
    MyPrimaryStrings.color: Colors.pink[700],
    MyPrimaryStrings.totalAmount: '\$120.00',
    MyPrimaryStrings.data: 'Yesterday',
  },
  {
    MyPrimaryStrings.name: 'Others',
    MyPrimaryStrings.icon:
        const Icon(FontAwesomeIcons.ellipsis, color: Colors.white),
    MyPrimaryStrings.color: Colors.orange[700],
    MyPrimaryStrings.totalAmount: '\$120.00',
    MyPrimaryStrings.data: 'Yesterday',
  },
];

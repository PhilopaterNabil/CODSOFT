import 'package:flutter/material.dart';

class TextTitleListView extends StatelessWidget {
  const TextTitleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Transactions',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'View All',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}

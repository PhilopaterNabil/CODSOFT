import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBodyAppBar extends StatelessWidget {
  const HomeBodyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.yellow[700],
              ),
            ),
            const Icon(
              CupertinoIcons.person_fill,
              size: 32,
              color: Colors.black54,
            ),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const Text(
              'Philo Nabil',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.settings),
        ),
      ],
    );
  }
}

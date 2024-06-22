import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:expense_tracker/constants/my_primary_colors.dart';
import 'package:flutter/cupertino.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.turnOnColor,
    required this.turnOffColor,
    this.milliseconds,
    this.size,
  });

  final int currentIndex;
  final void Function(int) onTap;
  final Color turnOnColor;
  final Color turnOffColor;
  final int? milliseconds;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: MyPrimaryColors.myBackGround,
      items: [
        Icon(
          CupertinoIcons.home,
          size: size ?? 26,
          color: currentIndex == 0 ? turnOnColor : turnOffColor,
        ),
        Icon(
          CupertinoIcons.graph_square_fill,
          size: size ?? 26,
          color: currentIndex == 1 ? turnOnColor : turnOffColor,
        ),
      ],
      animationDuration: Duration(milliseconds: milliseconds ?? 200),
      animationCurve: Curves.bounceInOut,
      height: MediaQuery.of(context).size.height / 15,
      onTap: onTap,
    );
  }
}

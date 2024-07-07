import 'package:flutter/material.dart';
import 'package:to_do/ui/size_config.dart';
import 'package:to_do/ui/theme.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.label, required this.onTap});

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.orientation == Orientation.landscape
            ? MediaQuery.of(context).size.height * 0.12
            : MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: primaryClr,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/ui/theme.dart';

import '../size_config.dart';

class ShowDeleteConfirmationDialog extends StatelessWidget {
  const ShowDeleteConfirmationDialog({
    super.key,
    required this.title,
    required this.description,
    required this.delete,
    required this.onPressedDelete,
    this.cancel,
    this.backgroundColor,
    this.isReturnBack = false,
  });

  final String title;
  final String description;
  final String? cancel;
  final Color? backgroundColor;
  final bool? isReturnBack;
  final String delete;
  final void Function() onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: SizeConfig.orientation == Orientation.landscape
            ? MediaQuery.sizeOf(context).height * 0.55
            : MediaQuery.sizeOf(context).height * 0.25,
        width: SizeConfig.orientation == Orientation.landscape
            ? MediaQuery.sizeOf(context).width * 0.4
            : MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              textAlign: TextAlign.center,
              style: titleStyle,
            ),
            const SizedBox(height: 15.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: subTitleStyle,
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    isReturnBack == true ? Get.back() : null;
                  },
                  child: Text(cancel ?? 'Cancel'),
                ),
                ElevatedButton(
                  onPressed: onPressedDelete,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColor ?? Colors.red,
                  ),
                  child: Text(delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

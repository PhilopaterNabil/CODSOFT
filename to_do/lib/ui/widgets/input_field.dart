import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/ui/size_config.dart';
import 'package:to_do/ui/theme.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
    this.paddingRight = false,
  });

  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final bool? paddingRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleStyle),
          Container(
            padding: paddingRight == true
                ? const EdgeInsets.symmetric(horizontal: 8)
                : const EdgeInsets.only(left: 8),
            margin: const EdgeInsets.only(top: 4),
            height: SizeConfig.orientation == Orientation.landscape
                ? MediaQuery.of(context).size.height * 0.12
                : MediaQuery.of(context).size.height * 0.068,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    autofocus: false,
                    readOnly: widget != null ? true : false,
                    cursorColor:
                        Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                    style: titleStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.dialogBackgroundColor,
                          width: 0,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.dialogBackgroundColor,
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                widget ?? const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

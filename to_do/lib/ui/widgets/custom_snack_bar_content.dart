import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/ui/theme.dart';

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent(
      {super.key, required this.errorText, required this.message});

  final String errorText;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: redErorrContainerClr,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      errorText,
                      style: titleStyle.copyWith(color: white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(message, style: subTitleStyle.copyWith(color: white)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
            child: SvgPicture.asset(
              'assets/icons/bubbles.svg',
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.07,
              color: redErorrbubblesClr,
            ),
          ),
        ),
        Positioned(
          top: -16,
          left: 2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/fail.svg',
                height: MediaQuery.of(context).size.height * 0.046,
              ),
              Positioned(
                top: 10,
                child: SvgPicture.asset(
                  'assets/icons/close.svg',
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

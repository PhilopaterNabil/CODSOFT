import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do/ui/size_config.dart';
import 'package:to_do/ui/theme.dart';

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent(
      {super.key, required this.errorText, required this.message});

  final String errorText;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: SizeConfig.orientation == Orientation.landscape
                ? MediaQuery.sizeOf(context).height * 0.23
                : MediaQuery.sizeOf(context).height * 0.11,
            width: SizeConfig.orientation == Orientation.landscape
                ? MediaQuery.sizeOf(context).width * 0.5
                : MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: redErorrContainerClr,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        errorText,
                        style: titleStyle.copyWith(
                            color: white,
                            fontSize:
                                SizeConfig.orientation == Orientation.landscape
                                    ? MediaQuery.sizeOf(context).height * 0.045
                                    : MediaQuery.sizeOf(context).height * 0.02),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Text(
                        message,
                        style: subTitleStyle.copyWith(
                            color: white,
                            fontSize: SizeConfig.orientation ==
                                    Orientation.landscape
                                ? MediaQuery.sizeOf(context).height * 0.04
                                : MediaQuery.sizeOf(context).height * 0.017),
                      ),
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
                height: SizeConfig.orientation == Orientation.landscape
                    ? MediaQuery.sizeOf(context).height * 0.16
                    : MediaQuery.sizeOf(context).height * 0.07,
                width: SizeConfig.orientation == Orientation.landscape
                    ? MediaQuery.sizeOf(context).width * 0.17
                    : MediaQuery.sizeOf(context).width * 0.07,
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
                  height: SizeConfig.orientation == Orientation.landscape
                      ? MediaQuery.sizeOf(context).height * 0.1
                      : MediaQuery.sizeOf(context).height * 0.046,
                ),
                Positioned(
                  top: 8,
                  child: SvgPicture.asset(
                    'assets/icons/close.svg',
                    height: SizeConfig.orientation == Orientation.landscape
                        ? MediaQuery.sizeOf(context).height * 0.043
                        : MediaQuery.sizeOf(context).height * 0.02,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

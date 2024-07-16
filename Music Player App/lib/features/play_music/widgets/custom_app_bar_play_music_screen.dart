import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/font_managers.dart';
import 'package:music_player_app/core/resources/strings_values_managers.dart';

class CustomAppBarPlayMusicScreen extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarPlayMusicScreen({super.key, required this.onPressedArrowBack});

  final void Function() onPressedArrowBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManagers.kTransparentColor,
      leading: IconButton(
        onPressed: onPressedArrowBack,
        icon: const Icon(
          Icons.arrow_back_ios,
          size: FontSizeManagers.kFontSize20,
          color: ColorManagers.kWhiteColor,
        ),
      ),
      title: const Text(
        StringsValuesManagers.nowPlaying,
        style: TextStyle(
          color: ColorManagers.kWhiteColor,
          fontSize: FontSizeManagers.kFontSize18,
          fontWeight: FontWeightManagers.kMedium,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share_outlined,
            size: FontSizeManagers.kFontSize20,
            color: ColorManagers.kWhiteColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_outlined,
            size: FontSizeManagers.kFontSize24,
            color: ColorManagers.kWhiteColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:music_player_app/controller/home_screen_controller.dart';
import 'package:music_player_app/core/resources/constants_value.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/core/resources/strings_values_managers.dart';
import 'package:music_player_app/features/main_home/widgets/custom_songs_home_screen.dart';
import 'package:music_player_app/features/main_home/widgets/custom_title_home_screen.dart';

class CustomSearchFeature extends StatelessWidget {
  const CustomSearchFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitleHomeScreen(
          title: StringsValuesManagers.searchSong,
          top: PaddingValue.kPadding32,
        ),
        CustomSongsHomeScreen(
          songsModel: ConstantsValue.listAlhan,
          onTap: (index) => HomeScreenController.navigatorToPlayMusicScreen(
              context: context, index: index),
        ),
      ],
    );
  }
}

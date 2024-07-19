import 'package:flutter/material.dart';
import 'package:music_player_app/controller/home_screen_controller.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/core/resources/strings_values_managers.dart';
import 'package:music_player_app/features/main_home/widgets/custom_songs_home_screen.dart';
import 'package:music_player_app/features/main_home/widgets/custom_title_home_screen.dart';
import 'package:music_player_app/models/songs_model.dart';

class CustomSearchFeature extends StatelessWidget {
  const CustomSearchFeature({super.key, required this.listSearch});

  final List<SongsModel> listSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitleHomeScreen(
          title: StringsValuesManagers.searchSong,
          top: PaddingValue.kPadding32,
        ),
        listSearch.isEmpty
            ? const Center(
                heightFactor: 4.5,
                child: Text(
                  'No Found Songs',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
            : CustomSongsHomeScreen(
                songsModel: listSearch,
                itemCount: listSearch.length,
                onTap: (index) =>
                    HomeScreenController.navigatorToPlayMusicScreen(
                        context: context, index: index),
              ),
      ],
    );
  }
}

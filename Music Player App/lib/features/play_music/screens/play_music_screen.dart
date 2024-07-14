import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/alignment_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';
import 'package:music_player_app/features/main_home/custom_tools_2_play_music_screen.dart';
import 'package:music_player_app/features/play_music/widgets/custom_app_bar_play_music_screen.dart';
import 'package:music_player_app/features/play_music/widgets/custom_button_controller_play_music_screen.dart';
import 'package:music_player_app/features/play_music/widgets/custom_songs_details_play_music_screen.dart';
import 'package:music_player_app/features/play_music/widgets/custom_tools_play_music_screen.dart';

class PlayMusicScreen extends StatelessWidget {
  const PlayMusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBarPlayMusicScreen(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin:
                Alignment(AlignmentManagersX.x0_20, AlignmentManagersY.y_0_98),
            end: Alignment(AlignmentManagersX.x_0_20, AlignmentManagersY.y0_98),
            colors: [
              ColorManagers.kPrimaryColor,
              ColorManagers.kDarkBlueColor,
            ],
          ),
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const CustomSongsDetailsPlayMusicScreen(),
                const SizedBox(height: HeightValuesManagers.kHeight28),
                CustomButtonControllerPlayMusicScreen(
                    onChanged: (value) {}, value: 0.5),
                const CustomToolsPlayMusicScreen(),
                const CustomTools2PlayMusicScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

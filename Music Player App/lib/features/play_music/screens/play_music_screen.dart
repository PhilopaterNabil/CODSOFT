import 'package:flutter/material.dart';
import 'package:music_player_app/controller/home_controller.dart';
import 'package:music_player_app/controller/play_music_controller.dart';
import 'package:music_player_app/core/resources/alignment_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/constants_value.dart';
import 'package:music_player_app/core/resources/height_values_managers.dart';
import 'package:music_player_app/features/main_home/custom_tools_2_play_music_screen.dart';
import 'package:music_player_app/features/play_music/widgets/custom_app_bar_play_music_screen.dart';
import 'package:music_player_app/features/play_music/widgets/custom_button_controller_play_music_screen.dart';
import 'package:music_player_app/features/play_music/widgets/custom_songs_details_play_music_screen.dart';
import 'package:music_player_app/features/play_music/widgets/custom_tools_play_music_screen.dart';

class PlayMusicScreen extends StatefulWidget {
  const PlayMusicScreen({super.key});

  @override
  State<PlayMusicScreen> createState() => _PlayMusicScreenState();
}

class _PlayMusicScreenState extends State<PlayMusicScreen> {
  @override
  void initState() {
    super.initState();
  }

  late int index;
  late PlayMusicController _playMusicController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    index = ModalRoute.of(context)!.settings.arguments as int;
    _playMusicController = PlayMusicController(index);
  }

  void disose() {
    // _playMusicController.displayAudio();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBarPlayMusicScreen(
        onPressedArrowBack: () =>
            HomeController.navigatorToPop(context: context),
      ),
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
          child: FutureBuilder(
            future: _playMusicController.play(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacer(),
                      CustomSongsDetailsPlayMusicScreen(
                          songsModel: ConstantsValue().listAlhan[index]),
                      const SizedBox(height: HeightValuesManagers.kHeight28),
                      CustomButtonControllerPlayMusicScreen(
                        onChanged: (value) {},
                        onStop: () => _playMusicController.changePlayStatus(),
                        playStatusOutputData:
                            _playMusicController.playStatusOutputData,
                        audioTime: _playMusicController
                            .transferDurationToMinuteAndSecond(snapshot.data),
                        durationNowOutputData:
                            _playMusicController.durationNowOutputData,
                        sliderValueOutputData:
                            _playMusicController.sliderValueOutputData,
                      ),
                      const CustomToolsPlayMusicScreen(),
                      const CustomTools2PlayMusicScreen(),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}

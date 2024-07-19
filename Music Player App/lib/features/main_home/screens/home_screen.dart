import 'package:flutter/material.dart';
import 'package:music_player_app/controller/home_screen_controller.dart';
import 'package:music_player_app/core/resources/alignment_managers.dart';
import 'package:music_player_app/core/resources/color_managers.dart';
import 'package:music_player_app/core/resources/constants_value.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/core/resources/strings_values_managers.dart';
import 'package:music_player_app/features/main_home/widgets/custom_recommanded_music.dart';
import 'package:music_player_app/features/main_home/widgets/custom_search_feature.dart';
import 'package:music_player_app/features/main_home/widgets/custom_text_field_home_screen.dart';
import 'package:music_player_app/features/main_home/widgets/custom_title_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController homeScreenController = HomeScreenController();

    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(AlignmentManagersX.x0_20, AlignmentManagersY.y_0_98),
          end: Alignment(AlignmentManagersX.x_0_20, AlignmentManagersY.y0_98),
          colors: [
            ColorManagers.kPrimaryColor,
            ColorManagers.kDarkBlueColor,
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFieldHomeScreen(
                onTap: () => homeScreenController.onTapOnSearchTextField(),
                onTapOutside: (event) =>
                    homeScreenController.onTapOutsideOnSearchTextField(),
              ),
              StreamBuilder(
                stream: homeScreenController.tappedOnSearchTextFieldOutputData,
                builder: (context, snapshot) {
                  if (snapshot.data == null || snapshot.data == false) {
                    return const SizedBox();
                  } else {
                    return const CustomSearchFeature();
                  }
                },
              ),
              const CustomTitleHomeScreen(
                title: StringsValuesManagers.recommandedMusic,
                top: PaddingValue.kPadding31,
              ),
              CustomRecommandedMusicHomeScreen(
                onTap: (index) =>
                    HomeScreenController.navigatorToPlayMusicScreen(
                        context: context, index: index),
                listSongsModel: ConstantsValue.listAlhan,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

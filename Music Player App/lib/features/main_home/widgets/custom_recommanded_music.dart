import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/features/main_home/widgets/custom_row_recommended_music.dart';
import 'package:music_player_app/models/songs_model.dart';

class CustomRecommandedMusicHomeScreen extends StatelessWidget {
  const CustomRecommandedMusicHomeScreen(
      {super.key, required this.onTap, required this.listSongsModel});

  final void Function() onTap;
  final List<SongsModel> listSongsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: PaddingValue.kPadding21, left: PaddingValue.kPadding8),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listSongsModel.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: onTap,
          child: CustomRowRecommandedMusic(songsModel: listSongsModel[index]),
        ),
      ),
    );
  }
}

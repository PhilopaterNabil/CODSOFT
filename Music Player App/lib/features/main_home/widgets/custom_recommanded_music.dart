import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/padding_value.dart';
import 'package:music_player_app/features/main_home/widgets/custom_row_recommended_music.dart';

class CustomRecommandedMusic extends StatelessWidget {
  const CustomRecommandedMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: PaddingValue.kPadding21, left: PaddingValue.kPadding8),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => const CustomRowRecommandedMusic(
          title: 'Magenta Riddim',
          subtitle: 'Dj Snake',
        ),
      ),
    );
  }
}

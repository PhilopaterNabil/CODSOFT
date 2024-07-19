import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/routes_managers.dart';

class HomeScreenController {
  bool tappedOnSearchTextField = false;
  late StreamController<bool> tappedOnSearchTextFieldStreamController;
  late Sink<bool> tappedOnSearchTextFieldInputData;
  late Stream<bool> tappedOnSearchTextFieldOutputData;
  HomeScreenController() {
    tappedOnSearchTextFieldStreamController = StreamController<bool>();
    tappedOnSearchTextFieldInputData =
        tappedOnSearchTextFieldStreamController.sink;
    tappedOnSearchTextFieldOutputData =
        tappedOnSearchTextFieldStreamController.stream;
    tappedOnSearchTextFieldInputData.add(tappedOnSearchTextField);
  }
  static void navigatorToPlayMusicScreen(
      {required BuildContext context, required int index}) {
    Navigator.pushNamed(context, RoutesName.kPlayMusicScreen, arguments: index);
  }

  static void navigatorToPop({required BuildContext context}) {
    Navigator.pop(context);
  }

  void onTapOnSearchTextField() {
    tappedOnSearchTextField = true;
    tappedOnSearchTextFieldInputData.add(tappedOnSearchTextField);
  }

  void dispose() {
    tappedOnSearchTextFieldInputData.close();
    tappedOnSearchTextFieldStreamController.close();
  }
}

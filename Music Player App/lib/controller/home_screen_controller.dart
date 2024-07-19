import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player_app/core/resources/routes_managers.dart';

class HomeScreenController {
  bool tappedOnSearchTextField = false;
  late StreamController<bool> tappedOnSearchTextFieldStreamController;
  late Sink<bool> tappedOnSearchTextFieldInputData;
  late Stream<bool> tappedOnSearchTextFieldOutputData;
  late StreamController<bool> closeStatusSearchTextFieldStreamController;
  late Sink<bool> closeStatusSearchTextFieldInputData;
  late Stream<bool> closeStatusSearchTextFieldOutputData;

  HomeScreenController() {
    tappedOnSearchTextFieldStreamController = StreamController<bool>();
    tappedOnSearchTextFieldInputData =
        tappedOnSearchTextFieldStreamController.sink;
    tappedOnSearchTextFieldOutputData =
        tappedOnSearchTextFieldStreamController.stream;
    closeStatusSearchTextFieldStreamController = StreamController<bool>();
    closeStatusSearchTextFieldInputData =
        closeStatusSearchTextFieldStreamController.sink;
    closeStatusSearchTextFieldOutputData =
        closeStatusSearchTextFieldStreamController.stream;
    tappedOnSearchTextFieldInputData.add(tappedOnSearchTextField);
    closeStatusSearchTextFieldInputData.add(tappedOnSearchTextField);
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
    closeStatusSearchTextFieldInputData.add(tappedOnSearchTextField);
  }

  void onTapOutsideOnSearchTextField() {
    tappedOnSearchTextField = false;
    tappedOnSearchTextFieldInputData.add(tappedOnSearchTextField);
    closeStatusSearchTextFieldInputData.add(tappedOnSearchTextField);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void dispose() {
    tappedOnSearchTextFieldInputData.close();
    tappedOnSearchTextFieldStreamController.close();
  }
}

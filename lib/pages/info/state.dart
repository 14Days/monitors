import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:observer/global/state.dart';

class InfoState implements Cloneable<InfoState>, GlobalBaseState {
  TextEditingController textController;

  @override
  InfoState clone() {
    return InfoState()
      ..globalState = this.globalState
      ..textController = this.textController
      ..currentValue = this.currentValue
      ..currentName = this.currentName;
  }

  String currentName = '';
  String currentValue = '';

  @override
  GlobalState globalState;
}

InfoState initState(Map<String, dynamic> args) {
  TextEditingController textEditingController = TextEditingController();
  return InfoState()..textController = textEditingController;
}

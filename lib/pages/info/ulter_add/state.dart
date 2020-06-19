import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:observer/global/state.dart';

import '../state.dart';

class FilterAddState implements Cloneable<FilterAddState>, GlobalBaseState {
  TextEditingController textController;

  @override
  FilterAddState clone() {
    return FilterAddState()
      ..textController = this.textController
      ..globalState = this.globalState
      ..currentName = this.currentName
      ..currentValue = this.currentValue;
  }

  String currentName = '';
  String currentValue = '';

  @override
  GlobalState globalState;
}

//FilterAddState initState(Map<String, dynamic> args) {
//  TextEditingController mailController = TextEditingController();
//  return FilterAddState()..mailController = mailController;
//}

class FilterAddConnector extends ConnOp<InfoState, FilterAddState> {
  @override
  FilterAddState get(InfoState state) {
    state.textController.text = state.currentValue;
    return FilterAddState()
      ..textController = state.textController
      ..globalState = state.globalState
      ..currentName = state.currentName
      ..currentValue = state.currentValue;
  }

  @override
  void set(InfoState state, FilterAddState subState) {
    state.textController = subState.textController;
  }
}

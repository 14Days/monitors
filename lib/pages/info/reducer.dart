import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<InfoState> buildReducer() {
  return asReducer(
    <Object, Reducer<InfoState>>{
      InfoAction.action: _onAction,
      InfoAction.enter: _onEnter,
    },
  );
}

InfoState _onAction(InfoState state, Action action) {
  final InfoState newState = state.clone();
  return newState;
}

InfoState _onEnter(InfoState state, Action action) {
  final InfoState newState = state.clone();
  println('h1');
  return newState..currentName = action.payload[0] .. currentValue = action.payload[1];
}

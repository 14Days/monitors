import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AddDeviceState> buildReducer() {
  return asReducer(
    <Object, Reducer<AddDeviceState>>{
      AddDeviceAction.action: _onAction,
    },
  );
}

AddDeviceState _onAction(AddDeviceState state, Action action) {
  final AddDeviceState newState = state.clone();
  return newState;
}

import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<DetailState>>{
      DetailAction.action: _onAction,
      DetailAction.setMonitor: _onSetMonitor,
    },
  );
}

DetailState _onAction(DetailState state, Action action) {
  final DetailState newState = state.clone();
  return newState;
}

DetailState _onSetMonitor(DetailState state, Action action) {
  final DetailState newState = state.clone();
  return newState..monitor = action.payload;
}

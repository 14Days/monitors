import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TipDialogState> buildReducer() {
  return asReducer(
    <Object, Reducer<TipDialogState>>{
      TipDialogAction.action: _onAction,
    },
  );
}

TipDialogState _onAction(TipDialogState state, Action action) {
  final TipDialogState newState = state.clone();
  return newState;
}

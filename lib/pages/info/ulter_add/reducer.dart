import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<FilterAddState> buildReducer() {
  return asReducer(
    <Object, Reducer<FilterAddState>>{
      FilterAddAction.action: _onAction,
    },
  );
}

FilterAddState _onAction(FilterAddState state, Action action) {
  final FilterAddState newState = state.clone();
  return newState;
}

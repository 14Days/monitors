import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AddDeviceState> buildEffect() {
  return combineEffects(<Object, Effect<AddDeviceState>>{
    AddDeviceAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AddDeviceState> ctx) {
}

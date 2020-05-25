import 'package:fish_redux/fish_redux.dart';
import 'package:observer/global/state.dart';

class AddDeviceState implements Cloneable<AddDeviceState>, GlobalBaseState {

  @override
  AddDeviceState clone() {
    return AddDeviceState()..globalState = globalState;
  }

  @override
  GlobalState globalState;
}

AddDeviceState initState(Map<String, dynamic> args) {
  return AddDeviceState();
}

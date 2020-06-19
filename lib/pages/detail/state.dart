import 'package:fish_redux/fish_redux.dart';
import 'package:observer/global/state.dart';
import 'package:observer/models/monitor.dart';

class DetailState implements Cloneable<DetailState>,GlobalBaseState {

  Monitor monitor;

  @override
  DetailState clone() {
    return DetailState()..monitor = monitor..globalState = globalState;
  }

  @override
  GlobalState globalState;
}

DetailState initState(Monitor monitor) {
  return DetailState()..monitor = monitor.clone();
}

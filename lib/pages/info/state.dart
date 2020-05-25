import 'package:fish_redux/fish_redux.dart';
import 'package:observer/global/state.dart';

class InfoState implements Cloneable<InfoState>, GlobalBaseState {

  @override
  InfoState clone() {
    return InfoState()..globalState = this.globalState;
  }

  @override
  GlobalState globalState;
}

InfoState initState(Map<String, dynamic> args) {
  return InfoState();
}

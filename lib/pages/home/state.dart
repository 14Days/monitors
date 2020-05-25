import 'package:fish_redux/fish_redux.dart';
import 'package:observer/global/state.dart';

class HomeState implements Cloneable<HomeState>, GlobalBaseState {

  @override
  HomeState clone() {
    return HomeState()..globalState = this.globalState;
  }

  @override
  GlobalState globalState;
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}

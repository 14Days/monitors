import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeAction { action, onRefresh }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action onRefresh() {
    return Action(HomeAction.onRefresh);
  }
}

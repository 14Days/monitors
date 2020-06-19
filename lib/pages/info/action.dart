import 'package:fish_redux/fish_redux.dart';

enum InfoAction { action, enter }

class InfoActionCreator {
  static Action onAction() {
    return const Action(InfoAction.action);
  }

  static Action pretendEnter(String currentName, String currentValue) {
    return Action(InfoAction.enter, payload: [currentName, currentValue]);
  }
}

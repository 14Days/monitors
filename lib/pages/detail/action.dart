import 'package:fish_redux/fish_redux.dart';
import 'package:observer/models/monitor.dart';

enum DetailAction { action, setMonitor, deleteMonitor }

class DetailActionCreator {
  static Action onAction() {
    return const Action(DetailAction.action);
  }

  static Action onSetMonitor(Monitor monitor) {
    return Action(DetailAction.setMonitor, payload: monitor);
  }

  static Action onDeleteMonitor() {
    return Action(DetailAction.deleteMonitor);
  }
}

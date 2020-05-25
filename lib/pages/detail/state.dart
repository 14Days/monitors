import 'package:fish_redux/fish_redux.dart';
import 'package:observer/models/monitor.dart';

class DetailState implements Cloneable<DetailState> {

  Monitor monitor;

  @override
  DetailState clone() {
    return DetailState()..monitor = monitor;
  }
}

DetailState initState(Monitor monitor) {
  return DetailState()..monitor = monitor;
}

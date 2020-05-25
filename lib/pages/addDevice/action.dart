import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AddDeviceAction { action }

class AddDeviceActionCreator {
  static Action onAction() {
    return const Action(AddDeviceAction.action);
  }
}

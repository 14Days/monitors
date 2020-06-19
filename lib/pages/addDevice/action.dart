import 'package:fish_redux/fish_redux.dart';

enum AddDeviceAction { action, onAddDevice }

class AddDeviceActionCreator {
  static Action onAction() {
    return const Action(AddDeviceAction.action);
  }

  static Action onAddDevice(int id) {
    return Action(AddDeviceAction.onAddDevice, payload: id);
  }
}

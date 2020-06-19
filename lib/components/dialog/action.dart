import 'package:fish_redux/fish_redux.dart';
//import 'package:mail/models/process.dart';

enum TipDialogAction { action, onProcess }

class TipDialogActionCreator {
  static Action onAction() {
    return const Action(TipDialogAction.action);
  }

}

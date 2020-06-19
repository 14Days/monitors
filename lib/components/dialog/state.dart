import 'package:fish_redux/fish_redux.dart';
import '../../global/state.dart';

class TipDialogState implements Cloneable<TipDialogState>,GlobalBaseState {

  @override
  TipDialogState clone() {
    return TipDialogState()..globalState = this.globalState;
  }

  @override
  GlobalState globalState;
}

TipDialogState initState(Map<String, dynamic> args) {
  return TipDialogState();
}

import 'package:fish_redux/fish_redux.dart';
import '../../global/state.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TipDialogComponent extends Component<TipDialogState> {
  TipDialogComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TipDialogState>(
                adapter: null,
                slots: <String, Dependent<TipDialogState>>{
                }),);

}

class TipDialogConnector<T> extends ConnOp<T, TipDialogState> {
  @override
  TipDialogState get(T state) {
    final GlobalBaseState s = state as GlobalBaseState;
    return TipDialogState()..globalState = s.globalState;
  }
  @override
  void set(T state, TipDialogState subState) {
    super.set(state, subState);
  }
}

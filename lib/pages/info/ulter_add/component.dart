import 'package:fish_redux/fish_redux.dart';
import 'package:observer/components/dialog/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class FilterAddComponent extends Component<FilterAddState> {
  FilterAddComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<FilterAddState>(
                adapter: null,
                slots: <String, Dependent<FilterAddState>>{
                  'loading': TipDialogConnector<FilterAddState>() + TipDialogComponent(),
                }),);

}

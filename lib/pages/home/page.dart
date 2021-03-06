import 'package:fish_redux/fish_redux.dart';
import 'package:observer/components/dialog/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HomePage extends Page<HomeState, Map<String, dynamic>> {
  HomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HomeState>(
                adapter: null,
                slots: <String, Dependent<HomeState>>{
                  'fail': TipDialogConnector<HomeState>() + TipDialogComponent(),
                }),
            middleware: <Middleware<HomeState>>[
            ],);

}

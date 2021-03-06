import 'package:fish_redux/fish_redux.dart';
import 'package:observer/components/dialog/component.dart';
import 'package:observer/models/monitor.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DetailPage extends Page<DetailState, Monitor> {
  DetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DetailState>(
                adapter: null,
                slots: <String, Dependent<DetailState>>{
                  'loading': TipDialogConnector<DetailState>() + TipDialogComponent(),
                }),
            middleware: <Middleware<DetailState>>[
            ],);

}

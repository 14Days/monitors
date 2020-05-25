import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AddDevicePage extends Page<AddDeviceState, Map<String, dynamic>> {
  AddDevicePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AddDeviceState>(
                adapter: null,
                slots: <String, Dependent<AddDeviceState>>{
                }),
            middleware: <Middleware<AddDeviceState>>[
            ],);

}

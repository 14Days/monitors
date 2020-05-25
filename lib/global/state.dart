import 'package:fish_redux/fish_redux.dart';
import 'package:observer/models/info.dart';
import 'package:observer/models/monitor.dart';
import 'package:observer/models/risk.dart';

abstract class GlobalBaseState {
  GlobalState globalState;
}

class GlobalState implements Cloneable<GlobalState> {
  List<Monitor> monitors = [
    Monitor(
        name: '心跳传感器',
        time: DateTime.now(),
        prefix: '频率',
        suffix: '次/分钟',
        value: 25.0,
      isAdded: true,
    ),
    Monitor(
      name: '血糖传感器',
      time: DateTime.now(),
      prefix: '频率',
      suffix: '次/分钟',
      value: 25.0,
      isAdded: false,
    )
  ];
  List<Risk> risks = [
    Risk(
      generator: Monitor(
          name: '心跳传感器',
          time: DateTime.now(),
          prefix: '频率',
          suffix: '次/分钟',
          value: 25.0),
      describe: '心跳频率过快',
      time: DateTime.now(),
      action: '捕获',
    )
  ];
  Info info = Info(weight: 83, tall: 166, sex: SexType.woman, birthday: DateTime.now());

  @override
  GlobalState clone() {
    return GlobalState()..monitors = this.monitors..risks = this.risks;
  }
}

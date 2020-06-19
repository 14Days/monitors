import 'package:fish_redux/fish_redux.dart';
import 'package:observer/models/info.dart';
import 'package:observer/models/monitor.dart';
import 'package:observer/models/process.dart';
import 'package:observer/models/question.dart';
import 'package:observer/models/risk.dart';

abstract class GlobalBaseState {
  GlobalState globalState;
}

class GlobalState implements Cloneable<GlobalState> {
  // 过程提示控制器
  ProcessModel process;

  // 当前监控器
  List<Monitor> monitors = [
//    Monitor(
//      name: '心跳传感器',
//      time: DateTime.now(),
//      prefix: '频率',
//      suffix: '次/分钟',
//      value: 25.0,
//      isAdded: true,
//    ),
//    Monitor(
//      name: '血糖传感器',
//      time: DateTime.now(),
//      prefix: '频率',
//      suffix: '次/分钟',
//      value: 25.0,
//      isAdded: false,
//    )
  ];

  // 设备列表
  List<Monitor> devices = [];

  // 当前警报
  List<Risk> risks = [
//    Risk(
//      generator: Monitor(
//          name: '心跳传感器',
//          time: DateTime.now(),
//          prefix: '频率',
//          suffix: '次/分钟',
//          value: 25.0),
//      describe: '心跳频率过快',
//      time: DateTime.now(),
//      action: '捕获',
//    )
  ];

  // 用户信息
  Info info = Info(weight: 0, height: 0, sex: null, birthday: null);

  Question question = Question(isQuestion: false, url: 'https://flutterchina.club/');

  // 最后刷新
  DateTime lastUpdate;

  @override
  GlobalState clone() {
    return GlobalState()
      ..monitors = this.monitors
      ..risks = this.risks
      ..info = this.info
      ..process = this.process
      ..devices = this.devices
      ..lastUpdate = this.lastUpdate
        ..question = this.question;
  }
}

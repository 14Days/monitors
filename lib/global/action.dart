import 'package:fish_redux/fish_redux.dart';
import 'package:observer/models/info.dart';
import 'package:observer/models/monitor.dart';
import 'package:observer/models/process.dart';
import 'package:observer/models/question.dart';
import 'package:observer/models/risk.dart';

enum GlobalAction {
  setProcess,
  setInfo,
  setRisks,
  setMonitors,
  setDevices,
  addDevice,
  deleteMonitor,
  pretendDeleteRisk,
  realDeleteRisk,
  setLastUpdate,
  setQuestion,
}

class GlobalActionCreator {
  static Action onProcess(ProcessModel process) {
    return Action(GlobalAction.setProcess, payload: process);
  }

  static Action onInfo(Info info) {
    return Action(GlobalAction.setInfo, payload: info);
  }

  static Action onRisks(List<Risk> risks) {
    return Action(GlobalAction.setRisks, payload: risks);
  }

  static Action onMonitors(List<Monitor> monitors) {
    return Action(GlobalAction.setMonitors, payload: monitors);
  }

  static Action onDevices(List<Monitor> devices) {
    return Action(GlobalAction.setDevices, payload: devices);
  }

  static Action onAddDevice(int id) {
    return Action(GlobalAction.addDevice, payload: id);
  }

  static Action onDeleteMonitor(int id) {
    return Action(GlobalAction.deleteMonitor, payload: id);
  }

  static Action onPretendDeleteRisk(Risk risk) {
    return Action(GlobalAction.pretendDeleteRisk, payload: risk);
  }

  static Action onRealDeleteRisk(Risk risk) {
    return Action(GlobalAction.realDeleteRisk, payload: risk);
  }

  static Action onSetLastUpdate() {
    DateTime dateTime = DateTime.now();
    return Action(GlobalAction.setLastUpdate, payload: dateTime);
  }

  static Action onSetQuestion(Question question) {
    return Action(GlobalAction.setQuestion, payload: question);
  }
}

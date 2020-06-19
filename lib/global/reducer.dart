import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:observer/global/action.dart';
import 'package:observer/models/info.dart';
import 'package:observer/models/monitor.dart';
import 'package:observer/models/process.dart';
import 'package:observer/models/question.dart';
import 'package:observer/models/risk.dart';

//import 'action.dart';
import 'state.dart';

Reducer<GlobalState> buildReducer() {
  return asReducer(
    <Object, Reducer<GlobalState>>{
//      GlobalAction.changeThemeColor: _onchangeThemeColor,
      GlobalAction.setDevices: _onSetDevices,
      GlobalAction.setMonitors: _onSetMonitors,
      GlobalAction.setInfo: _onSetInfo,
      GlobalAction.setProcess: _onSetProcess,
      GlobalAction.setRisks: _onSetRisk,
      GlobalAction.addDevice: _onAddDevice,
      GlobalAction.deleteMonitor: _onDeleteMonitor,
      GlobalAction.pretendDeleteRisk: _onPretendDeleteRisk,
      GlobalAction.realDeleteRisk: _onRealDeleteRisk,
      GlobalAction.setLastUpdate: _onSetLastUpdate,
      GlobalAction.setQuestion: _onSetQuestion,
    },
  );
}

GlobalState _onSetProcess(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  ProcessModel processModel = action.payload as ProcessModel;
  newState.process = processModel;
  return newState;
}

GlobalState _onSetInfo(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  Info info = action.payload as Info;
  newState.info = info;
  return newState;
}

GlobalState _onSetDevices(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  List<Monitor> devices = action.payload as List<Monitor>;
  newState.devices = devices;
  return newState;
}

GlobalState _onSetMonitors(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  List<Monitor> monitors = action.payload as List<Monitor>;
  newState.monitors = monitors;
  return newState;
}

GlobalState _onSetRisk(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  List<Risk> risks = action.payload as List<Risk>;
  newState.risks = risks;
  return newState;
}

GlobalState _onAddDevice(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  int id = action.payload as int;
  newState.devices.forEach((item) {
    if (item.id == id) {
      item.isAdded = true;
    }
  });
  return newState;
}

GlobalState _onDeleteMonitor(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  int id = action.payload as int;
  newState.devices.forEach((item) {
    if (item.id == id) {
      item.isAdded = false;
    }
  });
  newState.monitors = state.monitors.where((item) =>item.id != id).toList();
  return newState;
}

GlobalState _onPretendDeleteRisk(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  Risk risk = action.payload as Risk;
  newState.risks.forEach((item) {
    if (item == risk) {
      item.pretendDelete = !item.pretendDelete;
    } else {
      item.pretendDelete = false;
    }
  });
  return newState;
}

GlobalState _onRealDeleteRisk(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  Risk risk = action.payload as Risk;
  newState.risks = state.risks.where((item) => item != risk).toList();
  return newState;
}

GlobalState _onSetLastUpdate(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  DateTime dateTime = action.payload as DateTime;
  newState.lastUpdate = dateTime;
  return newState;
}

GlobalState _onSetQuestion(GlobalState state, Action action) {
  final GlobalState newState = state.clone();
  Question question = action.payload as Question;
  newState.question = question;
  return newState;
}

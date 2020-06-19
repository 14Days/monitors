import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:observer/global/action.dart';
import 'package:observer/global/store.dart';
import 'package:observer/models/monitor.dart';
import 'package:observer/models/process.dart';
import 'package:observer/services/device.dart';
import 'action.dart';
import 'state.dart';

Effect<AddDeviceState> buildEffect() {
  return combineEffects(<Object, Effect<AddDeviceState>>{
    AddDeviceAction.action: _onAction,
    Lifecycle.initState: _init,
    AddDeviceAction.onAddDevice: _onAddDevice,
  });
}

void _init(Action action, Context<AddDeviceState> ctx) {
  _loadPage(action, ctx);
}

void _loadPage(Action action, Context<AddDeviceState> ctx) {
  ProcessModel processModel =
  ProcessModel(loadingWord: '拉取中...', doneWord: '', failWord: '', isDone: false, isFail: false);
  GlobalStore.store.dispatch(GlobalActionCreator.onProcess(processModel));
  Future.delayed(Duration.zero, () => showDialog(
    context: ctx.context,
    builder: (context) {
      return WillPopScope(
        child: ctx.buildComponent('loading'),
        onWillPop: () async {
          return Future.value(false);
        },
      );
    },
  ));
      () async {
    Response response = await DeviceServices.fetchDeviceList();
    if (response.data['status'] == 'success') {
      final data = response.data['data'] as List;
      List<Monitor> devices = [];
      for (int i=0; i < data.length; i++) {
        devices.add(Monitor(id: data[i]['id'], name: data[i]['name'], isAdded: data[i]['subscribe']));
      }
      GlobalStore.store.dispatch(GlobalActionCreator.onDevices(devices));
      Navigator.of(ctx.context).pop();
    } else {
      GlobalStore.store.dispatch(GlobalActionCreator.onProcess(processModel..isFail = true..failWord = response.data['error']));
      Timer.periodic(Duration(milliseconds: 1400), (timer) {
        Navigator.of(ctx.context).pop();
        timer.cancel();
      });
    }
  }();
}

void _onAddDevice(Action action, Context<AddDeviceState> ctx) {
  int id = action.payload as int;
  GlobalStore.store.dispatch(GlobalActionCreator.onAddDevice(id));
      () async {
    Response response = await DeviceServices.addDevice(id);
    if (response.data['status'] != 'success') {
      GlobalStore.store.dispatch(GlobalActionCreator.onProcess(ProcessModel(loadingWord: '', doneWord: '', failWord: response.data['error'], isDone: false, isFail: true)));
      GlobalStore.store.dispatch(GlobalActionCreator.onDeleteMonitor(id));
      showDialog(
        context: ctx.context,
        builder: (context) {
          return WillPopScope(
            child: ctx.buildComponent('loading'),
            onWillPop: () async {
              return Future.value(false);
            },
          );
        },
      );
      Timer.periodic(Duration(milliseconds: 1400), (timer) {
        Navigator.of(ctx.context).pop();
        timer.cancel();
      });
    }
  }();
}

void _onAction(Action action, Context<AddDeviceState> ctx) {
}

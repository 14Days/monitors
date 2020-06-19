import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:observer/global/action.dart';
import 'package:observer/global/store.dart';
import 'package:observer/models/monitor.dart';
import 'package:observer/models/process.dart';
import 'package:observer/services/device.dart';
import 'action.dart';
import 'state.dart';

Effect<DetailState> buildEffect() {
  return combineEffects(<Object, Effect<DetailState>>{
    DetailAction.action: _onAction,
    Lifecycle.initState: _init,
    DetailAction.deleteMonitor: _deleteDevice,
  });
}

void _onAction(Action action, Context<DetailState> ctx) {
}

void _init(Action action, Context<DetailState> ctx) {
  _loadDevice(action, ctx);
}

void _loadDevice(Action action, Context<DetailState> ctx) {
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
    Response response = await DeviceServices.fetchDeviceDetail(ctx.state.monitor.id);
    if (response.data['status'] == 'success') {
      Monitor monitor = ctx.state.monitor.clone();
      monitor.describe = response.data['data']['describe'];
      monitor.highest24 = response.data['data']['highest24'];
      monitor.lowest24 = response.data['data']['lowest24'];
//      monitor.time = DateTime.parse(response.data['data']['time']);
      monitor.value = response.data['data']['value'];
      final topic = response.data['data']['topic'];
      await DeviceServices.fetchMessage(topic);
      ctx.dispatch(DetailActionCreator.onSetMonitor(monitor));
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

void _deleteDevice(Action action, Context<DetailState> ctx) {
  ProcessModel processModel =
  ProcessModel(loadingWord: '删除设备中...', doneWord: '', failWord: '', isDone: false, isFail: false);
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
    Response response = await DeviceServices.deleteDevice(ctx.state.monitor.id);
    if (response.data['status'] == 'success') {
      GlobalStore.store.dispatch(GlobalActionCreator.onProcess(processModel..doneWord = '设备删除成功！'..isDone = true));
      GlobalStore.store.dispatch(GlobalActionCreator.onDeleteMonitor(ctx.state.monitor.id));
      Timer.periodic(Duration(milliseconds: 1400), (timer) {
        Navigator.of(ctx.context).pop();
        Navigator.of(ctx.context).pop();
        timer.cancel();
      });
    } else {
      GlobalStore.store.dispatch(GlobalActionCreator.onProcess(processModel..isFail = true..failWord = response.data['error']));
      Timer.periodic(Duration(milliseconds: 1400), (timer) {
        Navigator.of(ctx.context).pop();
        timer.cancel();
      });
    }
  }();
}

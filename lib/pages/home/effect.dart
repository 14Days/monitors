import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:observer/global/action.dart';
import 'package:observer/global/store.dart';
import 'package:observer/models/info.dart';
import 'package:observer/models/monitor.dart';
import 'package:observer/models/process.dart';
import 'package:observer/models/question.dart';
import 'package:observer/models/risk.dart';
import 'package:observer/pages/questionPage/page.dart';
import 'package:observer/services/alert.dart';
import 'package:observer/services/question.dart';
import 'package:observer/services/subscribe.dart';
import 'package:observer/services/user.dart';
import 'package:observer/utils/simpleTime.dart';
import 'action.dart';
import 'state.dart';

Effect<HomeState> buildEffect() {
  return combineEffects(<Object, Effect<HomeState>>{
    HomeAction.action: _onAction,
    Lifecycle.initState: _init,
    HomeAction.onRefresh: _loadPage,
  });
}

void _onAction(Action action, Context<HomeState> ctx) {}

void _init(Action action, Context<HomeState> ctx) {
  _loadPage(action, ctx);
}

void _loadPage(Action action, Context<HomeState> ctx) {
  () async {
    Response alertResponse = await AlertServices.fetchAlertList();
    if (alertResponse.data['status'] == 'success') {
      final data = alertResponse.data['data'] as List;
      List<Risk> risks = [];
      data.forEach((item) {
        Risk risk = Risk(
            generator: Monitor(
                id: item['id'], place: item['place'], name: item['name']),
            describe: item['describe'],
            time: item['time'] == '' ? null : DateTime.parse(item['time']));
        risks.add(risk);
      });
      GlobalStore.store.dispatch(GlobalActionCreator.onRisks(risks));
    } else {
      ProcessModel processModel = ProcessModel(
          loadingWord: '',
          doneWord: '',
          failWord: '警报加载失败，原因是' + alertResponse.data['error'],
          isDone: false,
          isFail: true);
      GlobalStore.store.dispatch(GlobalActionCreator.onProcess(processModel));
      // showDialog 在 init 里面必须 delay 一下
      Future.delayed(Duration.zero, () {
        showDialog(
          context: ctx.context,
          builder: (context) {
            return WillPopScope(
              child: ctx.buildComponent('fail'),
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
      });
      return;
    }
    Response subscribeResponse = await SubscribeServices.fetchSubscribeList();
    if (subscribeResponse.data['status'] == 'success') {
      final data = subscribeResponse.data['data'] as List;
      List<Monitor> monitors = [];
      data.forEach((item) {
        Monitor monitor = Monitor(
            name: item['name'],
            place: item['place'],
            id: item['id'],
            value: item['value'],
            prefix: item['filed'],
            suffix: item['unit'],
//            time: DateTime.parse(item['time']),
            isAdded: true,
        );
        monitors.add(monitor);
      });
      GlobalStore.store.dispatch(GlobalActionCreator.onMonitors(monitors));
      List<Monitor> monitorCopy = [];
      monitorCopy.addAll(monitors);
      GlobalStore.store.dispatch(GlobalActionCreator.onDevices(monitorCopy));
    } else {
      ProcessModel processModel = ProcessModel(
          loadingWord: '',
          doneWord: '',
          failWord: '实时订阅加载失败，原因是' + subscribeResponse.data['error'],
          isDone: false,
          isFail: true);
      GlobalStore.store.dispatch(GlobalActionCreator.onProcess(processModel));
      // showDialog 在 init 里面必须 delay 一下
      Future.delayed(Duration.zero, () {
        showDialog(
          context: ctx.context,
          builder: (context) {
            return WillPopScope(
              child: ctx.buildComponent('fail'),
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
      });
      return;
    }
    Response infoResponse = await UserServices.fetchInfo();
    if (infoResponse.data['status'] == 'success') {
      final data = infoResponse.data['data'];
      Info info = Info(height: 0, weight: 0, sex: null, birthday: null);
      info.height = data['height'];
      info.weight = data['weight'];
      info.sex = data['sex'] == 'man' ? SexType.man : SexType.woman;
      info.birthday = DateTime.parse(data['birth']);
      GlobalStore.store.dispatch(GlobalActionCreator.onInfo(info));
    } else {
      ProcessModel processModel = ProcessModel(
          loadingWord: '',
          doneWord: '',
          failWord: '个人信息加载失败，原因是' + infoResponse.data['error'],
          isDone: false,
          isFail: true,
      );
      GlobalStore.store.dispatch(GlobalActionCreator.onProcess(processModel));
      // showDialog 在 init 里面必须 delay 一下
      Future.delayed(Duration.zero, () {
        showDialog(
          context: ctx.context,
          builder: (context) {
            return WillPopScope(
              child: ctx.buildComponent('fail'),
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
      });
      return;
    }
    GlobalStore.store.dispatch(GlobalActionCreator.onSetLastUpdate());

    Response questionResponse = await QuestionServices.fetchQuestion();
    if (questionResponse.data['status'] == 'success' && questionResponse.data['data']['isQuestion'] == true) {
      final data = questionResponse.data['data'];
      Question question = Question(isQuestion: data['isQuestion'], url: data['url']);
      GlobalStore.store.dispatch(GlobalActionCreator.onSetQuestion(question));
      ProcessModel processModel = ProcessModel(
          loadingWord: '',
          doneWord: '有新的问卷需要填写，点击进入',
          failWord: '',
          isDone: false,
          isFail: false);
      processModel.isQuestion = true;
      GlobalStore.store.dispatch(GlobalActionCreator.onProcess(processModel));
      showDialog(
        context: ctx.context,
        builder: (context) {
          return WillPopScope(
            child: ctx.buildComponent('fail'),
            onWillPop: () async {
              return Future.value(false);
            },
          );
        },
      );
    } else {

    }
  }();
}

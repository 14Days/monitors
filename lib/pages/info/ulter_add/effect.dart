import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:observer/global/action.dart';
import 'package:observer/global/store.dart';
import 'package:observer/models/info.dart';
import 'package:observer/models/process.dart';
import 'package:observer/services/user.dart';
import 'action.dart';
import 'state.dart';

Effect<FilterAddState> buildEffect() {
  return combineEffects(<Object, Effect<FilterAddState>>{
    FilterAddAction.action: _onAction,
    FilterAddAction.onAddFilter: _onAddFilter,
  });
}

void _onAction(Action action, Context<FilterAddState> ctx) {
}

Future<void> _onAddFilter(Action action, Context<FilterAddState> ctx) async {
  println(ctx.state.textController.text);
  ctx.state.textController.text = '';
  ProcessModel processModel =
  ProcessModel(loadingWord: '修改中...', doneWord: '', failWord: '', isDone: false, isFail: false);
  GlobalStore.store.dispatch(GlobalActionCreator.onProcess(processModel));
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
  // send
  Info info = ctx.state.globalState.info;
  switch(ctx.state.currentName) {
    case '身高': info.height = () {
      double a = 0;
      try {
        a = double.parse(ctx.state.textController.text);
      } catch(e) {
        println(e);
      }
      return a;
    }();
    break;
    case '体重': info.weight = () {
      double a = 0;
      try {
        a = double.parse(ctx.state.textController.text);
      } catch(e) {
        println(e);
      }
      return a;
    }();
    break;
    case '性别': info.sex = () {
      if (ctx.state.textController.text == '男') {
        return SexType.man;
      } else if (ctx.state.textController.text == '女') {
        return SexType.woman;
      }
      return null;
    }();
    break;
    default: break;
  }
  Response response = await UserServices.putInfo(info);
  if (response.data['status'] == 'success') {
    // deal with
    GlobalStore.store.dispatch(GlobalActionCreator.onInfo(info));
    Navigator.of(ctx.context).pop();
    Navigator.of(ctx.context).pop();
  } else {
    GlobalStore.store.dispatch(GlobalActionCreator.onProcess(processModel..isFail = true..failWord = response.data['error']));
    Timer.periodic(Duration(milliseconds: 1400), (timer) {
      Navigator.of(ctx.context).pop();
      timer.cancel();
    });
    println('false');
  }
}

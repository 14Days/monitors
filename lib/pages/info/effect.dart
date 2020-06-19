import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:flutter/material.dart' hide Action;
import 'package:observer/global/action.dart';
import 'package:observer/global/store.dart';
import 'package:observer/models/process.dart';
import 'package:observer/services/device.dart';
import 'action.dart';
import 'state.dart';

Effect<InfoState> buildEffect() {
  return combineEffects(<Object, Effect<InfoState>>{
    InfoAction.action: _onAction,
  });
}

void _onAction(Action action, Context<InfoState> ctx) {}

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;
import 'package:observer/pages/addDevice/page.dart';
import 'package:observer/pages/detail/page.dart';
import 'package:observer/pages/home/page.dart';
import 'package:observer/pages/info/page.dart';
import './global/state.dart';
import './global/store.dart';

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
      pages: <String, Page<Object, dynamic>>{
        'home': HomePage(),// 具名路由
        'addDevice': AddDevicePage(),
        'info': InfoPage(),
        'detail': DetailPage(),
      },
      visitor: (String path, Page<Object, dynamic> page) {
        /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
        /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
        if (page.isTypeof<GlobalBaseState>()) {
          /// 建立 AppStore 驱动 PageStore 的单向数据连接
          /// 1. 参数1 AppStore
          /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
          page.connectExtraStore<GlobalState>(GlobalStore.store,
                  (Object pagestate, GlobalState appState) {
                final GlobalBaseState p = pagestate;
                if (p.globalState != appState) {
                  if (pagestate is Cloneable) {
                    final Object copy = pagestate.clone();
                    final GlobalBaseState newState = copy;
                    newState.globalState = appState;
                    return newState;
                  }
                }
                return pagestate;
              });
        }
      });

  return MaterialApp(
    title: '健康守护',
    home: routes.buildPage('home', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

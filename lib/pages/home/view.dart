import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:observer/global/action.dart';
import 'package:observer/global/store.dart';
import 'package:observer/models/monitor.dart';
import 'package:observer/pages/home/action.dart';
import 'package:observer/utils/innerColor.dart';
import 'package:observer/utils/simpleTime.dart';

import 'state.dart';

final side = 20.0;

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  double width = MediaQuery.of(viewService.context).size.width;
  List<Monitor> activeMonitors =
      state.globalState.monitors.where((item) => item.isAdded == true).toList();
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '物联设备',
        style: TextStyle(
          color: InnerColor.title,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: InnerColor.back,
      elevation: 0,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    dispatch(HomeActionCreator.onRefresh());
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 3, left: 6, right: 6, bottom: 3),
                      color: InnerColor.operation.withOpacity(0.4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Icon(
                              Icons.refresh,
                              size: 18,
                            ),
                          ),
                          Text(
                            '上次刷新于 ' +
                                SimpleTime.trans(state.globalState.lastUpdate),
                            style: TextStyle(
                              fontSize: 14,
                              color: InnerColor.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
        Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
  //Navigator.of(viewService.context).pushNamed('info'),
              onTap: () => Navigator.of(viewService.context).pushNamed('info'),
              child: Icon(
                Icons.person,
                color: InnerColor.title,
              ),
            )),
      ],
    ),
    body: Container(
      color: InnerColor.back,
      child: ListView(
        children: <Widget>[
          state.globalState.risks.length == 0 &&
                  state.globalState.monitors.length != 0 &&
                  state.globalState.info.isFull()
              ? Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: side, top: side),
                          child: Text(
                            '非常健康！',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: InnerColor.green,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: side,
                              top: side / 2,
                              right: 2,
                              bottom: side),
                          child: Text(
                            '所有 ${state.globalState.monitors.length} 个传感器正常工作中，身体各项指标均正常。',
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 13,
                              color: InnerColor.content,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              : (state.globalState.info.isFull()
                  ? (state.globalState.monitors.length == 0 &&
                          state.globalState.risks.length == 0
                      ? Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: side, top: side),
                                  child: Text(
                                    '暂无设备',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                      color: InnerColor.operation,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: side,
                                      top: side / 2,
                                      right: 2,
                                      bottom: side),
                                  child: Text(
                                    '添加智能设备，享受健康生活。',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: InnerColor.content,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      : Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: side, top: side),
                                  child: Text(
                                    '监测到 ${state.globalState.risks.length} 项风险，请留意！',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                      color: InnerColor.red,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: side,
                                      top: side / 2,
                                      right: 2,
                                      bottom: side),
                                  child: Text(
                                    '请及时处理风险，防止病情恶化！',
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: InnerColor.content,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ))
                  : Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: side, top: side),
                              child: Text(
                                '个人信息不完整',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  color: InnerColor.operation,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: side * 1.25, left: side / 2),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: InnerColor.operation,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: side,
                                  top: side / 2,
                                  right: 2,
                                  bottom: side),
                              child: Text(
                                '全面的分析服务将在信息补全后提供。',
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: InnerColor.content,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
          state.globalState.risks.length == 0
              ? Container()
              : ListView.builder(
                  itemCount: state.globalState.risks.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(
                            left: side / 2,
                            right: side / 2,
                            top: side / 8,
                            bottom: side / 8),
                        child: GestureDetector(
                          onTap: () {
                            GlobalStore.store.dispatch(
                                GlobalActionCreator.onPretendDeleteRisk(
                                    state.globalState.risks[index]));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Color.fromRGBO(255, 72, 72, 0.2),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: side, right: side),
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: (width - side * 3) - 120,
                                      height: 90,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: side, bottom: side),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              state.globalState.risks[index]
                                                  .describe,
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: InnerColor.title,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              '来自 ${state.globalState.risks[index].generator.place} 的 ${state.globalState.risks[index].generator.name}',
                                              style: TextStyle(
                                                color: InnerColor.tip,
                                                fontSize: 14,
                                              ),
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                        width: 120,
                                        height: 90,
                                        child: state.globalState.risks[index]
                                                    .pretendDelete ==
                                                false
                                            ? Padding(
                                                padding:
                                                    EdgeInsets.only(top: side),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(
                                                      '${SimpleTime.trans(state.globalState.risks[index].time)} ${state.globalState.risks[index].action}',
                                                      style: TextStyle(
                                                        color: InnerColor.tip,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () {
                                                      GlobalStore.store.dispatch(
                                                          GlobalActionCreator
                                                              .onRealDeleteRisk(
                                                                  state.globalState
                                                                          .risks[
                                                                      index]));
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      child: Container(
                                                        color: InnerColor.red,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: side,
                                                                  right: side,
                                                                  top: side / 2,
                                                                  bottom:
                                                                      side / 2),
                                                          child: Text(
                                                            '确认了解',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color:
                                                                    InnerColor
                                                                        .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ));
                  }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () =>
                    Navigator.of(viewService.context).pushNamed('addDevice'),
                child: Padding(
                  padding: EdgeInsets.all(side),
                  child: Text(
                    '添加设备',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: InnerColor.operation,
                    ),
                  ),
                ),
              )
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: activeMonitors.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(viewService.context)
                      .pushNamed('detail', arguments: activeMonitors[index]),
                  child: Container(
                      color: InnerColor.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: side / 2,
                            bottom: side / 2,
                            left: side,
                            right: side),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                                width: 70,
                                height: 70,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: side, top: 8, bottom: 8),
                                  child: Icon(
                                    Icons.show_chart,
                                    size: 50,
                                    color: InnerColor.content,
                                  ),
                                )),
                            SizedBox(
                                width: width - side * 2 - 70 - 70,
                                height: 70,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        //${activeMonitors[index].place}的
                                        '${activeMonitors[index].name}',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: InnerColor.title),
                                      ),
                                      Text(
                                        activeMonitors[index].value == null
                                            ? '数据暂时无法获取'
                                            : activeMonitors[index]
                                                    .prefix
                                                    .toString() +
                                                ' ' +
                                                activeMonitors[index]
                                                    .value
                                                    .toString() +
                                                ' ' +
                                                activeMonitors[index]
                                                    .suffix
                                                    .toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: InnerColor.content,
                                        ),
                                        maxLines: 1,
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
//                                      activeMonitors[index].time.toString(),
                                      SimpleTime.trans(
                                          activeMonitors[index].time),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: InnerColor.tip,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                );
              }),
          state.globalState.monitors.length != 0
              ? Padding(
                  padding: EdgeInsets.all(side),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '全部 ${state.globalState.monitors.length} 个设备已经全部加载，请放心。',
                        style: TextStyle(fontSize: 12, color: InnerColor.tip),
                      )
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    ),
  );
}

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:observer/models/monitor.dart';
import 'package:observer/utils/innerColor.dart';

import 'state.dart';

final side = 20.0;

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  double width = MediaQuery.of(viewService.context).size.width;
  List<Monitor> activeMonitors = state.globalState.monitors.where((item) => item.isAdded == true).toList();
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
          padding: EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () => Navigator.of(viewService.context).pushNamed('info'),
            child: Icon(
              Icons.person,
              color: InnerColor.title,
            ),
          )
        ),
      ],
    ),
    body: Container(
      color: InnerColor.back,
      child: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: side, top: side),
                child: Text(
                  '非常健康！',
                  style: TextStyle(
                    fontSize: 30,
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
                    left: side, top: side / 2, right: 2, bottom: side / 2),
                child: Text(
                  '正常工作中',
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 14,
                    color: InnerColor.content,
                  ),
                ),
              )
            ],
          ),
          ListView.builder(
              itemCount: state.globalState.risks.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(side / 2),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          color: Color.fromRGBO(255, 72, 72, 0.2),
                          child: Padding(
                            padding: EdgeInsets.only(left: side, right: side),
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
                                          style: TextStyle(
                                            color: InnerColor.title,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          '来自 ' +
                                              state.globalState.risks[index]
                                                  .generator.name,
                                          style: TextStyle(
                                            color: InnerColor.tip,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: 120,
                                    height: 90,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: side),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            '14 分钟前 ' +
                                                state.globalState.risks[index]
                                                    .action,
                                            style: TextStyle(
                                              color: InnerColor.tip,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ))),
                );
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () =>  Navigator.of(viewService.context).pushNamed('addDevice'),
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
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(viewService.context).pushNamed('detail', arguments: activeMonitors[index]),
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
                                        activeMonitors[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: InnerColor.title),
                                      ),
                                      Text(
                                        activeMonitors[index]
                                            .prefix +
                                            ' ' +
                                            activeMonitors[index]
                                                .value
                                                .toString() +
                                            ' ' +
                                            activeMonitors[index]
                                                .suffix,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: InnerColor.content,
                                        ),
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
                                      '31 分钟前',
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
        ],
      ),
    ),
  );
}

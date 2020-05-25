import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:observer/utils/innerColor.dart';

//import 'action.dart';
import 'state.dart';

final side = 20.0;

Widget buildView(
    DetailState state, Dispatch dispatch, ViewService viewService) {
  double width = MediaQuery.of(viewService.context).size.width;
  return Scaffold(
      appBar: AppBar(
        title: Text(
          '设备详情',
          style: TextStyle(
            color: InnerColor.title,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(viewService.context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: InnerColor.title,
          ),
        ),
        elevation: 0,
        backgroundColor: InnerColor.back,
      ),
      body: Container(
        color: InnerColor.back,
        child: ListView(
          children: <Widget>[
            Container(
              color: InnerColor.white,
              child: Padding(
                padding: EdgeInsets.only(
                    top: side / 2, bottom: side / 2, left: side, right: side),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                        width: 70,
                        height: 70,
                        child: Padding(
                          padding:
                              EdgeInsets.only(right: side, top: 8, bottom: 8),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                state.monitor.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: InnerColor.title),
                              ),
                              Text(
                                state.monitor.prefix +
                                    ' ' +
                                    state.monitor.value.toString() +
                                    ' ' +
                                    state.monitor.suffix,
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
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: side, bottom: side),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // TODO
                      },
                      child: Text(
                        '删除该设备',
                        style: TextStyle(
                          fontSize: 14,
                          color: InnerColor.operation,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ));
}

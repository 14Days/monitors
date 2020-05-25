import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:observer/utils/innerColor.dart';

//import 'action.dart';
import 'state.dart';

final side = 20.0;

Widget buildView(
    AddDeviceState state, Dispatch dispatch, ViewService viewService) {
  double width = MediaQuery.of(viewService.context).size.width;
  return Scaffold(
      appBar: AppBar(
        title: Text(
          '添加设备',
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
            Padding(
              padding: EdgeInsets.all(side),
              child: Text('设备添加后，可以在设备详情页删除设备'),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: state.globalState.monitors.length,
                itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                    left: side / 2,
                    right: side / 2,
                    top: side / 4,
                    bottom: side / 4),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    color: InnerColor.white,
                    child: SizedBox(
                      width: width - side,
                      height: 90,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(side),
                              child: Icon(
                                Icons.show_chart,
                                size: 50,
                              )),
                          Expanded(
                            child: Text(
                              state.globalState.monitors[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          state.globalState.monitors[index].isAdded ? Padding(
                            padding: EdgeInsets.only(left: side, right: side),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                color: InnerColor.backDescribe,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: side,
                                      right: side,
                                      top: side / 2,
                                      bottom: side / 2),
                                  child: Text(
                                    '已添加',
                                    style: TextStyle(fontSize: 14, color: InnerColor.tip,),
                                  ),
                                ),
                              ),
                            ),
                          ) : Padding(
                            padding: EdgeInsets.only(left: side, right: side),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                color: InnerColor.backDescribe,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: side,
                                      right: side,
                                      top: side / 2,
                                      bottom: side / 2),
                                  child: Text(
                                    '添加',
                                    style: TextStyle(fontSize: 14, color: InnerColor.operation,fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ));
}

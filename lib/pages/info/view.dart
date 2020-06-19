import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:observer/models/info.dart';
import 'package:observer/pages/info/action.dart';
import 'package:observer/utils/innerColor.dart';

//import 'action.dart';
import 'state.dart';

final side = 20.0;

Widget buildView(InfoState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      appBar: AppBar(
        title: Text(
          '修改个人信息',
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
            GestureDetector(
              onTap: () {
                dispatch(InfoActionCreator.pretendEnter(
                    '身高', state.globalState.info.height.toString()));
                showDialog(
                  context: viewService.context,
                  builder: (context) {
                    return SimpleDialog(
                      children: <Widget>[
                        viewService.buildComponent('alter'),
                      ],
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.only(
                    left: side, right: side, top: side, bottom: side),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: InnerColor.title,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            '身高',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: InnerColor.title,
                            ),
                          ),
                        )
                      ],
                    )),
                    Row(
                      children: <Widget>[
                        Text(
                          state.globalState.info.height == 0
                              ? '未填写'
                              : state.globalState.info.height.toString() +
                                  ' cm',
                          style: TextStyle(
                            fontSize: 13,
                            color: InnerColor.content,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                dispatch(InfoActionCreator.pretendEnter(
                    '体重', state.globalState.info.weight.toString()));
                showDialog(
                  context: viewService.context,
                  builder: (context) {
                    return SimpleDialog(
                      children: <Widget>[
                        viewService.buildComponent('alter'),
                      ],
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.only(
                    left: side, right: side, top: side, bottom: side),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.security,
                          color: InnerColor.title,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            '体重',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: InnerColor.title,
                            ),
                          ),
                        )
                      ],
                    )),
                    Row(
                      children: <Widget>[
                        Text(
                          state.globalState.info.weight == 0
                              ? '未填写'
                              : state.globalState.info.weight.toString() +
                                  ' kg',
                          style: TextStyle(
                            fontSize: 13,
                            color: InnerColor.content,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => showDatePicker(
                context: viewService.context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                locale: Locale('zh'),
              ),
              child: Container(
                padding: EdgeInsets.only(
                    left: side, right: side, top: side, bottom: side),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.cake,
                          color: InnerColor.title,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            '生日',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: InnerColor.title,
                            ),
                          ),
                        )
                      ],
                    )),
                    Row(
                      children: <Widget>[
                        Text(
                          state.globalState.info.birthday == null
                              ? '未填写'
                              : '${state.globalState.info.birthday.year} 年 ${state.globalState.info.birthday.month} 月 ${state.globalState.info.birthday.day} 日',
                          style: TextStyle(
                            fontSize: 13,
                            color: InnerColor.content,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                dispatch(InfoActionCreator.pretendEnter('性别',
                    state.globalState.info.sex == SexType.man ? '男' : '女'));
                showDialog(
                  context: viewService.context,
                  builder: (context) {
                    return SimpleDialog(
                      children: <Widget>[
                        viewService.buildComponent('alter'),
                      ],
                    );
                  },
                );
                println('yes');
              },
              child: Container(
                padding: EdgeInsets.only(
                    left: side, right: side, top: side, bottom: side),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.title,
                          color: InnerColor.title,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            '性别',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: InnerColor.title,
                            ),
                          ),
                        )
                      ],
                    )),
                    Row(
                      children: <Widget>[
                        Text(
                          state.globalState.info.sex == null
                              ? '未填写'
                              : (state.globalState.info.sex == SexType.man
                                  ? '男'
                                  : '女'),
                          style: TextStyle(
                            fontSize: 13,
                            color: InnerColor.content,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
}

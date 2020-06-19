import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import '../../../utils/InnerColor.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(FilterAddState state, Dispatch dispatch, ViewService viewService) {
  final side = 20.0;
  println('hello');
  return SizedBox(
      width: MediaQuery.of(viewService.context).size.width,
      height: 140,
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: side / 2, left: side),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '修改' + state.currentName,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: InnerColor.content,
                      ),
                    )
                  ],
                )
            ),
            Padding(
              padding: EdgeInsets.only(top: side / 2, left: side, right: side, bottom: side),
              child: TextField(
                controller: state.textController,
                textAlign: TextAlign.left,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 16,
                ),
                autofocus: true,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(right: side),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => dispatch(FilterAddActionCreator.onAddFilter()),
                      child: Text(
                        '确认',
                        style: TextStyle(
                          fontSize: 14,
                          color: InnerColor.operation,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  ],
                )
            )
          ],
        ),
      )
  );
}

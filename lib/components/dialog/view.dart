import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:observer/utils/innerColor.dart';
import '../../utils/svg_img.dart';

//import 'action.dart';
import 'state.dart';

Widget buildView(TipDialogState state, Dispatch dispatch, ViewService viewService) {
  final side = 16.0;
  Widget content;
  if (!state.globalState.process.isDone && !state.globalState.process.isFail && !state.globalState.process.isQuestion) {
    content = Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
              width: 120,
              child: SvgPicture.string(SvgImage.ship),
            ),
            Text(
              state.globalState.process.loadingWord,
            ),
          ],
        )
    );
  } else if (state.globalState.process.isDone) {
    content = Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
              width: 120,
              child: SvgPicture.string(SvgImage.sent),
            ),
            Text(
              state.globalState.process.doneWord,
            ),
          ],
        )
    );
  } else if (state.globalState.process.isQuestion == true) {
    content = Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
              width: 80,
              child: SvgPicture.string(SvgImage.sent),
            ),
            Text(
                '您有一份新的问卷，请及时填写'
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(viewService.context).pop();
                  Navigator.of(viewService.context).pushNamed('question');
                },
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
                        '填写问卷',
                        style: TextStyle(
                            fontSize: 13,
                            color: InnerColor.operation,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
    );
  } else {
    content = Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
              width: 120,
              child: SvgPicture.string(SvgImage.fail),
            ),
            Text(
              state.globalState.process.failWord,
            ),
          ],
        )
    );
  }

  return Scaffold(
    backgroundColor: Colors.transparent,
    body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: SizedBox(
              width: 320,
              height: 160,
              child: content,
          ),
        )
    ),
  );
}

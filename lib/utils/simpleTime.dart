import 'package:fish_redux/fish_redux.dart';

class SimpleTime {
  static String trans(DateTime dateTime) {
    if (dateTime == null) {
      return '未知';
    }
    String str = '';
    DateTime now = DateTime.now();
    Duration d = now.difference(dateTime);
//    println('dateTime' + dateTime.toString());
//    println('now' + now.toString());
//    println('difference' + d.toString());
//    println('min' + d.inDays.toString());
    if (d.inDays != 0) {
      str += d.inDays.toString() + ' 天';
    } else if (d.inHours != 0) {
      str += d.inHours.toString() + ' 小时';
    } else if (d.inMinutes != 0) {
      str += d.inMinutes.toString() + ' 分钟';
    } else if (d.inSeconds != 0) {
      str += d.inSeconds.toString() + ' 秒';
    } else {
      str += '刚刚';
      return str;
    }
    if (now.isAfter(dateTime)) {
      str += '前';
    } else {
      str += '后';
    }
    return str;
  }
}

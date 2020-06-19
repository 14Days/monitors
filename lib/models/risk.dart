import 'package:observer/models/monitor.dart';

class Risk {
  Monitor generator;
  DateTime time;
  String describe;
  String action = '捕获';
  bool pretendDelete = false;
  Risk({ this.generator, this.time, this.describe, this.action = '捕获' });
}

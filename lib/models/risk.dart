import 'package:observer/models/monitor.dart';

class Risk {
  Monitor generator;
  DateTime time;
  String describe;
  String action;
  Risk({ this.generator, this.time, this.describe, this.action });
}

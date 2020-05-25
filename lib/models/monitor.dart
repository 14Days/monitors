class Monitor {
  int id;
  String name;
  double value;
  DateTime time;
  bool isAdded = false;
  String prefix = '';
  String suffix = '';
  Monitor({ this.id, this.name, this.value, this.time, this.prefix, this.suffix, this.isAdded });
}

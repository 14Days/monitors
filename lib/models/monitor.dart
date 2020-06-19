class Monitor {
  int id;
  String name;
  double value;
  DateTime time;
  bool isAdded = false;
  String prefix = '';
  String suffix = '';
  String place = '';

  Monitor(
      {this.id,
      this.name,
      this.value,
      this.time,
      this.prefix,
      this.suffix,
      this.isAdded,
      this.place});

  Monitor clone() {
    Monitor monitor = Monitor();
    return monitor
      ..id = this.id
      ..name = this.name
      ..value = this.value
      ..time = this.time
      ..isAdded = this.isAdded
      ..prefix = this.prefix
      ..suffix = this.suffix
      ..place = this.place;
  }

  // 详情使用
  String describe = '';
  double highest24;
  double lowest24;
}

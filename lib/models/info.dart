enum SexType { man, woman }

class Info {
  double height = 163.0;
  double weight = 82;
  DateTime birthday = DateTime.now();
  SexType sex = SexType.man;

  Info({ this.height, this.weight, this.birthday, this.sex });

  bool isFull() {
    if (height != 0 && weight != 0 && birthday != null && sex != null) {
      return true;
    }
    return false;
  }
}

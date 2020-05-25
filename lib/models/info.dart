enum SexType { man, woman }

class Info {
  double tall = 163.0;
  double weight = 82;
  DateTime birthday = DateTime.now();
  SexType sex = SexType.man;
  Info({ this.tall, this.weight, this.birthday, this.sex });
}

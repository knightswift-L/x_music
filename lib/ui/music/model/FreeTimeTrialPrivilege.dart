class FreeTimeTrialPrivilege {
  FreeTimeTrialPrivilege({
      this.resConsumable,
      this.userConsumable,
      this.type,
      this.remainTime,});

  FreeTimeTrialPrivilege.fromJson(dynamic json) {
    resConsumable = json['resConsumable'];
    userConsumable = json['userConsumable'];
    type = json['type'];
    remainTime = json['remainTime'];
  }
  bool? resConsumable;
  bool? userConsumable;
  int? type;
  int? remainTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resConsumable'] = resConsumable;
    map['userConsumable'] = userConsumable;
    map['type'] = type;
    map['remainTime'] = remainTime;
    return map;
  }

}
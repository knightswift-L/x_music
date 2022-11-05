class FreeTrialPrivilege {
  FreeTrialPrivilege({
      this.resConsumable, 
      this.userConsumable, 
      this.listenType,});

  FreeTrialPrivilege.fromJson(dynamic json) {
    resConsumable = json['resConsumable'];
    userConsumable = json['userConsumable'];
    listenType = json['listenType'];
  }
  bool? resConsumable;
  bool? userConsumable;
  dynamic listenType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resConsumable'] = resConsumable;
    map['userConsumable'] = userConsumable;
    map['listenType'] = listenType;
    return map;
  }

}
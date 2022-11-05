import 'FreeTrialPrivilege.dart';
import 'FreeTimeTrialPrivilege.dart';

class MusicDetailModel {
  MusicDetailModel({
      this.id, 
      this.url, 
      this.br, 
      this.size, 
      this.md5, 
      this.code, 
      this.expi, 
      this.type, 
      this.gain, 
      this.fee, 
      this.uf, 
      this.payed, 
      this.flag, 
      this.canExtend, 
      this.freeTrialInfo, 
      this.level, 
      this.encodeType, 
      this.freeTrialPrivilege, 
      this.freeTimeTrialPrivilege, 
      this.urlSource, 
      this.rightSource, 
      this.podcastCtrp, 
      this.effectTypes, 
      this.time,});

  MusicDetailModel.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    br = json['br'];
    size = json['size'];
    md5 = json['md5'];
    code = json['code'];
    expi = json['expi'];
    type = json['type'];
    gain = json['gain'];
    fee = json['fee'];
    uf = json['uf'];
    payed = json['payed'];
    flag = json['flag'];
    canExtend = json['canExtend'];
    freeTrialInfo = json['freeTrialInfo'];
    level = json['level'];
    encodeType = json['encodeType'];
    freeTrialPrivilege = json['freeTrialPrivilege'] != null ? FreeTrialPrivilege.fromJson(json['freeTrialPrivilege']) : null;
    freeTimeTrialPrivilege = json['freeTimeTrialPrivilege'] != null ? FreeTimeTrialPrivilege.fromJson(json['freeTimeTrialPrivilege']) : null;
    urlSource = json['urlSource'];
    rightSource = json['rightSource'];
    podcastCtrp = json['podcastCtrp'];
    effectTypes = json['effectTypes'];
    time = json['time'];
  }
  int? id;
  String? url;
  int? br;
  int? size;
  String? md5;
  int? code;
  int? expi;
  String? type;
  double? gain;
  int? fee;
  dynamic? uf;
  int? payed;
  int? flag;
  bool? canExtend;
  dynamic? freeTrialInfo;
  String? level;
  String? encodeType;
  FreeTrialPrivilege? freeTrialPrivilege;
  FreeTimeTrialPrivilege? freeTimeTrialPrivilege;
  int? urlSource;
  int? rightSource;
  dynamic? podcastCtrp;
  dynamic? effectTypes;
  int? time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['br'] = br;
    map['size'] = size;
    map['md5'] = md5;
    map['code'] = code;
    map['expi'] = expi;
    map['type'] = type;
    map['gain'] = gain;
    map['fee'] = fee;
    map['uf'] = uf;
    map['payed'] = payed;
    map['flag'] = flag;
    map['canExtend'] = canExtend;
    map['freeTrialInfo'] = freeTrialInfo;
    map['level'] = level;
    map['encodeType'] = encodeType;
    if (freeTrialPrivilege != null) {
      map['freeTrialPrivilege'] = freeTrialPrivilege!.toJson();
    }
    if (freeTimeTrialPrivilege != null) {
      map['freeTimeTrialPrivilege'] = freeTimeTrialPrivilege!.toJson();
    }
    map['urlSource'] = urlSource;
    map['rightSource'] = rightSource;
    map['podcastCtrp'] = podcastCtrp;
    map['effectTypes'] = effectTypes;
    map['time'] = time;
    return map;
  }

}
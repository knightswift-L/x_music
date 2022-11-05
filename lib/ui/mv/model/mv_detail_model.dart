class MvDetailModel {
  MvDetailModel({
      this.id, 
      this.url, 
      this.r, 
      this.size, 
      this.md5, 
      this.code, 
      this.expi, 
      this.fee, 
      this.mvFee, 
      this.st, 
      this.promotionVo, 
      this.msg,});

  MvDetailModel.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    r = json['r'];
    size = json['size'];
    md5 = json['md5'];
    code = json['code'];
    expi = json['expi'];
    fee = json['fee'];
    mvFee = json['mvFee'];
    st = json['st'];
    promotionVo = json['promotionVo'];
    msg = json['msg'];
  }
  int? id;
  String? url;
  int? r;
  int? size;
  String? md5;
  int? code;
  int? expi;
  int? fee;
  int? mvFee;
  int? st;
  dynamic promotionVo;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['r'] = r;
    map['size'] = size;
    map['md5'] = md5;
    map['code'] = code;
    map['expi'] = expi;
    map['fee'] = fee;
    map['mvFee'] = mvFee;
    map['st'] = st;
    map['promotionVo'] = promotionVo;
    map['msg'] = msg;
    return map;
  }

}
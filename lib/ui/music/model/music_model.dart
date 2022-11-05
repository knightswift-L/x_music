class MusicModel {
  MusicModel({
      // this.rtUrls,
      this.ar, 
      this.al, 
      this.st, 
      this.noCopyrightRcmd, 
      this.songJumpInfo, 
      this.rtype, 
      this.rurl, 
      this.pst, 
      // this.alia,
      this.pop, 
      this.rt, 
      this.mst, 
      this.cp, 
      this.crbt, 
      this.cf, 
      this.dt, 
      this.rtUrl, 
      this.ftype, 
      this.djId, 
      this.no, 
      this.fee, 
      this.mv, 
      this.t, 
      this.v, 
      this.h, 
      this.l, 
      this.sq, 
      this.hr, 
      this.cd, 
      this.a, 
      this.m, 
      this.name, 
      this.id, 
      this.privilege,});

  MusicModel.fromJson(dynamic json) {
    // if (json['rtUrls'] != null) {
    //   rtUrls = [];
    //   json['rtUrls'].forEach((v) {
    //     rtUrls?.add(Dynamic.fromJson(v));
    //   });
    // }
    if (json['ar'] != null) {
      ar = [];
      json['ar'].forEach((v) {
        ar?.add(Ar.fromJson(v));
      });
    }
    al = json['al'] != null ? Al.fromJson(json['al']) : null;
    st = json['st'];
    noCopyrightRcmd = json['noCopyrightRcmd'];
    songJumpInfo = json['songJumpInfo'];
    rtype = json['rtype'];
    rurl = json['rurl'];
    pst = json['pst'];
    // if (json['alia'] != null) {
    //   alia = [];
    //   json['alia'].forEach((v) {
    //     alia?.add(Dynamic.fromJson(v));
    //   });
    // }
    pop = json['pop'];
    rt = json['rt'];
    mst = json['mst'];
    cp = json['cp'];
    crbt = json['crbt'];
    cf = json['cf'];
    dt = json['dt'];
    rtUrl = json['rtUrl'];
    ftype = json['ftype'];
    djId = json['djId'];
    no = json['no'];
    fee = json['fee'];
    mv = json['mv'];
    t = json['t'];
    v = json['v'];
    h = json['h'] != null ? H.fromJson(json['h']) : null;
    l = json['l'] != null ? L.fromJson(json['l']) : null;
    sq = json['sq'] != null ? Sq.fromJson(json['sq']) : null;
    hr = json['hr'];
    cd = json['cd'];
    a = json['a'];
    m = json['m'] != null ? M.fromJson(json['m']) : null;
    name = json['name'];
    id = json['id'];
    privilege = json['privilege'] != null ? Privilege.fromJson(json['privilege']) : null;
  }
  // List<dynamic>? rtUrls;
  List<Ar>? ar;
  Al? al;
  num? st;
  dynamic noCopyrightRcmd;
  dynamic songJumpInfo;
  num? rtype;
  dynamic rurl;
  num? pst;
  // List<dynamic>? alia;
  num? pop;
  dynamic rt;
  num? mst;
  num? cp;
  dynamic crbt;
  String? cf;
  num? dt;
  dynamic rtUrl;
  num? ftype;
  num? djId;
  num? no;
  num? fee;
  num? mv;
  num? t;
  num? v;
  H? h;
  L? l;
  Sq? sq;
  dynamic hr;
  String? cd;
  dynamic a;
  M? m;
  String? name;
  num? id;
  Privilege? privilege;
MusicModel copyWith({  List<dynamic>? rtUrls,
  List<Ar>? ar,
  Al? al,
  num? st,
  dynamic noCopyrightRcmd,
  dynamic songJumpInfo,
  num? rtype,
  dynamic rurl,
  num? pst,
  List<dynamic>? alia,
  num? pop,
  dynamic rt,
  num? mst,
  num? cp,
  dynamic crbt,
  String? cf,
  num? dt,
  dynamic rtUrl,
  num? ftype,
  num? djId,
  num? no,
  num? fee,
  num? mv,
  num? t,
  num? v,
  H? h,
  L? l,
  Sq? sq,
  dynamic hr,
  String? cd,
  dynamic a,
  M? m,
  String? name,
  num? id,
  Privilege? privilege,
}) => MusicModel(
  // rtUrls: rtUrls ?? this.rtUrls,
  ar: ar ?? this.ar,
  al: al ?? this.al,
  st: st ?? this.st,
  noCopyrightRcmd: noCopyrightRcmd ?? this.noCopyrightRcmd,
  songJumpInfo: songJumpInfo ?? this.songJumpInfo,
  rtype: rtype ?? this.rtype,
  rurl: rurl ?? this.rurl,
  pst: pst ?? this.pst,
  // alia: alia ?? this.alia,
  pop: pop ?? this.pop,
  rt: rt ?? this.rt,
  mst: mst ?? this.mst,
  cp: cp ?? this.cp,
  crbt: crbt ?? this.crbt,
  cf: cf ?? this.cf,
  dt: dt ?? this.dt,
  rtUrl: rtUrl ?? this.rtUrl,
  ftype: ftype ?? this.ftype,
  djId: djId ?? this.djId,
  no: no ?? this.no,
  fee: fee ?? this.fee,
  mv: mv ?? this.mv,
  t: t ?? this.t,
  v: v ?? this.v,
  h: h ?? this.h,
  l: l ?? this.l,
  sq: sq ?? this.sq,
  hr: hr ?? this.hr,
  cd: cd ?? this.cd,
  a: a ?? this.a,
  m: m ?? this.m,
  name: name ?? this.name,
  id: id ?? this.id,
  privilege: privilege ?? this.privilege,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    // if (rtUrls != null) {
    //   map['rtUrls'] = rtUrls?.map((v) => v.toJson()).toList();
    // }
    if (ar != null) {
      map['ar'] = ar?.map((v) => v.toJson()).toList();
    }
    if (al != null) {
      map['al'] = al?.toJson();
    }
    map['st'] = st;
    map['noCopyrightRcmd'] = noCopyrightRcmd;
    map['songJumpInfo'] = songJumpInfo;
    map['rtype'] = rtype;
    map['rurl'] = rurl;
    map['pst'] = pst;
    // if (alia != null) {
    //   map['alia'] = alia?.map((v) => v.toJson()).toList();
    // }
    map['pop'] = pop;
    map['rt'] = rt;
    map['mst'] = mst;
    map['cp'] = cp;
    map['crbt'] = crbt;
    map['cf'] = cf;
    map['dt'] = dt;
    map['rtUrl'] = rtUrl;
    map['ftype'] = ftype;
    map['djId'] = djId;
    map['no'] = no;
    map['fee'] = fee;
    map['mv'] = mv;
    map['t'] = t;
    map['v'] = v;
    if (h != null) {
      map['h'] = h?.toJson();
    }
    if (l != null) {
      map['l'] = l?.toJson();
    }
    if (sq != null) {
      map['sq'] = sq?.toJson();
    }
    map['hr'] = hr;
    map['cd'] = cd;
    map['a'] = a;
    if (m != null) {
      map['m'] = m?.toJson();
    }
    map['name'] = name;
    map['id'] = id;
    if (privilege != null) {
      map['privilege'] = privilege?.toJson();
    }
    return map;
  }

}

class Privilege {
  Privilege({
      this.id, 
      this.fee, 
      this.payed, 
      this.st, 
      this.pl, 
      this.dl, 
      this.sp, 
      this.cp, 
      this.subp, 
      this.cs, 
      this.maxbr, 
      this.fl, 
      this.toast, 
      this.flag, 
      this.preSell, 
      this.playMaxbr, 
      this.downloadMaxbr, 
      this.maxBrLevel, 
      this.playMaxBrLevel, 
      this.downloadMaxBrLevel, 
      this.plLevel, 
      this.dlLevel, 
      this.flLevel, 
      this.rscl, 
      this.freeTrialPrivilege, 
      this.chargeInfoList,});

  Privilege.fromJson(dynamic json) {
    id = json['id'];
    fee = json['fee'];
    payed = json['payed'];
    st = json['st'];
    pl = json['pl'];
    dl = json['dl'];
    sp = json['sp'];
    cp = json['cp'];
    subp = json['subp'];
    cs = json['cs'];
    maxbr = json['maxbr'];
    fl = json['fl'];
    toast = json['toast'];
    flag = json['flag'];
    preSell = json['preSell'];
    playMaxbr = json['playMaxbr'];
    downloadMaxbr = json['downloadMaxbr'];
    maxBrLevel = json['maxBrLevel'];
    playMaxBrLevel = json['playMaxBrLevel'];
    downloadMaxBrLevel = json['downloadMaxBrLevel'];
    plLevel = json['plLevel'];
    dlLevel = json['dlLevel'];
    flLevel = json['flLevel'];
    rscl = json['rscl'];
    freeTrialPrivilege = json['freeTrialPrivilege'] != null ? FreeTrialPrivilege.fromJson(json['freeTrialPrivilege']) : null;
    if (json['chargeInfoList'] != null) {
      chargeInfoList = [];
      json['chargeInfoList'].forEach((v) {
        chargeInfoList?.add(ChargeInfoList.fromJson(v));
      });
    }
  }
  num? id;
  num? fee;
  num? payed;
  num? st;
  num? pl;
  num? dl;
  num? sp;
  num? cp;
  num? subp;
  bool? cs;
  num? maxbr;
  num? fl;
  bool? toast;
  num? flag;
  bool? preSell;
  num? playMaxbr;
  num? downloadMaxbr;
  String? maxBrLevel;
  String? playMaxBrLevel;
  String? downloadMaxBrLevel;
  String? plLevel;
  String? dlLevel;
  String? flLevel;
  dynamic rscl;
  FreeTrialPrivilege? freeTrialPrivilege;
  List<ChargeInfoList>? chargeInfoList;
Privilege copyWith({  num? id,
  num? fee,
  num? payed,
  num? st,
  num? pl,
  num? dl,
  num? sp,
  num? cp,
  num? subp,
  bool? cs,
  num? maxbr,
  num? fl,
  bool? toast,
  num? flag,
  bool? preSell,
  num? playMaxbr,
  num? downloadMaxbr,
  String? maxBrLevel,
  String? playMaxBrLevel,
  String? downloadMaxBrLevel,
  String? plLevel,
  String? dlLevel,
  String? flLevel,
  dynamic rscl,
  FreeTrialPrivilege? freeTrialPrivilege,
  List<ChargeInfoList>? chargeInfoList,
}) => Privilege(  id: id ?? this.id,
  fee: fee ?? this.fee,
  payed: payed ?? this.payed,
  st: st ?? this.st,
  pl: pl ?? this.pl,
  dl: dl ?? this.dl,
  sp: sp ?? this.sp,
  cp: cp ?? this.cp,
  subp: subp ?? this.subp,
  cs: cs ?? this.cs,
  maxbr: maxbr ?? this.maxbr,
  fl: fl ?? this.fl,
  toast: toast ?? this.toast,
  flag: flag ?? this.flag,
  preSell: preSell ?? this.preSell,
  playMaxbr: playMaxbr ?? this.playMaxbr,
  downloadMaxbr: downloadMaxbr ?? this.downloadMaxbr,
  maxBrLevel: maxBrLevel ?? this.maxBrLevel,
  playMaxBrLevel: playMaxBrLevel ?? this.playMaxBrLevel,
  downloadMaxBrLevel: downloadMaxBrLevel ?? this.downloadMaxBrLevel,
  plLevel: plLevel ?? this.plLevel,
  dlLevel: dlLevel ?? this.dlLevel,
  flLevel: flLevel ?? this.flLevel,
  rscl: rscl ?? this.rscl,
  freeTrialPrivilege: freeTrialPrivilege ?? this.freeTrialPrivilege,
  chargeInfoList: chargeInfoList ?? this.chargeInfoList,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fee'] = fee;
    map['payed'] = payed;
    map['st'] = st;
    map['pl'] = pl;
    map['dl'] = dl;
    map['sp'] = sp;
    map['cp'] = cp;
    map['subp'] = subp;
    map['cs'] = cs;
    map['maxbr'] = maxbr;
    map['fl'] = fl;
    map['toast'] = toast;
    map['flag'] = flag;
    map['preSell'] = preSell;
    map['playMaxbr'] = playMaxbr;
    map['downloadMaxbr'] = downloadMaxbr;
    map['maxBrLevel'] = maxBrLevel;
    map['playMaxBrLevel'] = playMaxBrLevel;
    map['downloadMaxBrLevel'] = downloadMaxBrLevel;
    map['plLevel'] = plLevel;
    map['dlLevel'] = dlLevel;
    map['flLevel'] = flLevel;
    map['rscl'] = rscl;
    if (freeTrialPrivilege != null) {
      map['freeTrialPrivilege'] = freeTrialPrivilege?.toJson();
    }
    if (chargeInfoList != null) {
      map['chargeInfoList'] = chargeInfoList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ChargeInfoList {
  ChargeInfoList({
      this.rate, 
      this.chargeUrl, 
      this.chargeMessage, 
      this.chargeType,});

  ChargeInfoList.fromJson(dynamic json) {
    rate = json['rate'];
    chargeUrl = json['chargeUrl'];
    chargeMessage = json['chargeMessage'];
    chargeType = json['chargeType'];
  }
  num? rate;
  dynamic chargeUrl;
  dynamic chargeMessage;
  num? chargeType;
ChargeInfoList copyWith({  num? rate,
  dynamic chargeUrl,
  dynamic chargeMessage,
  num? chargeType,
}) => ChargeInfoList(  rate: rate ?? this.rate,
  chargeUrl: chargeUrl ?? this.chargeUrl,
  chargeMessage: chargeMessage ?? this.chargeMessage,
  chargeType: chargeType ?? this.chargeType,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rate'] = rate;
    map['chargeUrl'] = chargeUrl;
    map['chargeMessage'] = chargeMessage;
    map['chargeType'] = chargeType;
    return map;
  }

}

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
FreeTrialPrivilege copyWith({  bool? resConsumable,
  bool? userConsumable,
  dynamic listenType,
}) => FreeTrialPrivilege(  resConsumable: resConsumable ?? this.resConsumable,
  userConsumable: userConsumable ?? this.userConsumable,
  listenType: listenType ?? this.listenType,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resConsumable'] = resConsumable;
    map['userConsumable'] = userConsumable;
    map['listenType'] = listenType;
    return map;
  }

}

class M {
  M({
      this.br, 
      this.fid, 
      this.size, 
      this.vd, 
      this.sr,});

  M.fromJson(dynamic json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = json['vd'];
    sr = json['sr'];
  }
  num? br;
  num? fid;
  num? size;
  num? vd;
  num? sr;
M copyWith({  num? br,
  num? fid,
  num? size,
  num? vd,
  num? sr,
}) => M(  br: br ?? this.br,
  fid: fid ?? this.fid,
  size: size ?? this.size,
  vd: vd ?? this.vd,
  sr: sr ?? this.sr,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['br'] = br;
    map['fid'] = fid;
    map['size'] = size;
    map['vd'] = vd;
    map['sr'] = sr;
    return map;
  }

}

class Sq {
  Sq({
      this.br, 
      this.fid, 
      this.size, 
      this.vd, 
      this.sr,});

  Sq.fromJson(dynamic json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = json['vd'];
    sr = json['sr'];
  }
  num? br;
  num? fid;
  num? size;
  num? vd;
  num? sr;
Sq copyWith({  num? br,
  num? fid,
  num? size,
  num? vd,
  num? sr,
}) => Sq(  br: br ?? this.br,
  fid: fid ?? this.fid,
  size: size ?? this.size,
  vd: vd ?? this.vd,
  sr: sr ?? this.sr,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['br'] = br;
    map['fid'] = fid;
    map['size'] = size;
    map['vd'] = vd;
    map['sr'] = sr;
    return map;
  }

}

class L {
  L({
      this.br, 
      this.fid, 
      this.size, 
      this.vd, 
      this.sr,});

  L.fromJson(dynamic json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = json['vd'];
    sr = json['sr'];
  }
  num? br;
  num? fid;
  num? size;
  num? vd;
  num? sr;
L copyWith({  num? br,
  num? fid,
  num? size,
  num? vd,
  num? sr,
}) => L(  br: br ?? this.br,
  fid: fid ?? this.fid,
  size: size ?? this.size,
  vd: vd ?? this.vd,
  sr: sr ?? this.sr,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['br'] = br;
    map['fid'] = fid;
    map['size'] = size;
    map['vd'] = vd;
    map['sr'] = sr;
    return map;
  }

}

class H {
  H({
      this.br, 
      this.fid, 
      this.size, 
      this.vd, 
      this.sr,});

  H.fromJson(dynamic json) {
    br = json['br'];
    fid = json['fid'];
    size = json['size'];
    vd = json['vd'];
    sr = json['sr'];
  }
  num? br;
  num? fid;
  num? size;
  num? vd;
  num? sr;
H copyWith({  num? br,
  num? fid,
  num? size,
  num? vd,
  num? sr,
}) => H(  br: br ?? this.br,
  fid: fid ?? this.fid,
  size: size ?? this.size,
  vd: vd ?? this.vd,
  sr: sr ?? this.sr,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['br'] = br;
    map['fid'] = fid;
    map['size'] = size;
    map['vd'] = vd;
    map['sr'] = sr;
    return map;
  }

}

class Al {
  Al({
      this.id, 
      this.name, 
      this.picStr, 
      this.pic, 
      this.alia,});

  Al.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    picStr = json['pic_str'];
    pic = json['pic'];
    alia = json['alia'] != null ? json['alia'].cast<String>() : [];
  }
  num? id;
  String? name;
  String? picStr;
  num? pic;
  List<String>? alia;
Al copyWith({  num? id,
  String? name,
  String? picStr,
  num? pic,
  List<String>? alia,
}) => Al(  id: id ?? this.id,
  name: name ?? this.name,
  picStr: picStr ?? this.picStr,
  pic: pic ?? this.pic,
  alia: alia ?? this.alia,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['pic_str'] = picStr;
    map['pic'] = pic;
    map['alia'] = alia;
    return map;
  }

}

class Ar {
  Ar({
      this.id, 
      this.name,});

  Ar.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;
Ar copyWith({  num? id,
  String? name,
}) => Ar(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}
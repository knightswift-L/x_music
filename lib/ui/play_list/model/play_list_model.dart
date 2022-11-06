class PlayListModel {
  PlayListModel({
      this.name, 
      this.id, 
      this.trackNumberUpdateTime, 
      this.status, 
      this.userId, 
      this.createTime, 
      this.updateTime, 
      this.subscribedCount, 
      this.trackCount, 
      this.cloudTrackCount, 
      this.coverImgUrl, 
      this.coverImgId, 
      this.description, 
      this.tags, 
      this.playCount, 
      this.trackUpdateTime, 
      this.specialType, 
      this.totalDuration, 
      this.creator, 
      this.tracks, 
      this.subscribers, 
      this.subscribed, 
      this.commentThreadId, 
      this.newImported, 
      this.adType, 
      this.highQuality, 
      this.privacy, 
      this.ordered, 
      this.anonimous, 
      this.coverStatus, 
      this.recommendInfo, 
      this.shareCount, 
      this.alg, 
      this.commentCount,});

  PlayListModel.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    trackNumberUpdateTime = json['trackNumberUpdateTime'];
    status = json['status'];
    userId = json['userId'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    subscribedCount = json['subscribedCount'];
    trackCount = json['trackCount'];
    cloudTrackCount = json['cloudTrackCount'];
    coverImgUrl = json['coverImgUrl'];
    coverImgId = json['coverImgId'];
    description = json['description'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    playCount = json['playCount'];
    trackUpdateTime = json['trackUpdateTime'];
    specialType = json['specialType'];
    totalDuration = json['totalDuration'];
    creator = json['creator'] != null ? AccountInfo.fromJson(json['creator']) : null;
    tracks = json['tracks'];
    if (json['subscribers'] != null) {
      subscribers = [];
      json['subscribers'].forEach((v) {
        subscribers?.add(AccountInfo.fromJson(v));
      });
    }
    subscribed = json['subscribed'];
    commentThreadId = json['commentThreadId'];
    newImported = json['newImported'];
    adType = json['adType'];
    highQuality = json['highQuality'];
    privacy = json['privacy'];
    ordered = json['ordered'];
    anonimous = json['anonimous'];
    coverStatus = json['coverStatus'];
    recommendInfo = json['recommendInfo'];
    shareCount = json['shareCount'];
    alg = json['alg'];
    commentCount = json['commentCount'];
  }
  String? name;
  num? id;
  num? trackNumberUpdateTime;
  num? status;
  num? userId;
  num? createTime;
  num? updateTime;
  num? subscribedCount;
  num? trackCount;
  num? cloudTrackCount;
  String? coverImgUrl;
  num? coverImgId;
  String? description;
  List<String>? tags;
  num? playCount;
  num? trackUpdateTime;
  num? specialType;
  num? totalDuration;
  AccountInfo? creator;
  dynamic tracks;
  List<AccountInfo>? subscribers;
  bool? subscribed;
  String? commentThreadId;
  bool? newImported;
  num? adType;
  bool? highQuality;
  num? privacy;
  bool? ordered;
  bool? anonimous;
  num? coverStatus;
  dynamic recommendInfo;
  num? shareCount;
  String? alg;
  num? commentCount;
PlayListModel copyWith({  String? name,
  num? id,
  num? trackNumberUpdateTime,
  num? status,
  num? userId,
  num? createTime,
  num? updateTime,
  num? subscribedCount,
  num? trackCount,
  num? cloudTrackCount,
  String? coverImgUrl,
  num? coverImgId,
  String? description,
  List<String>? tags,
  num? playCount,
  num? trackUpdateTime,
  num? specialType,
  num? totalDuration,
  AccountInfo? creator,
  dynamic tracks,
  List<AccountInfo>? subscribers,
  bool? subscribed,
  String? commentThreadId,
  bool? newImported,
  num? adType,
  bool? highQuality,
  num? privacy,
  bool? ordered,
  bool? anonimous,
  num? coverStatus,
  dynamic recommendInfo,
  num? shareCount,
  String? alg,
  num? commentCount,
}) => PlayListModel(  name: name ?? this.name,
  id: id ?? this.id,
  trackNumberUpdateTime: trackNumberUpdateTime ?? this.trackNumberUpdateTime,
  status: status ?? this.status,
  userId: userId ?? this.userId,
  createTime: createTime ?? this.createTime,
  updateTime: updateTime ?? this.updateTime,
  subscribedCount: subscribedCount ?? this.subscribedCount,
  trackCount: trackCount ?? this.trackCount,
  cloudTrackCount: cloudTrackCount ?? this.cloudTrackCount,
  coverImgUrl: coverImgUrl ?? this.coverImgUrl,
  coverImgId: coverImgId ?? this.coverImgId,
  description: description ?? this.description,
  tags: tags ?? this.tags,
  playCount: playCount ?? this.playCount,
  trackUpdateTime: trackUpdateTime ?? this.trackUpdateTime,
  specialType: specialType ?? this.specialType,
  totalDuration: totalDuration ?? this.totalDuration,
  creator: creator ?? this.creator,
  tracks: tracks ?? this.tracks,
  subscribers: subscribers ?? this.subscribers,
  subscribed: subscribed ?? this.subscribed,
  commentThreadId: commentThreadId ?? this.commentThreadId,
  newImported: newImported ?? this.newImported,
  adType: adType ?? this.adType,
  highQuality: highQuality ?? this.highQuality,
  privacy: privacy ?? this.privacy,
  ordered: ordered ?? this.ordered,
  anonimous: anonimous ?? this.anonimous,
  coverStatus: coverStatus ?? this.coverStatus,
  recommendInfo: recommendInfo ?? this.recommendInfo,
  shareCount: shareCount ?? this.shareCount,
  alg: alg ?? this.alg,
  commentCount: commentCount ?? this.commentCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['trackNumberUpdateTime'] = trackNumberUpdateTime;
    map['status'] = status;
    map['userId'] = userId;
    map['createTime'] = createTime;
    map['updateTime'] = updateTime;
    map['subscribedCount'] = subscribedCount;
    map['trackCount'] = trackCount;
    map['cloudTrackCount'] = cloudTrackCount;
    map['coverImgUrl'] = coverImgUrl;
    map['coverImgId'] = coverImgId;
    map['description'] = description;
    map['tags'] = tags;
    map['playCount'] = playCount;
    map['trackUpdateTime'] = trackUpdateTime;
    map['specialType'] = specialType;
    map['totalDuration'] = totalDuration;
    if (creator != null) {
      map['creator'] = creator?.toJson();
    }
    map['tracks'] = tracks;
    if (subscribers != null) {
      map['subscribers'] = subscribers?.map((v) => v.toJson()).toList();
    }
    map['subscribed'] = subscribed;
    map['commentThreadId'] = commentThreadId;
    map['newImported'] = newImported;
    map['adType'] = adType;
    map['highQuality'] = highQuality;
    map['privacy'] = privacy;
    map['ordered'] = ordered;
    map['anonimous'] = anonimous;
    map['coverStatus'] = coverStatus;
    map['recommendInfo'] = recommendInfo;
    map['shareCount'] = shareCount;
    map['alg'] = alg;
    map['commentCount'] = commentCount;
    return map;
  }

}

class AccountInfo {
  AccountInfo({
      this.defaultAvatar, 
      this.province, 
      this.authStatus, 
      this.followed, 
      this.avatarUrl, 
      this.accountStatus, 
      this.gender, 
      this.city, 
      this.birthday, 
      this.userId, 
      this.userType, 
      this.nickname, 
      this.signature, 
      this.description, 
      this.detailDescription, 
      this.avatarImgId, 
      this.backgroundImgId, 
      this.backgroundUrl, 
      this.authority, 
      this.mutual, 
      this.expertTags, 
      this.experts, 
      this.djStatus, 
      this.vipType, 
      this.remarkName, 
      this.authenticationTypes, 
      this.avatarDetail, 
      this.backgroundImgIdStr, 
      this.avatarImgIdStr, 
      this.anchor,});

  AccountInfo.fromJson(dynamic json) {
    defaultAvatar = json['defaultAvatar'];
    province = json['province'];
    authStatus = json['authStatus'];
    followed = json['followed'];
    avatarUrl = json['avatarUrl'];
    accountStatus = json['accountStatus'];
    gender = json['gender'];
    city = json['city'];
    birthday = json['birthday'];
    userId = json['userId'];
    userType = json['userType'];
    nickname = json['nickname'];
    signature = json['signature'];
    description = json['description'];
    detailDescription = json['detailDescription'];
    avatarImgId = json['avatarImgId'];
    backgroundImgId = json['backgroundImgId'];
    backgroundUrl = json['backgroundUrl'];
    authority = json['authority'];
    mutual = json['mutual'];
    expertTags = json['expertTags'];
    experts = json['experts'];
    djStatus = json['djStatus'];
    vipType = json['vipType'];
    remarkName = json['remarkName'];
    authenticationTypes = json['authenticationTypes'];
    avatarDetail = json['avatarDetail'];
    backgroundImgIdStr = json['backgroundImgIdStr'];
    avatarImgIdStr = json['avatarImgIdStr'];
    anchor = json['anchor'];
  }
  bool? defaultAvatar;
  num? province;
  num? authStatus;
  bool? followed;
  String? avatarUrl;
  num? accountStatus;
  num? gender;
  num? city;
  num? birthday;
  num? userId;
  num? userType;
  String? nickname;
  String? signature;
  String? description;
  String? detailDescription;
  num? avatarImgId;
  num? backgroundImgId;
  String? backgroundUrl;
  num? authority;
  bool? mutual;
  dynamic expertTags;
  dynamic experts;
  num? djStatus;
  num? vipType;
  dynamic remarkName;
  num? authenticationTypes;
  dynamic avatarDetail;
  String? backgroundImgIdStr;
  String? avatarImgIdStr;
  bool? anchor;
AccountInfo copyWith({  bool? defaultAvatar,
  num? province,
  num? authStatus,
  bool? followed,
  String? avatarUrl,
  num? accountStatus,
  num? gender,
  num? city,
  num? birthday,
  num? userId,
  num? userType,
  String? nickname,
  String? signature,
  String? description,
  String? detailDescription,
  num? avatarImgId,
  num? backgroundImgId,
  String? backgroundUrl,
  num? authority,
  bool? mutual,
  dynamic expertTags,
  dynamic experts,
  num? djStatus,
  num? vipType,
  dynamic remarkName,
  num? authenticationTypes,
  dynamic avatarDetail,
  String? backgroundImgIdStr,
  String? avatarImgIdStr,
  bool? anchor,
}) => AccountInfo(  defaultAvatar: defaultAvatar ?? this.defaultAvatar,
  province: province ?? this.province,
  authStatus: authStatus ?? this.authStatus,
  followed: followed ?? this.followed,
  avatarUrl: avatarUrl ?? this.avatarUrl,
  accountStatus: accountStatus ?? this.accountStatus,
  gender: gender ?? this.gender,
  city: city ?? this.city,
  birthday: birthday ?? this.birthday,
  userId: userId ?? this.userId,
  userType: userType ?? this.userType,
  nickname: nickname ?? this.nickname,
  signature: signature ?? this.signature,
  description: description ?? this.description,
  detailDescription: detailDescription ?? this.detailDescription,
  avatarImgId: avatarImgId ?? this.avatarImgId,
  backgroundImgId: backgroundImgId ?? this.backgroundImgId,
  backgroundUrl: backgroundUrl ?? this.backgroundUrl,
  authority: authority ?? this.authority,
  mutual: mutual ?? this.mutual,
  expertTags: expertTags ?? this.expertTags,
  experts: experts ?? this.experts,
  djStatus: djStatus ?? this.djStatus,
  vipType: vipType ?? this.vipType,
  remarkName: remarkName ?? this.remarkName,
  authenticationTypes: authenticationTypes ?? this.authenticationTypes,
  avatarDetail: avatarDetail ?? this.avatarDetail,
  backgroundImgIdStr: backgroundImgIdStr ?? this.backgroundImgIdStr,
  avatarImgIdStr: avatarImgIdStr ?? this.avatarImgIdStr,
  anchor: anchor ?? this.anchor,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['defaultAvatar'] = defaultAvatar;
    map['province'] = province;
    map['authStatus'] = authStatus;
    map['followed'] = followed;
    map['avatarUrl'] = avatarUrl;
    map['accountStatus'] = accountStatus;
    map['gender'] = gender;
    map['city'] = city;
    map['birthday'] = birthday;
    map['userId'] = userId;
    map['userType'] = userType;
    map['nickname'] = nickname;
    map['signature'] = signature;
    map['description'] = description;
    map['detailDescription'] = detailDescription;
    map['avatarImgId'] = avatarImgId;
    map['backgroundImgId'] = backgroundImgId;
    map['backgroundUrl'] = backgroundUrl;
    map['authority'] = authority;
    map['mutual'] = mutual;
    map['expertTags'] = expertTags;
    map['experts'] = experts;
    map['djStatus'] = djStatus;
    map['vipType'] = vipType;
    map['remarkName'] = remarkName;
    map['authenticationTypes'] = authenticationTypes;
    map['avatarDetail'] = avatarDetail;
    map['backgroundImgIdStr'] = backgroundImgIdStr;
    map['avatarImgIdStr'] = avatarImgIdStr;
    map['anchor'] = anchor;
    return map;
  }

}

class AvatarDetail {
  AvatarDetail({
      this.userType, 
      this.identityLevel, 
      this.identityIconUrl,});

  AvatarDetail.fromJson(dynamic json) {
    userType = json['userType'];
    identityLevel = json['identityLevel'];
    identityIconUrl = json['identityIconUrl'];
  }
  num? userType;
  num? identityLevel;
  String? identityIconUrl;
AvatarDetail copyWith({  num? userType,
  num? identityLevel,
  String? identityIconUrl,
}) => AvatarDetail(  userType: userType ?? this.userType,
  identityLevel: identityLevel ?? this.identityLevel,
  identityIconUrl: identityIconUrl ?? this.identityIconUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userType'] = userType;
    map['identityLevel'] = identityLevel;
    map['identityIconUrl'] = identityIconUrl;
    return map;
  }

}
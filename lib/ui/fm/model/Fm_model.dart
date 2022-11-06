import 'package:x_music/ui/play_list/model/play_list_model.dart';
class FmModel {
  FmModel({
      this.id, 
      this.dj, 
      this.name, 
      this.picUrl, 
      this.desc, 
      this.subCount, 
      this.programCount, 
      this.createTime, 
      this.categoryId, 
      this.category, 
      this.secondCategoryId, 
      this.secondCategory, 
      this.radioFeeType, 
      this.feeScope, 
      this.buyed, 
      this.videos, 
      this.finished, 
      this.underShelf, 
      this.purchaseCount, 
      this.price, 
      this.originalPrice, 
      this.discountPrice, 
      this.lastProgramCreateTime, 
      this.lastProgramName, 
      this.lastProgramId, 
      this.picId, 
      this.rcmdText, 
      this.hightQuality, 
      this.whiteList, 
      this.liveInfo, 
      this.playCount, 
      this.icon, 
      this.privacy, 
      this.intervenePicUrl, 
      this.intervenePicId, 
      this.cdynamic, 
      this.shortName, 
      this.taskId, 
      this.manualTagsDTO, 
      this.scoreInfoDTO, 
      this.descPicList, 
      this.subed, 
      this.composeVideo, 
      this.rcmdtext, 
      this.lastUpdateProgramName, 
      this.alg,});

  FmModel.fromJson(dynamic json) {
    id = json['id'];
    dj = json['dj'] != null ? AccountInfo.fromJson(json['dj']) : null;
    name = json['name'];
    picUrl = json['picUrl'];
    desc = json['desc'];
    subCount = json['subCount'];
    programCount = json['programCount'];
    createTime = json['createTime'];
    categoryId = json['categoryId'];
    category = json['category'];
    secondCategoryId = json['secondCategoryId'];
    secondCategory = json['secondCategory'];
    radioFeeType = json['radioFeeType'];
    feeScope = json['feeScope'];
    buyed = json['buyed'];
    videos = json['videos'];
    finished = json['finished'];
    underShelf = json['underShelf'];
    purchaseCount = json['purchaseCount'];
    price = json['price'];
    originalPrice = json['originalPrice'];
    discountPrice = json['discountPrice'];
    lastProgramCreateTime = json['lastProgramCreateTime'];
    lastProgramName = json['lastProgramName'];
    lastProgramId = json['lastProgramId'];
    picId = json['picId'];
    rcmdText = json['rcmdText'];
    hightQuality = json['hightQuality'];
    whiteList = json['whiteList'];
    liveInfo = json['liveInfo'];
    playCount = json['playCount'];
    icon = json['icon'];
    privacy = json['privacy'];
    intervenePicUrl = json['intervenePicUrl'];
    intervenePicId = json['intervenePicId'];
    cdynamic = json['dynamic'];
    shortName = json['shortName'];
    taskId = json['taskId'];
    manualTagsDTO = json['manualTagsDTO'];
    scoreInfoDTO = json['scoreInfoDTO'];
    descPicList = json['descPicList'];
    subed = json['subed'];
    composeVideo = json['composeVideo'];
    rcmdtext = json['rcmdtext'];
    lastUpdateProgramName = json['lastUpdateProgramName'];
    alg = json['alg'];
  }
  int? id;
  AccountInfo? dj;
  String? name;
  String? picUrl;
  String? desc;
  int? subCount;
  int? programCount;
  int? createTime;
  int? categoryId;
  String? category;
  int? secondCategoryId;
  String? secondCategory;
  int? radioFeeType;
  int? feeScope;
  bool? buyed;
  dynamic? videos;
  bool? finished;
  bool? underShelf;
  int? purchaseCount;
  int? price;
  int? originalPrice;
  dynamic? discountPrice;
  int? lastProgramCreateTime;
  String? lastProgramName;
  int? lastProgramId;
  int? picId;
  String? rcmdText;
  bool? hightQuality;
  bool? whiteList;
  dynamic? liveInfo;
  int? playCount;
  dynamic? icon;
  bool? privacy;
  String? intervenePicUrl;
  int? intervenePicId;
  bool? cdynamic;
  dynamic? shortName;
  int? taskId;
  dynamic? manualTagsDTO;
  dynamic? scoreInfoDTO;
  dynamic? descPicList;
  bool? subed;
  bool? composeVideo;
  String? rcmdtext;
  String? lastUpdateProgramName;
  String? alg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (dj != null) {
      map['dj'] = dj!.toJson();
    }
    map['name'] = name;
    map['picUrl'] = picUrl;
    map['desc'] = desc;
    map['subCount'] = subCount;
    map['programCount'] = programCount;
    map['createTime'] = createTime;
    map['categoryId'] = categoryId;
    map['category'] = category;
    map['secondCategoryId'] = secondCategoryId;
    map['secondCategory'] = secondCategory;
    map['radioFeeType'] = radioFeeType;
    map['feeScope'] = feeScope;
    map['buyed'] = buyed;
    map['videos'] = videos;
    map['finished'] = finished;
    map['underShelf'] = underShelf;
    map['purchaseCount'] = purchaseCount;
    map['price'] = price;
    map['originalPrice'] = originalPrice;
    map['discountPrice'] = discountPrice;
    map['lastProgramCreateTime'] = lastProgramCreateTime;
    map['lastProgramName'] = lastProgramName;
    map['lastProgramId'] = lastProgramId;
    map['picId'] = picId;
    map['rcmdText'] = rcmdText;
    map['hightQuality'] = hightQuality;
    map['whiteList'] = whiteList;
    map['liveInfo'] = liveInfo;
    map['playCount'] = playCount;
    map['icon'] = icon;
    map['privacy'] = privacy;
    map['intervenePicUrl'] = intervenePicUrl;
    map['intervenePicId'] = intervenePicId;
    map['dynamic'] = cdynamic;
    map['shortName'] = shortName;
    map['taskId'] = taskId;
    map['manualTagsDTO'] = manualTagsDTO;
    map['scoreInfoDTO'] = scoreInfoDTO;
    map['descPicList'] = descPicList;
    map['subed'] = subed;
    map['composeVideo'] = composeVideo;
    map['rcmdtext'] = rcmdtext;
    map['lastUpdateProgramName'] = lastUpdateProgramName;
    map['alg'] = alg;
    return map;
  }

}
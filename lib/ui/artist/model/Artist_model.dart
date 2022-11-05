class ArtistModel {
  ArtistModel({
      this.name, 
      this.id, 
      this.picId, 
      this.img1v1Id, 
      this.briefDesc, 
      this.picUrl, 
      this.img1v1Url, 
      this.albumSize, 
      this.alias, 
      this.trans, 
      this.musicSize, 
      this.topicPerson, 
      this.picIdStr, 
      this.img1v1IdStr, 
      this.followed,
      this.fansCount,});
  ArtistModel.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    picId = json['picId'];
    img1v1Id = json['img1v1Id'];
    briefDesc = json['briefDesc'];
    picUrl = json['picUrl'];
    img1v1Url = json['img1v1Url'];
    albumSize = json['albumSize'];
    alias = json['alias'] != null ? json['alias'].cast<String>() : [];
    trans = json['trans'];
    musicSize = json['musicSize'];
    topicPerson = json['topicPerson'];
    picIdStr = json['picId_str'];
    img1v1IdStr = json['img1v1Id_str'];
    followed = json['followed'];
    fansCount = json['fansCount'];
  }
  String? name;
  int? id;
  int? picId;
  int? img1v1Id;
  String? briefDesc;
  String? picUrl;
  String? img1v1Url;
  int? albumSize;
  List<String>? alias;
  String? trans;
  int? musicSize;
  int? topicPerson;
  String? picIdStr;
  String? img1v1IdStr;
  bool? followed;
  int? fansCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['picId'] = picId;
    map['img1v1Id'] = img1v1Id;
    map['briefDesc'] = briefDesc;
    map['picUrl'] = picUrl;
    map['img1v1Url'] = img1v1Url;
    map['albumSize'] = albumSize;
    map['alias'] = alias;
    map['trans'] = trans;
    map['musicSize'] = musicSize;
    map['topicPerson'] = topicPerson;
    map['picId_str'] = picIdStr;
    map['img1v1Id_str'] = img1v1IdStr;
    map['followed'] = followed;
    map['fansCount'] = fansCount;
    return map;
  }

}
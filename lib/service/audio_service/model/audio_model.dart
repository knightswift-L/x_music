import 'dart:typed_data';

class AudioModel{
   int? id;
   String? musicId;
   String? url;
   String? filePath;
   Uint8List? bytes;
   String? name;
   String? artistName;
   int? time;
  AudioModel({this.id, this.musicId, this.url, this.filePath, this.bytes, this.name, this.artistName,this.time});
  AudioModel.fromJson(Map<dynamic,dynamic> json){
    id = json["musicId"];
    musicId = json["id"];
    url = json["remoteUrl"];
    name = json["musicName"];
    artistName = json["artistName"];
    filePath = json["filePath"];
    bytes = null;
    time = json["time"];
  }
  Map<String,dynamic> toJson(){
    return {
      "musicId":id,
      "remoteUrl":url,
      "musicName":name,
      "artistName":artistName,
      "filePath":filePath,
      "time":time
    };
  }

  @override
  int get hashCode => Object.hash(id, url,filePath,name,artistName);

  @override
  bool operator ==(Object other) {
    return other is AudioModel && id == other.id;
  }
}

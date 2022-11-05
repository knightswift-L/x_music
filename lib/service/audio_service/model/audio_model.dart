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
    id = json["id"];
    musicId = json["musicId"];
    url = json["remoteUrl"];
    name = json["musicName"];
    artistName = json["artistName"];
    filePath = json["filePath"];
    bytes = null;
    time = json["time"];
  }
  Map<String,dynamic> toJson(){
    return {
      "musicId":musicId,
      "remoteUrl":url,
      "musicName":name,
      "artistName":artistName,
      "filePath":filePath,
      "time":time
    };
  }
}
///id integer primary key autoincrement,
//   musicId text not null,
//   musicName text not null,
//   artistName text not null,
//   filePath text not null,
//   remoteUrl text not null,)
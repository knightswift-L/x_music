import 'package:net_request_manager/impl/net_request_manager.dart';
import 'package:net_request_manager/model/cresponse.dart';
import 'package:x_music/net/api.dart';
import 'package:x_music/service/audio_service/model/audio_model.dart';
import 'package:x_music/service/store_service/constant/table_name.dart';
import 'package:x_music/service/store_service/database_service.dart';
import 'package:x_music/ui/music/model/Music_detail_model.dart';

class MusicService{
  static Future<AudioModel?> getAudioModelById(String id,String artistName,String name)async {
    var result = await _getAudioModelByIdFromLocal(id);
    if(result != null){
      return result;
    }
    result = await _getAudioModelByIdFromRemote(id, artistName, name);
    return result;
  }

  static Future<AudioModel?> _getAudioModelByIdFromRemote(String id,String artistName,String name)async {
    try{
      CResponse response = await NetRequestManager.instance.get(API.getMusicDetailById, queryParameters: {"id": id});
      if (response.isSuccess) {
        MusicDetailModel model = MusicDetailModel.fromJson(Map.from((response.data["data"] as List).first));
        AudioModel audioModel = AudioModel(
          musicId: model.id.toString(),
          name: name, url: model.url!, artistName: artistName, time: model.time!,
        );
        return audioModel;
      }
      return null;
    } catch(error){
      return null;
    }
  }

  static Future<AudioModel?> _getAudioModelByIdFromLocal(String id)async {
   var map = await DataBaseService().query(TableName.downLoadMusicHistory, ["id","musicId","musicName","artistName","filePath","filePath","time"],keyValue:MapEntry("musicId",id));
   return map != null ? AudioModel.fromJson(map):null;
  }

  static Future<List<AudioModel>> getAllDownloadedAudio()async {
   List<Map> result = await DataBaseService().queryAll(TableName.downLoadMusicHistory, ["id","musicId","musicName","artistName","filePath","filePath","time"]);
    return result.map((e) => AudioModel.fromJson(e)).toList();
  }
}
import 'dart:io';

import 'package:net_request_manager/impl/net_request_manager.dart';
import 'package:net_request_manager/model/cresponse.dart';
import 'package:path_provider/path_provider.dart';
import 'package:x_music/extension/string_ext.dart';
import 'package:x_music/net/api.dart';
import 'package:x_music/service/audio_service/model/audio_model.dart';
import 'package:x_music/ui/music/model/Music_detail_model.dart';

class DownLoadService {
  static Future<AudioModel?> downloadMusic(String id, String artistName, String name) async {
    AudioModel? model = await getDownMusicDownLoadUrl(id, artistName, name);
    if (model == null) {
      return null;
    }
    Directory directory = await getApplicationDocumentsDirectory();
    var path = "${directory.path}/$id.mp3";
    var result = await NetRequestManager.instance.downloadFile(model.url!.toHttps(), savepath: path, downLoadProgress: (double value) {});
    if (result.isSuccess) {
      model.filePath = path;
      return model;
    }
    return null;
  }

  static Future<AudioModel?> getDownMusicDownLoadUrl(String id, String artistName, String name) async {
    CResponse result = await NetRequestManager.instance.get(API.getMusicDetailById, queryParameters: {"id": id});
    if (result.isSuccess) {
      MusicDetailModel model = MusicDetailModel.fromJson(Map.from((result.data["data"] as List).first));
      AudioModel audioModel = AudioModel(musicId: model.id.toString(), name: name, url: model.url!, artistName: artistName, time: model.time!);
      return audioModel;
    }
    return null;
  }
}

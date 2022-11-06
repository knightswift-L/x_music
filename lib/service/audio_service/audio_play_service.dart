import 'dart:async';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:x_music/service/event_service/event_bus_service.dart';
import 'package:x_music/service/event_service/model/audio_play_event.dart';
import 'package:x_music/service/audio_service/model/audio_model.dart';


class AudioPlayService {
  static final AudioPlayService _singleton = AudioPlayService._internal();
  final List<AudioModel> _audioQueue = [];
  late AudioPlayer _players;
  late StreamSubscription _state;
  late StreamSubscription _positionChanged;
  factory AudioPlayService() {
    return _singleton;
  }

  AudioPlayService._internal(){
    _players = AudioPlayer()..setReleaseMode(ReleaseMode.release);
    _state = _players.onPlayerStateChanged.listen((event) async{
      var currentPosition = await _players.getCurrentPosition();
      currentPosition ??=  const Duration(milliseconds: 0);
       switch(event){
         case PlayerState.stopped:
           EventBusHelper().fire(AudioPlayEvent(status: AudioPlayStatus.stop, audioModel:_audioQueue.isNotEmpty ? _audioQueue.first:null, position:currentPosition,));
           break;
         case PlayerState.playing:
           EventBusHelper().fire(AudioPlayEvent(status: AudioPlayStatus.playing, audioModel: _audioQueue.first, position:currentPosition,));
           break;
         case PlayerState.paused:
           EventBusHelper().fire(AudioPlayEvent(status: AudioPlayStatus.paused, audioModel: _audioQueue.first, position:currentPosition,));
           break;
         case PlayerState.completed:
           EventBusHelper().fire(AudioPlayEvent(status: AudioPlayStatus.complete, audioModel: _audioQueue.first, position:currentPosition,));
           break;
       }
    });
     int lastUpdate = DateTime.now().millisecondsSinceEpoch;
    _positionChanged = _players.onPositionChanged.listen((event) {
      if(DateTime.now().millisecondsSinceEpoch - lastUpdate < 1000){
        return;
      }
      lastUpdate = DateTime.now().millisecondsSinceEpoch;
      AudioPlayStatus status = AudioPlayStatus.playing;
      switch(_players.state){
        case PlayerState.stopped:
          status = AudioPlayStatus.stop;
          break;
        case PlayerState.playing:
          status = AudioPlayStatus.playing;
          break;
        case PlayerState.paused:
          status = AudioPlayStatus.paused;
          break;
        case PlayerState.completed:
          status = AudioPlayStatus.complete;
          break;
      }
      EventBusHelper().fire(AudioPlayEvent(status:status, audioModel: _audioQueue.first, position: event,));
    });
  }

  Future play(AudioModel audioModel)async{
    if(_players.state != PlayerState.stopped && audioModel != _audioQueue.first){
      await _players.stop();
      if(_audioQueue.isNotEmpty) {
        _audioQueue.removeAt(0);
      }
    }
    _audioQueue.insert(0,audioModel);
    if(audioModel.bytes != null){
      return await _playUInt8List(audioModel.bytes!);
    }else if(audioModel.filePath != null){
      return await _playDeviceFile(audioModel.filePath!);
    }
    return _players.play(UrlSource(audioModel.url!));
  }

  addToPlayQueue(List<AudioModel> models){
    _audioQueue.addAll(models);
    if(_players.state == PlayerState.stopped){
    play(_audioQueue.first);
    }
  }

  Future _playAssets(String filePath){
    return _players.play(AssetSource(filePath));
  }
  Future _playDeviceFile(String filePath){
    return _players.play(DeviceFileSource(filePath));
  }

  Future _playUInt8List(Uint8List data){
    return _players.play(BytesSource(data));
  }

  close(){
    _state.cancel();
    _positionChanged.cancel();
  }

  Future pause()async{
   return await _players.pause();
  }
  Future resume()async{
    return await _players.resume();
  }
  Future stop()async{
    return await _players.stop();
  }
}
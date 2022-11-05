import 'dart:async';
import 'package:flutter/material.dart';
import 'package:x_music/service/audio_service/audio_play_service.dart';
import 'package:x_music/service/event_service/event_bus_service.dart';
import 'package:x_music/service/event_service/model/audio_play_event.dart';
import 'package:x_music/service/audio_service/model/audio_model.dart';
import 'package:x_music/service/music_service/music_service.dart';
import 'package:x_music/ui/music/model/Music_detail_model.dart';
class MusicPlayPageArguments{
  final String id;
  final String name;
  final String artistName;
  MusicPlayPageArguments(this.id, this.name,this.artistName);
}

class MusicPlayPage extends StatefulWidget{
  final MusicPlayPageArguments arguments;
  const MusicPlayPage({super.key, required this.arguments});

  @override
  State<StatefulWidget> createState() {
   return _MusicPlayPageState();
  }
}

class _MusicPlayPageState extends State<MusicPlayPage>{
  AudioPlayStatus status = AudioPlayStatus.stop;
  AudioModel? audioModel;
  late StreamSubscription audioStatus;
  @override
  void initState() {
    super.initState();
    MusicService.getAudioModelById(widget.arguments.id, widget.arguments.artistName, widget.arguments.name).then((value) {
      if (value != null) {
        setState(() {
          audioModel = value;
          AudioPlayService().play(audioModel!);
        });
      }
    });
    audioStatus = EventBusHelper().on<AudioPlayEvent>().listen((event) {
      setState(() {
        status = event.status;
      });
    });
  }
  @override
  void dispose() {
    audioStatus.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments.name),
      ),
      body: Center(
        child:audioModel != null ? GestureDetector(
          child: Text(status != AudioPlayStatus.playing ? "Play" : "Pause"),
          onTap: ()async{
            if(status == AudioPlayStatus.playing){
              await AudioPlayService().pause();
            }else if(status == AudioPlayStatus.paused){
              await AudioPlayService().resume();
            }else if(status == AudioPlayStatus.stop){
              await AudioPlayService().play(audioModel!);
            }else{
              await AudioPlayService().play(audioModel!);
            }
          },
        ):const SizedBox(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        ),
      )
    );
  }

}
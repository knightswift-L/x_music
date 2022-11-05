import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:x_music/service/audio_service/audio_play_service.dart';
import 'package:x_music/service/audio_service/model/audio_model.dart';
import 'package:x_music/service/event_service/event_bus_service.dart';
import 'package:x_music/service/event_service/model/audio_play_event.dart';

class AudioPlayBottomView extends StatefulWidget{
  const AudioPlayBottomView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AudioPlayBottomViewState();
  }

}

class _AudioPlayBottomViewState extends State<AudioPlayBottomView>{
  AudioModel? audioModel;
  AudioPlayEvent? audioPlayEvent;
  late StreamSubscription audioStatus;
  @override
  void initState() {
    super.initState();
    audioStatus = EventBusHelper().on<AudioPlayEvent>().listen((event) {
      setState(() {
        audioPlayEvent = event;
        audioModel = audioPlayEvent!.audioModel;
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
    return Container(
      color: Colors.white,
      height: 45,
      width: MediaQueryData.fromWindow(window).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            GestureDetector(
              onTap: audioPlayEvent != null ? ()async{
                if(audioPlayEvent!.status == AudioPlayStatus.playing){
                  await AudioPlayService().pause();
                }else if(audioPlayEvent!.status == AudioPlayStatus.paused){
                  await AudioPlayService().resume();
                }else if(audioPlayEvent!.status == AudioPlayStatus.stop){
                  await AudioPlayService().play(audioModel!);
                }else{
                  await AudioPlayService().play(audioModel!);
                }
              }:null,
              child:audioPlayEvent?.status != AudioPlayStatus.playing ? const Icon(
                Icons.play_arrow,
                size: 24,
                color: Colors.blue,
              ): const Icon(
                Icons.pause,
                size: 24,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 10,),
            Text(audioModel?.name ?? ""),
            const SizedBox(width: 10,),
            Expanded(child: LinearProgressIndicator(
              backgroundColor: Colors.black12,
              color: Colors.blue,
              value:audioPlayEvent?.position != null ? (audioPlayEvent?.position.inMilliseconds ?? 0)/(audioModel?.time ?? 0) : 0 ,
            ))

          ],
        ),
      ),
    );
  }

}
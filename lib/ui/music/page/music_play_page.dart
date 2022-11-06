import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:x_music/service/audio_service/audio_play_service.dart';
import 'package:x_music/service/event_service/event_bus_service.dart';
import 'package:x_music/service/event_service/model/audio_play_event.dart';
import 'package:x_music/service/audio_service/model/audio_model.dart';
import 'package:x_music/service/music_service/music_service.dart';

class MusicPlayPageArguments {
  final String id;
  final String name;
  final String artistName;
  MusicPlayPageArguments(this.id, this.name, this.artistName);
}

class MusicPlayPage extends StatefulWidget {
  final MusicPlayPageArguments arguments;
  const MusicPlayPage({super.key, required this.arguments});

  @override
  State<StatefulWidget> createState() {
    return _MusicPlayPageState();
  }
}

class _MusicPlayPageState extends State<MusicPlayPage> {
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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text(audioModel?.name ?? ""), Text(audioModel?.artistName ?? "")],
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQueryData.fromWindow(window).size.width * 0.8,
                  height: MediaQueryData.fromWindow(window).size.width * 0.8,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(MediaQueryData.fromWindow(window).size.width * 0.4)),
                ),
              ],
            )),
            AudioPlayControllerView(
              audioModel: audioModel,
            ),
            SizedBox(
              height: MediaQueryData.fromWindow(window).size.height * 0.2,
            )
          ],
        ));
  }
}

class AudioPlayControllerView extends StatefulWidget {
  final AudioModel? audioModel;
  const AudioPlayControllerView({super.key, this.audioModel});

  @override
  State<StatefulWidget> createState() {
    return _AudioPlayControllerViewState();
  }
}

class _AudioPlayControllerViewState extends State<AudioPlayControllerView> {
  AudioModel? audioModel;
  AudioPlayEvent? audioPlayEvent;
  late StreamSubscription audioStatus;
  @override
  void initState() {
    super.initState();
    audioModel = widget.audioModel;
    if (audioModel != null) {
      audioPlayEvent = AudioPlayEvent(status: AudioPlayStatus.stop, position: const Duration(milliseconds: 0), audioModel: audioModel);
    }
    audioStatus = EventBusHelper().on<AudioPlayEvent>().listen((event) {
      setState(() {
        audioPlayEvent = event;
        audioModel = audioPlayEvent!.audioModel;
      });
    });
  }

  @override
  void didUpdateWidget(covariant AudioPlayControllerView oldWidget) {
    if (audioModel == null && widget.audioModel != null) {
      audioModel = widget.audioModel;
      if (audioModel != null) {
        audioPlayEvent = AudioPlayEvent(status: AudioPlayStatus.stop, position: const Duration(milliseconds: 0), audioModel: audioModel);
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    audioStatus.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQueryData.fromWindow(window).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_left,
                  size: 48,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: audioPlayEvent != null && audioModel != null
                    ? () async {
                        if (audioPlayEvent!.status == AudioPlayStatus.playing) {
                          await AudioPlayService().pause();
                        } else if (audioPlayEvent!.status == AudioPlayStatus.paused) {
                          await AudioPlayService().resume();
                        } else if (audioPlayEvent!.status == AudioPlayStatus.stop) {
                          await AudioPlayService().play(audioModel!);
                        } else {
                          await AudioPlayService().play(audioModel!);
                        }
                      }
                    : null,
                child: audioPlayEvent?.status != AudioPlayStatus.playing
                    ? const Icon(
                        Icons.play_arrow,
                        size: 48,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.pause,
                        size: 48,
                        color: Colors.red,
                      ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_right,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                getCurrentString(),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: LinearProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.red,
                value: calculatePosition(),
              )),
              const SizedBox(
                width: 10,
              ),
              Text(getTotalString(),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  )),
            ],
          )
        ],
      ),
    );
  }

  double calculatePosition() {
    if (audioModel?.time == null || audioModel?.time == 0) {
      return 0;
    }
    if (audioPlayEvent?.position == null || audioPlayEvent!.position.inMilliseconds == 0) {
      return 0;
    }
    return audioPlayEvent!.position.inMilliseconds / audioModel!.time!;
  }

  String getCurrentString() {
    if (audioPlayEvent?.position == null || audioPlayEvent!.position.inMilliseconds == 0) {
      return "00:00";
    }
    int minutes = audioPlayEvent!.position!.inSeconds ~/ 60;
    int seconds = audioPlayEvent!.position!.inSeconds % 60;
    return "$minutes:$seconds";
  }

  String getTotalString() {
    if (audioModel?.time == null || audioModel!.time == 0) {
      return "00:00";
    }
    int minutes = audioModel!.time! ~/ 60000;
    int seconds = (audioModel!.time! % 60000) ~/ 1000;
    return "$minutes:$seconds";
  }
}

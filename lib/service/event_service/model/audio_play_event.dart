import 'package:x_music/service/audio_service/model/audio_model.dart';
enum AudioPlayStatus { playing, paused, complete, stop }

class AudioPlayEvent {
  final AudioPlayStatus status;
  final Duration position;
  final AudioModel? audioModel;
  AudioPlayEvent({
    required this.status,
    this.audioModel,
    required this.position,
  });

  @override
  int get hashCode => Object.hash(status, audioModel,position);

  @override
  bool operator ==(Object other) {
    return other is AudioPlayEvent && audioModel == other.audioModel && status == other.status && position == other.position;
  }
}

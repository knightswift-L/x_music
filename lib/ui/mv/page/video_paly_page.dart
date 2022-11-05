import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_request_manager/impl/net_request_manager.dart';
import 'package:orientation/orientation.dart';
import 'package:video_player/video_player.dart';
import 'package:x_music/net/api.dart';
import 'package:x_music/service/audio_service/audio_play_service.dart';
import 'package:x_music/ui/mv/model/Mv_detail_model.dart';
///http://vodkgeyttp8.vod.126.net/cloudmusic/I2RhMDQwMSIlMCQgIjAyMg==/mv/499047/21506e7ba0d1cc0747d80af08388d8a2.mp4?wsSecret=2bd95e6b14e000dabcea77eaca887798&wsTime=1667453607
class VideoPlayPageArguments{
  final String id;

  VideoPlayPageArguments(this.id);
}

class VideoPlayPage extends StatefulWidget{
  final VideoPlayPageArguments arguments;
  const VideoPlayPage({super.key, required this.arguments});

  @override
  State<StatefulWidget> createState() {
   return _VideoPlayPageState();
  }
}

class _VideoPlayPageState extends State<VideoPlayPage>{
  late VideoPlayerController _controller;
  MvDetailModel? detailModel;
  bool prepared = false;
  bool isFull = false;
  @override
  void initState() {
    super.initState();
    NetRequestManager.instance.get(API.getMvDetailById,queryParameters:{"id":widget.arguments.id}).then((value) {
      if (value.isSuccess) {
        setState(() {
          detailModel = MvDetailModel.fromJson(Map.from(value.data["data"]));
          if(detailModel?.url != null) {
            playMusic(detailModel!.url!);
          }
        });
      }
    }).catchError((error) {
      print("Error:${error.toString()}");
    });
  }

  void playMusic(String url){
    _controller = VideoPlayerController.network(url);
    _controller.setLooping(true);
    _controller.initialize().then((value){
      setState(() {
        prepared = true;
        _controller.play();
        AudioPlayService().stop();
      });
    }).catchError((error){

    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.black,
     body: prepared ? GestureDetector(
         onTap: (){
           if(_controller.value.isPlaying){
             _controller.pause();
           }else{
             _controller.play();
           }
           setState(() {

           });
         },
         child:Container(
           alignment: isFull ? Alignment.center:Alignment.topCenter,
           child: AspectRatio(
             aspectRatio:  _controller.value.aspectRatio,
             child: Stack(
               alignment: Alignment.bottomCenter,
               children: <Widget>[
                 Align(alignment: isFull ? Alignment.center : Alignment.topCenter,
                   child: VideoPlayer(_controller),
                 ),
                 if(!_controller.value.isPlaying)Align(alignment: Alignment.center,
                   child: GestureDetector(
                     onTap: (){
                       _controller.play();
                       setState(() {

                       });
                     },
                     child: const Icon(Icons.play_circle,color: Colors.blue,size: 50,),
                   ),),
                 VideoProgressIndicator(_controller, allowScrubbing: true,colors: const VideoProgressColors(
                   playedColor:Colors.blueAccent,
                   bufferedColor:Colors.red,
                   backgroundColor:Colors.white38,
                 ),),
                 Align(alignment: Alignment.bottomRight,child: GestureDetector(
                   onTap: (){
                     if(isFull){
                       OrientationPlugin.setPreferredOrientations([DeviceOrientation.portraitUp]);
                       isFull = false;
                     }else {
                       OrientationPlugin.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
                       isFull = true;
                     }
                   },
                   child: const Icon(Icons.fullscreen,size: 30,color: Colors.white,),
                 ),)
               ],
             ),
           ),
         )):const Center(
       child:SizedBox(
         width: 50,height: 50,
         child:  CircularProgressIndicator(color: Colors.blue,),
       ),
     ),
   );
  }

}
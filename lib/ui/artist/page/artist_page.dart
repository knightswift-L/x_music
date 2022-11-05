import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:net_request_manager/impl/net_request_manager.dart';
import 'package:x_music/net/api.dart';
import 'package:x_music/service/download_service/download_service.dart';
import 'package:x_music/service/store_service/constant/table_name.dart';
import 'package:x_music/service/store_service/database_service.dart';
import 'package:x_music/ui/me/page/download_history_page.dart';
import 'package:x_music/ui/music/model/music_model.dart';
import 'package:x_music/ui/music/page/music_play_page.dart';
import 'package:x_music/ui/mv/page/video_paly_page.dart';

class ArtistPageArguments {
  final String id;
  final String name;
  final String image;
  ArtistPageArguments(this.id, this.name, this.image);
}

class ArtistPage extends StatefulWidget {
  final ArtistPageArguments arguments;
  const ArtistPage({super.key, required this.arguments});

  @override
  State<StatefulWidget> createState() {
    return _ArtistPageState();
  }
}

class _ArtistPageState extends State<ArtistPage> {
  List<MusicModel> musics = [];
  @override
  void initState() {
    super.initState();
    NetRequestManager.instance.get(API.getAllMusicOfArtist, queryParameters: {"id": widget.arguments.id}).then((value) {
      if (value.isSuccess) {
        setState(() {
          bool hasMore = value.data["more"];
          musics = (value.data["songs"] as List).map((e) => MusicModel.fromJson(Map.from(e))).toList() ?? [];
        });
      }
    }).catchError((error) {
      print("Error:${error.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(widget.arguments.name),
            expandedHeight: MediaQueryData.fromWindow(window).size.width * 0.812,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: "Hero${widget.arguments.id}",
                child: CachedNetworkImage(
                  imageUrl: widget.arguments.image,
                  width: MediaQueryData.fromWindow(window).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            actions: [GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const DownloadHistoryPage()));
              },
              child: const Icon(Icons.history,size: 24,color: Colors.white,),
            )],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MusicPlayPage(arguments: MusicPlayPageArguments(musics[index].id.toString(), musics[index].name!, widget.arguments.name))));
                },
                child: Container(
                  height: 50,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Expanded(
                          flex:2,
                          child: Text(musics[index].name ?? ""),
                        ),
                        Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            musics[index].mv != 0 ? GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayPage(arguments: VideoPlayPageArguments(musics[index].mv.toString()))));
                              },
                              child: const Icon(
                                Icons.video_collection_outlined,
                                size: 24,
                                color: Colors.blue,
                              ),
                            ):SizedBox(),
                            GestureDetector(
                              onTap: () {
                                DownLoadService.downloadMusic(musics[index].id.toString(), widget.arguments.name, musics[index].name!).then((value)async{
                                  if(value != null){
                                    var id = await DataBaseService().insert(TableName.downLoadMusicHistory, value.toJson());
                                    print("==========>$id");
                                  }
                                });
                              },
                              child: const Icon(
                                Icons.download,
                                size: 24,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ))
                      ],
                    )),
              );
            },
            childCount: musics.length,
          ))
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:net_request_manager/impl/net_request_manager.dart';
import 'package:x_music/net/api.dart';
import 'package:x_music/service/download_service/download_service.dart';
import 'package:x_music/service/store_service/constant/table_name.dart';
import 'package:x_music/service/store_service/database_service.dart';
import 'package:x_music/ui/music/model/music_model.dart';
import 'package:x_music/ui/music/page/music_play_page.dart';
import 'package:x_music/ui/mv/page/video_paly_page.dart';
class PlayListDetailPageArguments{
  final String id;
  final String name;
  final String image;

  PlayListDetailPageArguments(this.id, this.name, this.image);
}

class PlayListDetailPage extends StatefulWidget{
  final PlayListDetailPageArguments arguments;
  const PlayListDetailPage({super.key, required this.arguments});

  @override
  State<StatefulWidget> createState() {
    return _PlayListDetailPageState();
  }
}

class _PlayListDetailPageState extends State<PlayListDetailPage>{
  List<MusicModel> musics = [];
  @override
  void initState() {
    super.initState();
    NetRequestManager.instance.get(API.getAllMusicOfPlayList, queryParameters: {"id": widget.arguments.id}).then((value) {
      if (value.isSuccess) {
        setState(() {
          musics = (value.data["songs"] as List).map((e) => MusicModel.fromJson(Map.from(e))).toList() ?? [];
        });
      }
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
                        height: 80,
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: CachedNetworkImage(
                                imageUrl: musics[index].al?.picUrl ?? "",
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(musics[index].name ?? ""),
                                if(musics[index].ar != null && musics[index].ar!.isNotEmpty)
                                  Text(musics[index].ar!.map((e) => e.name ?? "").join(",") ?? "")
                              ],
                            )),
                            Row(
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
                            )
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
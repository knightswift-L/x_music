import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:net_request_manager/impl/net_request_manager.dart';
import 'package:net_request_manager/model/cresponse.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
  late RefreshController refreshController;
  @override
  void initState() {
    super.initState();
    refreshController = RefreshController(initialRefresh: true);
  }

  void refresh()async{
    var result = await getMusic(0);
    refreshController.refreshCompleted(resetFooterState: result);
  }
  void loadMore()async{
    var result = await getMusic(musics.length);
    if(result){
      refreshController.loadComplete();
    }else{
      refreshController.loadNoData();
    }
  }

  Future<bool> getMusic(int offset) async {
    CResponse response = await NetRequestManager.instance.get(API.getAllMusicOfArtist, queryParameters: {"id": widget.arguments.id, "offset": offset, "limit": 20});
    bool hasMore = false;
    if (response.isSuccess) {
      setState(() {
        hasMore = response.data["more"];
        var result = (response.data["songs"] as List).map((e) => MusicModel.fromJson(Map.from(e))).toList() ?? [];
        musics.addAll(result);
      });
    }
    return hasMore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: refresh,
        onLoading: loadMore,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              title: Text(widget.arguments.name,style: TextStyle(
                color: Colors.black
              ),),
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
                child: const Icon(Icons.history,size: 24,color: Colors.black,),
              ),SizedBox(width: 10,)],
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
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(
                          color: Colors.white38,
                          width: 1
                        ))
                      ),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          if( musics[index].al?.picUrl != null)Container(
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
                                    Text(musics[index].ar!.map((e) => e.name ?? "").join(",") ?? "",maxLines: 1,overflow: TextOverflow.ellipsis,)
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
      ),
    );
  }
}

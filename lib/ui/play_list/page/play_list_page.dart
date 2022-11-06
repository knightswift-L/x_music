import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:net_request_manager/impl/net_request_manager.dart';
import 'package:x_music/net/api.dart';
import 'package:x_music/ui/play_list/model/play_list_model.dart';
import 'package:x_music/ui/play_list/page/play_list_detail_page.dart';

class PlayListPage extends StatefulWidget{
  const PlayListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PlayListPageState();
  }

}

class _PlayListPageState extends State<PlayListPage>{
  List<PlayListModel> playList = [];
  @override
  void initState() {
    super.initState();
    NetRequestManager.instance.get(API.getAllPlayList,).then((value) {
      if (value.isSuccess) {
        setState(() {
          bool hasMore = value.data["more"];
          playList = (value.data["playlists"] as List).map((e) => PlayListModel.fromJson(Map.from(e))).toList() ?? [];
        });
      }
    }).catchError((error) {
      print("Error:${error.toString()}");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top 50"),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: CustomScrollView(
          slivers: [
            SliverGrid(delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlayListDetailPage(arguments: PlayListDetailPageArguments(playList[index].id.toString(), playList[index].name!, playList[index].coverImgUrl!))));
                },
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                        clipBehavior: Clip.hardEdge,
                        child: Hero(
                            tag: "Hero${playList[index].id}",
                            child: CachedNetworkImage(
                              imageUrl: playList[index].coverImgUrl ?? "",
                              fit: BoxFit.contain,
                              placeholder: (BuildContext context, String url) {
                                return AspectRatio(
                                  aspectRatio: 1080 / 877,
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(color: Colors.black12.withOpacity(0.5), borderRadius: BorderRadius.circular(5)),
                                  ),
                                );
                              },
                            )),
                      ),
                      Align(alignment: Alignment.bottomCenter,child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text("${playList[index].name}",style: const TextStyle(
                            fontSize: 12,color: Colors.white
                        ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),)
                    ],
                  ),
                ) ,
              );
            },childCount: playList.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),)
          ],
        ),
      ),
    );
  }

}
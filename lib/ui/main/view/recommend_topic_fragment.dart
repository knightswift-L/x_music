import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:net_request_manager/impl/net_request_manager.dart';
import 'package:net_request_manager/model/cresponse.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:x_music/net/api.dart';
import 'package:x_music/ui/artist/model/Artist_model.dart';
import 'package:x_music/ui/artist/page/artist_list.dart';
import 'package:x_music/ui/fm/model/Fm_model.dart';
import 'package:x_music/ui/fm/page/fm_list_detail_page.dart';
import 'package:x_music/ui/play_list/model/play_list_model.dart';
import 'package:x_music/ui/play_list/page/play_list_detail_page.dart';
import 'package:x_music/ui/play_list/page/play_list_page.dart';

import '../../artist/page/artist_page.dart';

class RecommendTopicFragment extends StatefulWidget {
  const RecommendTopicFragment({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RecommendTopicFragmentState();
  }
}

class _RecommendTopicFragmentState extends State<RecommendTopicFragment> {
  List<ArtistModel> artists = [];
  List<PlayListModel> playList = [];
  List<FmModel> fmList = [];
  late RefreshController refreshController;
  @override
  void initState() {
    super.initState();
    refreshController = RefreshController(initialRefresh: true);
  }

  refresh() {
    Future.wait([getTopFMList(), getTopPlayList(), getTopArtist()]).then((value) {
      refreshController.refreshCompleted();
    });
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      height: double.infinity,
      child: SmartRefresher(
        controller: refreshController,
        header: const MaterialClassicHeader(),
        onLoading: () {
          Future.delayed(const Duration(milliseconds: 1000), () {
            refreshController.loadComplete();
          });
        },
        onRefresh: refresh,
        enablePullUp: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Text(
                  "????????????",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((BuildContext context, int position) {
                if (position < artists.length && position < 5) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ArtistPage(arguments: ArtistPageArguments(artists[position].id.toString(), artists[position].name!, artists[position].picUrl!))));
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                          clipBehavior: Clip.hardEdge,
                          child: Hero(
                              tag: "Hero${artists[position].id}",
                              child: AspectRatio(
                                aspectRatio: 1080 / 877,
                                child: CachedNetworkImage(
                                  imageUrl: artists[position].picUrl ?? "",
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
                                ),
                              )),
                        ),
                        Spacer(),
                        Text(artists[position].name ?? "")
                      ],
                    ),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ArtistListPage()));
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AspectRatio(
                          aspectRatio: 1080 / 877,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(5)),
                            child: const Text(
                              "Top 50",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                            ),
                          ))
                    ],
                  ),
                );
              }, childCount: artists.length >= 5 ? 6 : artists.length + 1),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Text(
                  "????????????",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((BuildContext context, int position) {
                if (position < playList.length && position < 5) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PlayListDetailPage(arguments: PlayListDetailPageArguments(playList[position].id.toString(), playList[position].name!, playList[position].coverImgUrl!))));
                    },
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                            clipBehavior: Clip.hardEdge,
                            child: Hero(
                                tag: "Hero${playList[position].id}",
                                child: CachedNetworkImage(
                                  imageUrl: playList[position].coverImgUrl ?? "",
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
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "${playList[position].name}",
                                style: const TextStyle(fontSize: 12, color: Colors.white),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PlayListPage()));
                  },
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        "Top 50",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ),
                );
              }, childCount: playList.length >= 5 ? 6 : playList.length + 1),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: const Text(
                  "??????FM",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((BuildContext context, int position) {
                if (position < fmList.length && position < 5) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FmListDetailPage(arguments: FMListDetailPageArguments(fmList[position].id.toString(), fmList[position].name!, fmList[position].picUrl!))));
                    },
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
                            clipBehavior: Clip.hardEdge,
                            child: Hero(
                                tag: "Hero${fmList[position].id}",
                                child: CachedNetworkImage(
                                  imageUrl: fmList[position].picUrl ?? "",
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
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                "${fmList[position].name}",
                                style: const TextStyle(fontSize: 12, color: Colors.white),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PlayListPage()));
                  },
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(5)),
                      child: const Text(
                        "Top 50",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                  ),
                );
              }, childCount: fmList.length >= 5 ? 6 : fmList.length + 1),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<void> getTopArtist() async {
    CResponse response = await NetRequestManager.instance.get(API.getTopArtist, queryParameters: {"limit": 5});
    if (response.isSuccess) {
      setState(() {
        artists = (response.data["artists"] as List).map((e) => ArtistModel.fromJson(Map.from(e))).toList() ?? [];
      });
    }
  }

  Future<void> getTopPlayList() async {
    CResponse response = await NetRequestManager.instance.get(API.getAllPlayList, queryParameters: {"limit": 5});
    if (response.isSuccess) {
      setState(() {
        playList = (response.data["playlists"] as List).map((e) => PlayListModel.fromJson(Map.from(e))).toList() ?? [];
      });
    }
  }

  Future<void> getTopFMList() async {
    CResponse response = await NetRequestManager.instance.get(API.getAllFMList, queryParameters: {"limit": 5});
    if (response.isSuccess) {
      setState(() {
        fmList = (response.data["data"] as List).map((e) => FmModel.fromJson(Map.from(e))).toList() ?? [];
      });
    }
  }
}

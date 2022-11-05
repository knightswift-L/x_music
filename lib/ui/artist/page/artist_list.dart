import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:net_request_manager/impl/net_request_manager.dart';
import 'package:x_music/net/api.dart';
import 'package:x_music/ui/artist/model/Artist_model.dart';

import 'artist_page.dart';

class ArtistListPage extends StatefulWidget{
  const ArtistListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ArtistListPageState();
  }

}

class _ArtistListPageState extends State<ArtistListPage>{
  List<ArtistModel> artist = [];
  @override
  void initState() {
    super.initState();
    NetRequestManager.instance.get(API.getAllArtist,).then((value) {
      if (value.isSuccess) {
        setState(() {
          bool hasMore = value.data["more"];
          artist = (value.data["artists"] as List).map((e) => ArtistModel.fromJson(Map.from(e))).toList() ?? [];
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
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: CustomScrollView(
          slivers: [
            SliverGrid(delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ArtistPage(arguments: ArtistPageArguments(artist[index].id.toString(), artist[index].name!,artist[index].picUrl!))));
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      clipBehavior: Clip.hardEdge,
                      child:Hero(
                          tag: "Hero${artist[index].id}",
                          child: AspectRatio(
                            aspectRatio: 1080/877,
                            child: CachedNetworkImage(
                              imageUrl: artist[index].picUrl ?? "",
                              fit: BoxFit.contain,
                              placeholder: (BuildContext context, String url) {
                                return AspectRatio(aspectRatio: 1080/877,child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                ),);
                              },
                            ),
                          )),
                    ),
                    Spacer(),
                    Text(artist[index].name ?? "")
                  ],
                ),
              );
            },childCount: artist.length),
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
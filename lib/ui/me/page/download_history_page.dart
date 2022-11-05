import 'package:flutter/material.dart';
import 'package:x_music/service/audio_service/model/audio_model.dart';
import 'package:x_music/service/music_service/music_service.dart';
import 'package:x_music/service/store_service/constant/table_name.dart';
import 'package:x_music/service/store_service/database_service.dart';
import 'package:x_music/ui/music/page/music_play_page.dart';

class DownloadHistoryPage extends StatefulWidget {
  const DownloadHistoryPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DownloadHistoryPageState();
  }
}

class _DownloadHistoryPageState extends State<DownloadHistoryPage> {
  List<AudioModel> audios = [];
  @override
  void initState() {
    super.initState();
    MusicService.getAllDownloadedAudio().then((value){
      setState(() {
        audios = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("下载历史"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MusicPlayPage(arguments: MusicPlayPageArguments(audios[index].musicId!, audios[index].artistName!, audios[index].name!))));
                },
                child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(audios[index].name ?? ""),
                        ),
                      ],
                    )),
              );
            },
            childCount: audios.length,
          ))
        ],
      ),
    );
  }
}

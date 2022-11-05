import 'package:flutter/material.dart';
import 'package:x_music/ui/main/view/audio_bottom_view.dart';
import 'package:x_music/ui/main/view/personal_fragment.dart';
import 'package:x_music/ui/main/view/post_fragment.dart';
import 'package:x_music/ui/main/view/recommend_topic_fragment.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          Expanded(
            child:IndexedStack(
              index: currentIndex,
              children: const [
                RecommendTopicFragment(),
                PostFragment(),
                PersonalFragment()
              ],
            )
          ),
          const AudioPlayBottomView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.recommend,size: 24,color: Colors.blueGrey,),activeIcon: Icon(Icons.recommend,size: 24,color: Colors.blue,),label: "Recommend"),
          BottomNavigationBarItem(icon: Icon(Icons.post_add_sharp,size: 24,color: Colors.blueGrey,),activeIcon: Icon(Icons.post_add_sharp,size: 24,color: Colors.blue,),label: "Post"),
          BottomNavigationBarItem(icon: Icon(Icons.person,size: 24,color: Colors.blueGrey,),activeIcon: Icon(Icons.person,size: 24,color: Colors.blue,),label: "Me")
        ],
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}



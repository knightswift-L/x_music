import 'package:flutter/material.dart';
import 'package:x_music/ui/artist/page/artist_list.dart';

class RecommendTopicFragment extends StatefulWidget{
  const RecommendTopicFragment({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RecommendTopicFragmentState();
  }

}

class _RecommendTopicFragmentState extends State<RecommendTopicFragment>{
  @override
  Widget build(BuildContext context) {
   return SafeArea(child: Container(
     padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
     width: double.infinity,
     height: double.infinity,
     child: CustomScrollView(
       slivers: [
         SliverGrid(delegate: SliverChildBuilderDelegate((BuildContext context, int position) {
           return GestureDetector(
             onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>const ArtistListPage()));
             },
             child: Container(
               alignment: Alignment.center,
               decoration: BoxDecoration(
                   color:position % 2 == 0 ? Colors.blue:Colors.blueGrey
               ),
               child: Text("Top 50"),
             ),
           );
         },childCount: 10),
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount:3,
             mainAxisSpacing: 10.0,
             crossAxisSpacing: 10.0,
           ),)
       ],
     ),
   ));
  }

}
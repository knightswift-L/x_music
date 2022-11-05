import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:net_request_manager/impl/net_request_manager.dart';
import 'package:orientation/orientation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:x_music/service/store_service/database_service.dart';
import 'package:x_music/ui/main/page/main_page.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  OrientationPlugin.setPreferredOrientations([DeviceOrientation.portraitUp]);
  NetRequestManager.instance.init(host: "http://192.168.2.3:3000");
  Directory directory = await getApplicationDocumentsDirectory();
  await DataBaseService().open("$directory/x_music.db");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X Music',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:podoriginals/VideoApp/controller/video_controller.dart';
import 'package:podoriginals/VideoApp/view/video_player.dart';
import 'home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        //or set color with: Color(0xFF0000FF)
        statusBarBrightness: Brightness.light));
    return MaterialApp(
      title: 'C Sports',
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: VideoPlay(),
    );
  }
}

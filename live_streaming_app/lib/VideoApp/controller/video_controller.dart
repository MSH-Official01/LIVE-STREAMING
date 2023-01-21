import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:podoriginals/VideoApp/controller/remoteService.dart';
import 'package:podoriginals/VideoApp/modals/video_view.dart';
import 'package:video_viewer/video_viewer.dart';
import 'package:video_viewer/video_viewer.dart';
import 'package:http/http.dart' as http;

class VideoController extends GetxController {
    Map<String, dynamic> videoList;


   getVideoPlayer() async {
    http.Response response =
        await http.get(Uri.parse('https://c-sports.live/api/live/cricket'));

    print("All Video Link :::::" + response.body);
    if (response.statusCode == 200) {

      videoList = Map<String, dynamic>.from(jsonDecode(response.body));
     
      

      print('proooooooooooooooooooo $videoList');

    } else {
      return null;
    }
  }

  @override
  void onInit() {
    getVideoPlayer();
    super.onInit();
  }

  @override
  void onClose() {
  getVideoPlayer();
    super.onClose();
  }
}
//   // Future<void> initializedPlayer() async {

//   //  final videoPlayerController =  FutureBuilder<Map<String, VideoSource>>(
//   //     future: VideoSource.fromM3u8PlaylistUrl(
//   //       "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
//   //       formatter: (quality) =>
//   //           quality == "Auto" ? "Automatic" : "${quality.split("x").last}p",
//   //     ),
//   //     builder: (_, data) {
//   //       return data.hasData
//   //           ? VideoViewer(
//   //               source: data.data,
//   //               onFullscreenFixLandscape: true,
//   //               style: VideoViewerStyle(
//   //                 thumbnail: Image.network(
//   //                   "https://c-sports.live/images/logo-bg-white.jpg",
//   //                 ),
//   //               ),
//   //             ).obs
//   //           : Center(child: CircularProgressIndicator());
//   //     },
//   //   ) ?? Map<String, VideoSource>();
//   //   // await Future.wait([videoPlayerController.initialize()]);
//   //   // videoViewerController = VideoPlayerController;
//   //   update();
//   // }
// }


//   // getVideoPlayer() async {
//   //   try {
//   //     isLoading(true);
//   //     http.Response response =
//   //         await http.get(Uri.parse('https://c-sports.live/api/live/cricket'));

//   //     print("groceryAllProduct:::::" + response.body);
//   //     if (response.statusCode == 200) {
//   //       final allVideo = videoPlayerFromJson(response.body);

//   //       //print('proooooooooooooooooooo ${allVideo.data.toString()}');

//   //       return allVideos= allVideo.data as List;
//   //     } else {
//   //       print('User not found');
//   //     }
//   //   } catch (e) {
//   //     print(e.toString());
//   //     return null;
//   //   } finally {
//   //     isLoading(false);
//   //   }
//   // }
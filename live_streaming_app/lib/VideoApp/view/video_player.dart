import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_viewer/video_viewer.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VideoPlay extends StatefulWidget {
  VideoPlay({Key key}) : super(key: key);

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  // final VideoController videoPlayerController = Get.put(VideoController());

  Map<String, dynamic> videoList;

  getData() async {
    var response =
        await http.get(Uri.parse('https://c-sports.live/api/live/cricket'));
    setState(() {
      videoList = Map<String, dynamic>.from(jsonDecode(response.body));
      // String decode = response.body;
      // var videoList = jsonDecode(decode);
      // return videoList;
    });
    // print(' ======================== $videoList');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: videoList == null
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 11, 36, 149),
                title: Text(
                  'C-Sports Live',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                    
                      children: [
                        
                        Text(
                          "${videoList["data"]["section"].toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.red),
                        ),
                        Container(
                          height: 250,
                          width: double.infinity,
                          child: FutureBuilder<Map<String, VideoSource>>(
                            future: VideoSource.fromM3u8PlaylistUrl(
                              "${videoList["data"]["link"].toString()}",
                              formatter: (quality) => quality == "Auto"
                                  ? "Automatic"
                                  : "${quality.split("x").last}p",
                            ),
                            builder: (_, videoList) {
                              return videoList.hasData
                                  ? VideoViewer(
                                      source: videoList.data,
                                      onFullscreenFixLandscape: true,
                                      style: VideoViewerStyle(
                                        thumbnail: Image.network(
                                          "https://c-sports.live/images/logo-bg-white.jpg",
                                        ),
                                      ),
                                    )
                                  : Center(child: CircularProgressIndicator());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    this.getData();
    this.videoList.length;
    super.dispose();
  }
}

// import 'package:flutter/material.dart';

// import 'package:video_viewer/video_viewer.dart';


// class HLSVideoExample extends StatefulWidget {
//   const HLSVideoExample({Key key}) : super(key: key);

//   @override
//   State<HLSVideoExample> createState() => _HLSVideoExampleState();
// }

// class _HLSVideoExampleState extends State<HLSVideoExample> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Map<String, VideoSource>>(
//       future: VideoSource.fromM3u8PlaylistUrl(
//         "https://sfux-ext.sfux.info/hls/chapter/105/1588724110/1588724110.m3u8",
//         formatter: (quality) => quality == "Auto" ? "Automatic" : "${quality.split("x").last}p",
//       ),
//       builder: (_, data) {
//         return data.hasData
//             ? VideoViewer(
//                 source: data.data,
//                 onFullscreenFixLandscape: true,
//                 style: VideoViewerStyle(
//                   thumbnail: Image.network(
//                     "https://play-lh.googleusercontent.com/aA2iky4PH0REWCcPs9Qym2X7e9koaa1RtY-nKkXQsDVU6Ph25_9GkvVuyhS72bwKhN1P",
//                   ),
//                 ),
//               )
//             : CircularProgressIndicator();
//       },
//     );
//   }
// }



// FutureBuilder<Map<String, VideoSource>>(
//       future: VideoSource.fromM3u8PlaylistUrl(
//         "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
//         formatter: (quality) =>
//             quality == "Auto" ? "Automatic" : "${quality.split("x").last}p",
//       ),
//       builder: (_, data) {
//         return data.hasData
//             ? VideoViewer(
//                 source: data.data,
//                 onFullscreenFixLandscape: true,
//                 style: VideoViewerStyle(
//                   thumbnail: Image.network(
//                     "https://c-sports.live/images/logo-bg-white.jpg",
//                   ),
//                 ),
//               ).obs
//             : Center(child: CircularProgressIndicator());
//       },
//     )
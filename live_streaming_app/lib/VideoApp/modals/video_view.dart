import 'package:flutter/material.dart';
import 'package:get/get.dart';
// To parse this JSON data, do
//
//     final videoPlayer = videoPlayerFromJson(jsonString);

import 'dart:convert';


VideoPlayer videoPlayerFromJson(String str) => VideoPlayer.fromJson(json.decode(str));

String videoPlayerToJson(VideoPlayer data) => json.encode(data.toJson());

class VideoPlayer {
    VideoPlayer({
        this.success,
        this.message,
        this.data,
    });

    bool success;
    String message;
    Data data;

    factory VideoPlayer.fromJson(Map<String, dynamic> json) => VideoPlayer(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.section,
        this.status,
        this.thumbnail,
        this.banner,
        this.link,
    });

    String section;
    String status;
    String thumbnail;
    String banner;
    String link;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        section: json["section"],
        status: json["status"],
        thumbnail: json["thumbnail"],
        banner: json["banner"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "section": section,
        "status": status,
        "thumbnail": thumbnail,
        "banner": banner,
        "link": link,
    };
}

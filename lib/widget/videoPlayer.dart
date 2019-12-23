// start ######################### VIDEO #############

import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';

class VideoSection extends StatefulWidget {
  @override
  _VideoSectionState createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  TextEditingController _idController = TextEditingController();
  String id = "pCGBHSyP1bo"; // link youtube
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SingleChildScrollView(
          child: YoutubePlayer(
            context: context,
            source: id,
            quality: YoutubeQuality.HD,
            autoPlay: false,
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: TextFormField(
        //     controller: _idController,
        //     decoration: InputDecoration(
        //         border: OutlineInputBorder(),
        //         hintText: "Enter youtube \<video id\> or \<link\>"),
        //   ),
        // ),
        // RaisedButton(
        //   onPressed: () {
        //     setState(() {
        //       id = _idController.text;
        //     });
        //   },
        //   child: Text("Play"),
        // ),
      ],
    );
  }
}

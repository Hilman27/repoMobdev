//import 'package:religi_app/Model/LayarUtama/feed.dart';

import 'dart:core';
import '_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feed.g.dart';




@JsonSerializable(explicitToJson: true)
class Feed {
  User user;
  Event event;
  Feed(this.user, this.event);

  Feed.fromFeed(Feed newfeed){
    this.user = newfeed.user;
    this.event = newfeed.event;
  }

  User get fUser => user;
  Event get fEvent => event;

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
  Map<String, dynamic> toJson() => _$FeedToJson(this);

}





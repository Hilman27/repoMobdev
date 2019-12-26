// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return Feed(
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['event'] == null
        ? null
        : Event.fromJson(json['event'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FeedToJson(Feed instance) => <String, dynamic>{
      'user': instance.user?.toJson(),
      'event': instance.event?.toJson(),
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['name'] as String,
    json['link'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'link': instance.link,
    };

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    json['eventID'] as int,
    json['imagePath'] as String,
    json['eventName'] as String,
    json['eventLocation'] as String,
    json['caption'] as String,
    json['edateTime'] == null
        ? null
        : DateTime.parse(json['edateTime'] as String),
    json['newsType'] as int,
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'eventID': instance.eventID,
      'imagePath': instance.imagePath,
      'eventName': instance.eventName,
      'eventLocation': instance.eventLocation,
      'caption': instance.caption,
      'newsType': instance.newsType,
      'edateTime': instance.edateTime?.toIso8601String(),
    };

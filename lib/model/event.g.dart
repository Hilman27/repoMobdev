// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    eventID: json['eventID'] as int,
    imagePath: json['imagePath'] as String,
    eventName: json['eventName'] as String,
    eventLocation: json['eventLocation'] as String,
    caption: json['caption'] as String,
    edateTime: json['edateTime'] == null
        ? null
        : DateTime.parse(json['edateTime'] as String),
    newsType: json['newsType'] as int,
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'News.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
      json['acontent'] as String,
      json['collect_status'] as int,
      json['collectn'] as int,
      json['content'] as String,
      json['create_nick_name'] as String,
      json['create_time'] as String,
      json['feed_id'] as int,
      json['feed_type'] as String,
      json['game_icon_url'] as String,
      json['game_id'] as int,
      json['game_name'] as String,
      json['game_plat_id'] as int,
      json['goodn'] as int,
      json['replyn'] as int,
      json['title'] as String,
      json['video_img'] as String,
      json['video_type'] as String,
      json['video_url'] as String);
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'acontent': instance.acontent,
      'collect_status': instance.collect_status,
      'collectn': instance.collectn,
      'content': instance.content,
      'create_nick_name': instance.create_nick_name,
      'create_time': instance.create_time,
      'feed_id': instance.feed_id,
      'feed_type': instance.feed_type,
      'game_icon_url': instance.game_icon_url,
      'game_id': instance.game_id,
      'game_name': instance.game_name,
      'game_plat_id': instance.game_plat_id,
      'goodn': instance.goodn,
      'replyn': instance.replyn,
      'title': instance.title,
      'video_img': instance.video_img,
      'video_type': instance.video_type,
      'video_url': instance.video_url
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['board_likes'] as int,
      json['created_time'] as String,
      json['extra_img'] as String,
      json['img'] as String,
      json['likes'] as int,
      json['nick_name'] as String,
      json['praise_count'] as int,
      json['user_id'] as int);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'board_likes': instance.board_likes,
      'created_time': instance.created_time,
      'extra_img': instance.extra_img,
      'img': instance.img,
      'likes': instance.likes,
      'nick_name': instance.nick_name,
      'praise_count': instance.praise_count,
      'user_id': instance.user_id
    };

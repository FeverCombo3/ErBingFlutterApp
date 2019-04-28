// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) {
  return Board(
      json['board_id'] as int,
      json['collect_status'] as int,
      json['create_time'] as String,
      json['img_url_blurry'] as String,
      json['img_url_large'] as String,
      json['img_url_small'] as String,
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
      'board_id': instance.board_id,
      'collect_status': instance.collect_status,
      'create_time': instance.create_time,
      'img_url_blurry': instance.img_url_blurry,
      'img_url_large': instance.img_url_large,
      'img_url_small': instance.img_url_small,
      'user': instance.user
    };

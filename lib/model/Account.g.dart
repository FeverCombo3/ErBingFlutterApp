// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
      json['create_time'] as String,
      json['desc'] as String,
      json['follow_num'] as int,
      json['followed_num'] as int,
      json['gender'] as int,
      json['img'] as String,
      json['nick_name'] as String);
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'create_time': instance.create_time,
      'desc': instance.desc,
      'follow_num': instance.follow_num,
      'followed_num': instance.followed_num,
      'gender': instance.gender,
      'img': instance.img,
      'nick_name': instance.nick_name
    };

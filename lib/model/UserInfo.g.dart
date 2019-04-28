// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(json['user_icon'] as String, json['user_id'] as int,
      json['user_nick'] as String);
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'user_icon': instance.user_icon,
      'user_id': instance.user_id,
      'user_nick': instance.user_nick
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return Comment(
      json['content'] as String,
      json['create_time'] as String,
      json['goodn'] as int,
      json['pid'] as int,
      json['praise_status'] as int,
      json['rep_id'] as int,
      json['reply_time'] as String,
      json['replyn'] as int,
      json['rtype'] as int,
      json['update_time'] as String,
      json['user_id'] as int,
      (json['child_list'] as List)
          ?.map((e) =>
              e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
          ?.toList())
    ..user = json['user'] == null
        ? null
        : Account.fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'content': instance.content,
      'create_time': instance.create_time,
      'goodn': instance.goodn,
      'pid': instance.pid,
      'praise_status': instance.praise_status,
      'rep_id': instance.rep_id,
      'reply_time': instance.reply_time,
      'replyn': instance.replyn,
      'rtype': instance.rtype,
      'update_time': instance.update_time,
      'user_id': instance.user_id,
      'user': instance.user,
      'child_list': instance.child_list
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
      json['a_type'] as int,
      json['article_id'] as int,
      json['creation_time'] as String,
      json['global_priority'] as int,
      json['imgs'] as String,
      json['preview'] as String,
      json['replyn'] as int,
      json['title'] as String,
      json['topic_name'] as String,
      json['topic_name_short'] as String,
      json['votedn'] as int,
      json['user_info'] == null
          ? null
          : UserInfo.fromJson(json['user_info'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'a_type': instance.a_type,
      'article_id': instance.article_id,
      'creation_time': instance.creation_time,
      'global_priority': instance.global_priority,
      'imgs': instance.imgs,
      'preview': instance.preview,
      'replyn': instance.replyn,
      'title': instance.title,
      'topic_name': instance.topic_name,
      'topic_name_short': instance.topic_name_short,
      'votedn': instance.votedn,
      'user_info': instance.user_info
    };

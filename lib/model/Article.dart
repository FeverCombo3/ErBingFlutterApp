
import 'package:flutter_project/model/UserInfo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Article.g.dart';

@JsonSerializable()
class Article{

  int a_type;

  int article_id;

  String creation_time;

  int global_priority;

  String imgs;

  String preview;

  int replyn;

  String title;

  String topic_name;

  String topic_name_short;

  int votedn;

  UserInfo user_info;

  Article(this.a_type, this.article_id, this.creation_time,
      this.global_priority, this.imgs, this.preview, this.replyn, this.title,
      this.topic_name, this.topic_name_short, this.votedn, this.user_info);


  factory Article.fromJson(Map<String,dynamic> json) => _$ArticleFromJson(json);

  Map<String,dynamic> toJson() => _$ArticleToJson(this);
}
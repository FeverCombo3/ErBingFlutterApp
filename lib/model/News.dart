import 'package:json_annotation/json_annotation.dart';

part 'News.g.dart';

@JsonSerializable(nullable: false)
class News{
  String acontent;

  int collect_status;

  int collectn;

  String content;

  String create_nick_name;

  String create_time;

  int feed_id;

  String feed_type;

  String game_icon_url;

  int game_id;

  String game_name;

  int game_plat_id;

  int goodn;

  int replyn;

  String title;

  String video_img;

  String video_type;

  String video_url;

  News(this.acontent, this.collect_status, this.collectn, this.content,
      this.create_nick_name, this.create_time, this.feed_id, this.feed_type,
      this.game_icon_url, this.game_id, this.game_name, this.game_plat_id,
      this.goodn, this.replyn, this.title, this.video_img,
      this.video_type, this.video_url);

  factory News.fromJson(Map<String,dynamic> json) => _$NewsFromJson(json);

  Map<String,dynamic> toJson() => _$NewsToJson(this);
}
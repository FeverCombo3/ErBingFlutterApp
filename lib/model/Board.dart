import 'package:flutter_project/model/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Board.g.dart';

@JsonSerializable()
class Board{

  int board_id;

  int collect_status;

  String create_time;

  String img_url_blurry;

  String img_url_large;

  String img_url_small;

  User user;

  Board(this.board_id, this.collect_status, this.create_time,
      this.img_url_blurry, this.img_url_large,this.img_url_small, this.user);

  factory Board.fromJson(Map<String,dynamic> json) => _$BoardFromJson(json);

  Map<String,dynamic> toJson() => _$BoardToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User{

  int board_likes;

  String created_time;

  String extra_img;

  String img;

  int likes;

  String nick_name;

  int praise_count;

  int user_id;

  User(this.board_likes, this.created_time, this.extra_img, this.img,
      this.likes, this.nick_name, this.praise_count, this.user_id);

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);

  Map<String,dynamic> toJson() => _$UserToJson(this);

}
import 'package:json_annotation/json_annotation.dart';

part 'Account.g.dart';

@JsonSerializable()
class Account{

  String create_time;

  String desc;

  int follow_num;

  int followed_num;

  int gender;

  String img;

  String nick_name;

  Account(this.create_time, this.desc, this.follow_num, this.followed_num,
      this.gender, this.img, this.nick_name);


  factory Account.fromJson(Map<String,dynamic> json) => _$AccountFromJson(json);

  Map<String,dynamic> toJson() => _$AccountToJson(this);
}
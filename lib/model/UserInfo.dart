import 'package:json_annotation/json_annotation.dart';
part 'UserInfo.g.dart';

@JsonSerializable()
class UserInfo{

  String user_icon;

  int user_id;

  String user_nick;

  UserInfo(this.user_icon, this.user_id, this.user_nick);

  factory UserInfo.fromJson(Map<String,dynamic> json) => _$UserInfoFromJson(json);

  Map<String,dynamic> toJson() => _$UserInfoToJson(this);
}

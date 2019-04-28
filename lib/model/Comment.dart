import 'package:flutter_project/model/Account.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Comment.g.dart';

@JsonSerializable()
class Comment{

  String content;

  String create_time;

  int goodn;

  int pid;

  int praise_status;

  int rep_id;

  String reply_time;

  int replyn;

  int rtype;

  String update_time;

  int user_id;

  Account user;

  List<Comment> child_list;


  Comment(this.content, this.create_time, this.goodn, this.pid,
      this.praise_status, this.rep_id, this.reply_time, this.replyn, this.rtype,
      this.update_time, this.user_id, this.child_list);

  factory Comment.fromJson(Map<String,dynamic> json) => _$CommentFromJson(json);

  Map<String,dynamic> toJson() => _$CommentToJson(this);
}
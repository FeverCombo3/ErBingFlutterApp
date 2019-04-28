import 'package:flutter/material.dart';
import 'package:flutter_project/model/Comment.dart';
import 'package:flutter_project/style/Style.dart';
import 'package:flutter_project/widget/CardItem.dart';
import 'package:flutter_project/widget/UserIconWidget.dart';

class NewsDetailsBodyItem extends StatelessWidget {
  final NewsDetailsBodyViewModel model;

  NewsDetailsBodyItem(this.model);

  @override
  Widget build(BuildContext context) {
    Widget userImage = new UserIconWidget(
        padding: const EdgeInsets.only(top: 0.0, right: 8.0, left: 0.0),
        width: 30.0,
        height: 30.0,
        image: model.userAvatar);
    return new Container(
      child: new CardItem(
          child: new FlatButton(
              onPressed: null,
              child: new Padding(
                padding: new EdgeInsets.only(
                    left: 0.0, top: 14.0, right: 0.0, bottom: 14.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    userImage,
                    new Expanded(
                        child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Row(
                        mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                                child: new Text(model.userName == null ? "用户9527" : model.userName, style: AppConstant.smallTextBold)),
                            new Container(
                                child: new Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    new Icon(Icons.thumb_up, size: 12.0),
                                    new Container(width: 3.0),
                                    new Text(model.likes,
                                        style: AppConstant.minText),
                                    new Container(width: 6.0),
                                    new Icon(Icons.comment, size: 12.0),
                                    new Container(width: 3.0),
                                    new Text(model.comments,
                                        style: AppConstant.minText),
                                  ],
                                ))
                          ],
                        ),
                        new Container(
                          height: 4.0,
                        ),
                        new Text(
                            model.userComment == null ? "" : model.userComment,
                            style: AppConstant.smallSubText),
                      ],
                    ))
                  ],
                ),
              ))),
    );
  }
}

class NewsDetailsBodyViewModel {
  String userAvatar;
  String userName;
  String userComment;
  String likes;
  String comments;

  NewsDetailsBodyViewModel.data(Comment comment) {
    userAvatar = comment.user.img;
    userName = comment.user.nick_name;
    userComment = comment.content;
    likes = comment.goodn.toString();
    comments = comment.replyn.toString();
  }
}

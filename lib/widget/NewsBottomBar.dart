import 'package:flutter/material.dart';
import 'package:flutter_project/style/Style.dart';

class NewsBottomBar extends StatelessWidget {

  final int praisenum;

  final int commentnum;

  final int storenum;

  NewsBottomBar(this.praisenum, this.commentnum, this.storenum);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: new EdgeInsets.only(
          left: 0.0, top: 12.0, right: 0.0, bottom: 6.0),
      child: new Row(
        children: <Widget>[
          new Expanded(child: new Row(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Icon(Icons.thumb_up, size: 15.0),
                  new Container(width: 3.0),
                  new Text("赞 " + praisenum.toString(),
                      style: AppConstant.smallText),
                ],
              )
            ],
          )),
          new Expanded(child: new Row(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Icon(Icons.comment, size: 12.0),
                  new Container(width: 3.0),
                  new Text("评论 " + commentnum.toString(),
                      style: AppConstant.smallText),
                ],
              )
            ],
          )),
          new Expanded(child: new Row(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Icon(Icons.star, size: 12.0),
                  new Container(width: 3.0),
                  new Text("收藏 " + storenum.toString(),
                      style: AppConstant.smallText),
                ],
              )
            ],
          )),
        ],
      ),
    );
  }

}
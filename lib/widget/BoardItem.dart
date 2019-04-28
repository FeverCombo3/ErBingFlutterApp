import 'package:flutter/material.dart';
import 'package:flutter_project/model/Board.dart';
import 'package:flutter_project/style/Style.dart';
import 'package:flutter_project/widget/CardItem.dart';
import 'package:flutter_project/widget/UserIconWidget.dart';

class BoardItem extends StatelessWidget {
  final BoardViewModel boardViewModel;

  final VoidCallback onPressed;

  BoardItem(this.boardViewModel, {this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    Widget userAvatar = new UserIconWidget(
      padding: const EdgeInsets.only(top: 0.0, right: 5.0, left: 0.0),
      width: 30.0,
      height: 30.0,
      image: boardViewModel.boardAvatar,
      onPressed: null,
    );

    return new Container(
      child: new CardItem(
        child: new FlatButton(
            onPressed: onPressed,
            child: new Padding(
              padding: new EdgeInsets.only(left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
              child: new Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      userAvatar,
                      new Expanded(child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(boardViewModel.boardName == null ? "" : boardViewModel.boardName,style: AppConstant.smallTextBold,maxLines: 1),
                          new Text(boardViewModel.boardLikes,style: AppConstant.minText,maxLines: 1)
                        ],
                      )),
                      new Text(boardViewModel.boardTime,style: AppConstant.smallSubText)
                    ],
                  ),
                  new Container(height: 12.0),
                  new FadeInImage.assetNetwork(
                    placeholder: AppIcons.DEFAULT_IMG,
                    fit: BoxFit.fitWidth,
                    image: boardViewModel.boardImg,
                  )
                ],
              ),
            )),
      ),
    );
  }
}

class BoardViewModel {
  String boardAvatar;
  String boardName;
  String boardLikes;
  String boardImg;
  String boardTime;

  BoardViewModel.data(Board board) {
    boardAvatar = board.user.img;
    boardName = board.user.nick_name;
    boardLikes = board.user.likes.toString() + " 惊了";
    boardImg = board.img_url_small;
    boardTime = board.create_time;
  }
}

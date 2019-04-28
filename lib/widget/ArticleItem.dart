import 'package:flutter/material.dart';
import 'package:flutter_project/model/Article.dart';
import 'package:flutter_project/style/Style.dart';
import 'package:flutter_project/utils/NavigatorUtils.dart';
import 'package:flutter_project/widget/CardItem.dart';
import 'package:flutter_project/widget/UserIconWidget.dart';

class ArticleItem extends StatelessWidget {
  final ArticleItemModel articleItemModel;

  final VoidCallback onPressed;

  ArticleItem(this.articleItemModel, {this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    Widget userAvatar = new UserIconWidget(
      padding: const EdgeInsets.only(top: 0.0, right: 5.0, left: 0.0),
      width: 30.0,
      height: 30.0,
      image: articleItemModel.articleAvatar,
      onPressed: null,
    );
    Widget botImage;
    List<String> images = articleItemModel.articleImgs;
    if (images.length == 0) {
      botImage = new Container();
    } else if (images.length == 1) {
      botImage = new RawMaterialButton(
        child: new ConstrainedBox(
            child: new FadeInImage.assetNetwork(
              placeholder: AppIcons.DEFAULT_IMG,
              image: images[0],
              fit: BoxFit.cover,
              height: 150,
            ),
            constraints: new BoxConstraints.expand(height: 150)),
        onPressed: null,
      );
    } else {
      botImage = new Container(
          height: 80.0,
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _botMultiImg(context, images[0]),
              new Container(width: 5.0),
              _botMultiImg(context, images[1]),
              new Container(width: 5.0),
              _botMultiImg(context, images.length == 2 ? null : images[2]),
            ],
          ));
    }
    return new Container(
      child: new CardItem(
        child: new FlatButton(
            onPressed: onPressed,
            child: new Padding(
              padding: new EdgeInsets.only(
                  left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
              child: new Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      userAvatar,
                      new Container(
                          margin: EdgeInsets.only(left: 6.0),
                          child: new Text(articleItemModel.articleName,
                              style: AppConstant.minText))
                    ],
                  ),
                  new Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 6.0),
                      child: new Text(articleItemModel.articleTitle,
                          style: AppConstant.smallTextBold)),
                  new Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 6.0),
                      child: new Text(articleItemModel.articleContent,
                          style: AppConstant.smallText)),
                  new Container(
                    margin: EdgeInsets.only(top: 8.0),
                    child: botImage,
                  ),
                  new Container(
                    margin: EdgeInsets.only(top: 8.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(
                            child: new Text(articleItemModel.articleFrom,
                                style: AppConstant.minText)),
                        new Container(
                            child: new Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new Icon(Icons.thumb_up, size: 12.0),
                            new Container(width: 3.0),
                            new Text(articleItemModel.articleLikes,
                                style: AppConstant.minText),
                            new Container(width: 6.0),
                            new Icon(Icons.comment, size: 12.0),
                            new Container(width: 3.0),
                            new Text(articleItemModel.articleComments,
                                style: AppConstant.minText),
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

_botMultiImg(context, String img) {
  return new Expanded(
      flex: 1,
      child: img != null
          ? new RawMaterialButton(
              onPressed: null,
              child: new FadeInImage.assetNetwork(
                placeholder: AppIcons.DEFAULT_IMG,
                fit: BoxFit.cover,
                image: img,
                height: 80.0,
              ))
          : new Container());
}

class ArticleItemModel {
  String articleAvatar;
  String articleName;
  String articleTitle;
  String articleContent;
  List<String> articleImgs;
  String articleFrom;
  String articleLikes;
  String articleComments;

  ArticleItemModel.data(Article article) {
    articleAvatar = article.user_info.user_icon;
    articleName = article.user_info.user_nick;
    articleTitle = article.title;
    articleContent = article.preview;
    articleImgs = article.imgs == null ? new List() : article.imgs.split(",");
    articleFrom = article.topic_name;
    articleLikes = article.votedn.toString();
    articleComments = article.replyn.toString();
  }
}

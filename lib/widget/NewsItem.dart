import 'package:flutter/material.dart';
import 'package:flutter_project/model/News.dart';
import 'package:flutter_project/style/Style.dart';
import 'package:flutter_project/utils/CommonUtils.dart';
import 'package:flutter_project/widget/CardItem.dart';
import 'package:flutter_project/widget/NewsBottomBar.dart';
import 'package:flutter_project/widget/UserIconWidget.dart';

class NewsItem extends StatelessWidget{

  final NewsViewModel newsViewModel;

  final VoidCallback onPressed;

  NewsItem(this.newsViewModel, {this.onPressed}) : super();

  @override
  Widget build(BuildContext context) {
    Widget userAvatar = new UserIconWidget(
      padding: const EdgeInsets.only(top: 0.0,right: 5.0,left: 0.0),
      width: 35.0,
      height: 35.0,
      image: newsViewModel.gameImg,
      onPressed: null,
    );
    Widget botImage;
    if(newsViewModel.gameType == "相册"){
      List<String> images = newsViewModel.gameImages;
      if(images.length == 0){
        botImage =  new Container();
      }else if(images.length == 1){
        botImage = new Container(
            height: 80.0,
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _botMultiImg(images[0]),
              ],
            )
        );
      }else{
        botImage = new Container(
          height: 80.0,
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _botMultiImg(images[0]),
              new Container(width: 5.0),
              _botMultiImg(images[1]),
              new Container(width: 5.0),
              _botMultiImg(images.length == 2 ? null : images[2]),
            ],
          )
        );
      }
    }else{
      botImage = new Container();
    }

    return new Container(
      child: new CardItem(
        child: new FlatButton(
            onPressed: onPressed,
            child: new Padding(
              padding: new EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 10.0),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      userAvatar,
                      new Expanded(child: new Text(newsViewModel.gameName == null ? "二柄APP" : newsViewModel.gameName,style: AppConstant.smallTextBold)),
                      new Text(newsViewModel.gameTime,style: AppConstant.smallSubText)
                    ],
                  ),
                  new Container(
                    child: new Text(newsViewModel.gameContent,style: AppConstant.smallSubText),
                    margin: new EdgeInsets.only(top: 6.0,bottom: 6.0),
                    alignment: Alignment.topLeft
                  ),
                  botImage,
                  new NewsBottomBar(newsViewModel.gameGoodn,newsViewModel.gameReplyn,newsViewModel.gameCollectn)
                ],
              ),
            )
        ),
      ),
    );
  }

}

_botMultiImg(String img) {
  return new Expanded(
      flex: 1,
      child: img != null ? new FadeInImage.assetNetwork(
        placeholder: AppIcons.DEFAULT_IMG,
        fit: BoxFit.cover,
        image: img,
        height: 80.0,
      ): new Container());
}

class NewsViewModel{
    String gameName;
    String gameImg;
    String gameTime;
    String gameContent;
    String gameType;
    int gameFeedId;
    int gamePlatId;
    int gameCollectn;
    int gameGoodn;
    int gameReplyn;
    List<String> gameImages;

    NewsViewModel.data(News news){
      gameName = news.game_name;
      gameImg = news.game_icon_url;
      gameTime = news.create_time;
      gameContent = news.content;
      gameImages = news.acontent.split(",");
      gameType = news.feed_type;
      gameFeedId = news.feed_id;
      gamePlatId = news.game_plat_id;
      gameCollectn = news.collectn;
      gameGoodn = news.goodn;
      gameReplyn = news.replyn;
    }

}
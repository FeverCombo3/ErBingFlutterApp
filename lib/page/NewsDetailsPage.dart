
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_project/dao/NewsDao.dart';
import 'package:flutter_project/widget/BaseNewsDetailsState.dart';
import 'package:flutter_project/widget/NewsItem.dart';
import 'package:flutter_project/widget/PullLoadWidget.dart';
import 'package:flutter_project/widget/TitleBar.dart';

class NewsDetailsPage extends StatefulWidget{


  final NewsViewModel newsViewModel;

  NewsDetailsPage(this.newsViewModel,{Key key}) : super(key:key);

  @override
  _NewsDetailState createState() => new _NewsDetailState(newsViewModel);

}

class _NewsDetailState extends BaseNewsDetailsState<NewsDetailsPage>{

  final NewsViewModel newsViewModel;

  _NewsDetailState(this.newsViewModel);

  @override
  Future<Null> handleRefresh() async{
    if(isLoading){
      return null;
    }
    isLoading = true;
    page = 0;

    var res = await NewsDao.getNewsCommentsData(newsViewModel.gameFeedId, newsViewModel.gamePlatId,page: page);

    resolveRefreshResult(res);
    resolveDataResult(res);

    isLoading = false;

    return null;
  }

  @override
  requestLoadMore() async {
    // TODO: implement requestLoadMore
    return await NewsDao.getNewsCommentsData(newsViewModel.gameFeedId,  newsViewModel.gamePlatId,page: page);
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  // TODO: implement isRefreshFirst
  bool get isRefreshFirst => true;

  @override
  // TODO: implement needHeader
  bool get needHeader => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: TitleBar(
          "资讯详情"
        ),
      ),
      body: PullLoadWidget(
            (BuildContext context, int index) =>
            renderItem(index,newsViewModel),
        onLoadMore,
        handleRefresh,
        pullLoadWidgetControl,
        refreshKey: refreshIndicatorKey,
      ),
    );
  }
}

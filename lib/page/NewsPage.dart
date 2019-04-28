import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project/dao/NewsDao.dart';
import 'package:flutter_project/model/News.dart';
import 'package:flutter_project/redux/GlobalState.dart';
import 'package:flutter_project/style/Config.dart';
import 'package:flutter_project/utils/NavigatorUtils.dart';
import 'package:flutter_project/widget/ListState.dart';
import 'package:flutter_project/widget/NewsItem.dart';
import 'package:flutter_project/widget/PullLoadWidget.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class NewsPage extends StatefulWidget {

  final int type;

  NewsPage({Key key ,this.type}) : super(key:key);

  @override
  _NewsPageState createState() => new _NewsPageState(type);
}



class _NewsPageState extends State<NewsPage>
    with
        AutomaticKeepAliveClientMixin<NewsPage>,
        ListState<NewsPage>,
        WidgetsBindingObserver {
  final int type;

  _NewsPageState(this.type);

  @override
  Future<Null> handleRefresh() async {
    if (isLoading) {
      return null;
    }
    isLoading = true;
    page = 0;
    var result = await NewsDao.getNewsData(_getStore(),type, page: page);
    setState(() {
      pullLoadWidgetControl.needLoadMore =
      (result != null && result.length == Config.PAGE_SIZE);
    });
    isLoading = false;
    return null;
  }

  @override
  Future<Null> onLoadMore() async {
    if (isLoading) {
      return null;
    }
    isLoading = true;
    page++;
    var result = await NewsDao.getNewsData(_getStore(),type, page: page);
    setState(() {
      pullLoadWidgetControl.needLoadMore = (result != null);
    });
    isLoading = false;
    return null;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  // TODO: implement isRefreshFirst
  bool get isRefreshFirst => false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    pullLoadWidgetControl.dataList = _getStore().state.newsList;
    if (pullLoadWidgetControl.dataList.length == 0) {
      showRefreshLoading();
    }
    super.didChangeDependencies();
  }

  Store<GlobalState> _getStore() {
    return StoreProvider.of(context);
  }

  _renderNewsItem(News n) {
    NewsViewModel newsViewModel = NewsViewModel.data(n);
    return new NewsItem(newsViewModel, onPressed: (){
      NavigatorUtils.goNewsDetails(context, newsViewModel);
    },);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new StoreBuilder<GlobalState>(builder: (context, store) {
      return PullLoadWidget(
            (BuildContext context, int index) =>
            _renderNewsItem(pullLoadWidgetControl.dataList[index]),
        onLoadMore,
        handleRefresh,
        pullLoadWidgetControl,
        refreshKey: refreshIndicatorKey,
      );
    }
    );
  }
}

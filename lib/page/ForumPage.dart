import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project/dao/ForumDao.dart';
import 'package:flutter_project/model/Article.dart';
import 'package:flutter_project/redux/GlobalState.dart';
import 'package:flutter_project/style/Config.dart';
import 'package:flutter_project/utils/NavigatorUtils.dart';
import 'package:flutter_project/widget/ArticleItem.dart';
import 'package:flutter_project/widget/ListState.dart';
import 'package:flutter_project/widget/PullLoadWidget.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ForumPage extends StatefulWidget{
  @override
  _ForumPageState createState() => new _ForumPageState();

}

class _ForumPageState extends State<ForumPage>
    with
        AutomaticKeepAliveClientMixin<ForumPage>,
        ListState<ForumPage>,
        WidgetsBindingObserver {
  @override
  Future<Null> handleRefresh() async {
    if (isLoading) {
      return null;
    }
    isLoading = true;
    page = 0;
    var result = await ForumDao.getForumDao(_getStore(), page: page);
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
    var result = await ForumDao.getForumDao(_getStore(), page: page);
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
    pullLoadWidgetControl.dataList = _getStore().state.articleList;
    if (pullLoadWidgetControl.dataList.length == 0) {
      showRefreshLoading();
    }
    super.didChangeDependencies();
  }

  Store<GlobalState> _getStore() {
    return StoreProvider.of(context);
  }

  _renderArticleItem(Article a) {
    ArticleItemModel articleItemModel = ArticleItemModel.data(a);
    return new ArticleItem(
        articleItemModel, onPressed:null);
  }

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<GlobalState>(builder: (context, store) {
      return PullLoadWidget(
            (BuildContext context, int index) =>
                _renderArticleItem(pullLoadWidgetControl.dataList[index]),
        onLoadMore,
        handleRefresh,
        pullLoadWidgetControl,
        refreshKey: refreshIndicatorKey,
      );
    });
  }
}
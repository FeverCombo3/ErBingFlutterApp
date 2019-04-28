import 'package:flutter/material.dart';
import 'package:flutter_project/model/Comment.dart';
import 'package:flutter_project/widget/ListState.dart';
import 'package:flutter_project/widget/NewsDetailsBodyItem.dart';
import 'package:flutter_project/widget/NewsDetailsHearderItem.dart';
import 'package:flutter_project/widget/NewsItem.dart';

abstract class BaseNewsDetailsState<T extends StatefulWidget> extends State<T> with AutomaticKeepAliveClientMixin<T>,ListState<T>{


  @protected
  renderItem(index,NewsViewModel model){
      if(index == 0){
        return new NewsItem(model);
      }else{
        Comment comment = pullLoadWidgetControl.dataList[index - 1];
        return new NewsDetailsBodyItem(NewsDetailsBodyViewModel.data(comment));
      }
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

}
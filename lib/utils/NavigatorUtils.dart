import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/page/Home.dart';
import 'package:flutter_project/page/HomePage.dart';
import 'package:flutter_project/page/NewsDetailsPage.dart';
import 'package:flutter_project/page/PhotoViewPage.dart';
import 'package:flutter_project/widget/NewsItem.dart';

/**
 * 导航栏
 * Created by yjq
 * Date: 2019-03-16
 */
class NavigatorUtils {
  ///替换
  static pushReplacementNamed(BuildContext context, String routeName) {
    Navigator.pushReplacementNamed(context, routeName);
  }

  ///切换无参数页面
  static pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  ///主页
  static goHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, HomePage.sName);
  }

  //主页2
  static goHome2(BuildContext context) {
    Navigator.pushReplacementNamed(context, Home.sName);
  }

  ///图片预览
  static gotoPhotoViewPage(BuildContext context, String url) {
//    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
//      return new PhotoViewPage(url);
//    }));
    NavigatorRouter(context, new PhotoViewPage(url));
  }


  static goNewsDetails(BuildContext context,NewsViewModel model){
    NavigatorRouter(context, new NewsDetailsPage(model));
  }

  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => widget));
  }

}

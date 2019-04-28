import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_project/page/ForumPage.dart';
import 'package:flutter_project/page/NewsPage.dart';
import 'package:flutter_project/page/NewsPage2.dart';
import 'package:flutter_project/page/ShowPage.dart';
import 'package:flutter_project/style/StringBase.dart';
import 'package:flutter_project/style/Style.dart';
import 'package:flutter_project/widget/HomeDrawer.dart';
import 'package:flutter_project/widget/TabBarWidget.dart';
import 'package:flutter_project/widget/TitleBar.dart';

class HomePage extends StatelessWidget{
  static final String sName = "home";

  /// 单击提示退出
  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          content: new Text("确定要退出吗？"),
          actions: <Widget>[
            new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text("取消")
            ),
            new FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text("确定")
            )
          ]
        ));
  }


  _renderTab(icon,text){
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon,size: 16.0),
          new Text(text)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List<Widget> tabs = [
      _renderTab(AppIcons.NEWS, StringBase.news),
      _renderTab(AppIcons.SHOW, "SHOW"),
      _renderTab(AppIcons.FORUM, "社区")
    ];

    return WillPopScope(
      onWillPop: (){
        return _dialogExitApp(context);
      },
      child: new TabBarWidget(
        drawer: new HomeDrawer(),
        type: TabBarWidget.BOTTOM_TAB,
        tabItems: tabs,
        tabViews: [
          new NewsPage(type: 0,),
          new ShowPage(),
          new ForumPage()
        ],
        backgroundColor: Colors.amberAccent,
        indicatorColor: Colors.white,
        title: new TitleBar(
          "二柄",
          iconData: AppIcons.MAIN_SEARCH,
          needRightLocalIcon: true,
          onPressed: null,
        ),
      )
    );

  }

}
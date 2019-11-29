import 'package:flutter/material.dart';
import 'package:flutter_project/provider/HomeProvider.dart';
import 'package:flutter_project/utils/dimens.dart';
import 'package:provider/provider.dart';

import '../style/Style.dart';
import 'ForumPage.dart';
import 'NewsPage.dart';
import 'ShowPage.dart';

class Home extends StatefulWidget{
  static final String sName = "home2";

  @override
  State<StatefulWidget> createState() => _HomeState();

}

class _HomeState extends State<Home>{

  var _pageList;
  var _pageTitles = ['资讯','炫图','社区'];
  final _pageController = PageController();

  HomeProvider provider = HomeProvider();

  List<BottomNavigationBarItem> _list;

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<HomeProvider>(
      create: (_) => provider,
      child: WillPopScope(
        onWillPop: ()=> _dialogExitApp(context),
        child: Scaffold(
          bottomNavigationBar: Consumer<HomeProvider>(
            builder: (_,provider,__){
              return BottomNavigationBar(
                backgroundColor: Colors.black,
                items: _buildBottomNavigationBarItem(),
                type: BottomNavigationBarType.fixed,
                currentIndex: provider.value,
                elevation: 2.0,
                iconSize: 25.0,
                selectedFontSize: Dimens.font_sp10,
                unselectedFontSize: Dimens.font_sp10,
                selectedItemColor: Colors.amberAccent,
                unselectedItemColor: Colors.white,
                onTap: (index){
                  _pageController.jumpToPage(index);
                }
              );
            },
          ),
          body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _pageList,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }

  void _onPageChanged(int index){
    provider.value = index;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPages();
  }

  void initPages(){
    _pageList = [
      new NewsPage(type: 0,),
      new ShowPage(),
      new ForumPage()
    ];
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem(){
    if(_list == null){
      var _tabPages = [
        [
          Icon(AppIcons.NEWS),
          Icon(AppIcons.NEWS,color: Colors.amberAccent)
        ],
        [
          Icon(AppIcons.SHOW),
          Icon(AppIcons.SHOW,color: Colors.amberAccent,)
        ],
        [
          Icon(AppIcons.FORUM),
          Icon(AppIcons.FORUM,color: Colors.amberAccent)
        ]
      ];
      _list = List.generate(3, (i){
        return BottomNavigationBarItem(
            icon: _tabPages[i][0],
            activeIcon: _tabPages[i][1],
            title: Padding(
              padding: const EdgeInsets.only(top: 1.5),
              child: Text(
                _pageTitles[i],
                key: Key(_pageTitles[i]),
              ),
            )
        );
      });
    }
    return _list;
  }
}
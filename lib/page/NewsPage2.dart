import 'package:flutter/material.dart';
import 'package:flutter_project/page/NewsPage.dart';
import 'package:flutter_project/style/Style.dart';
import 'package:flutter_project/widget/TabBarWidget.dart';

class NewsPage2 extends StatefulWidget{

  @override
  _NewsTypePageState createState() {
    // TODO: implement createState
    return new _NewsTypePageState();
  }

}

class TabTitle{
  String title;
  NewsPage newsPage;

  TabTitle(this.title,this.newsPage);
}

class _NewsTypePageState extends State<NewsPage2> with SingleTickerProviderStateMixin{

  TabController tabController;
  PageController topPageControl = new PageController(initialPage: 0);
  List<TabTitle> tabList;
  var currentPage = 0;
  var isPageCanChanged = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTabData();
    tabController = TabController(length: tabList.length, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Color(0xfff3f5f9),
            height: 38.0,
            child: TabBar(
                isScrollable: true,
                controller: tabController,
                labelColor: Colors.red,
                indicatorColor: Colors.amberAccent,
                unselectedLabelColor: Color(0xff666666),
                labelStyle: TextStyle(fontSize: 16.0),
                tabs: tabList.map((item) {
                  return Tab(
                    text: item.title,
                  );
                }).toList()
            ),
          ),
          Expanded(
            child: new TabBarView(
              controller: tabController,
                children: tabList.map((item) {
                  return item.newsPage; //使用参数值
                }).toList(),),
          )
        ],
      ),
    );
  }

  initTabData(){
    tabList = [
      new TabTitle("全部", new NewsPage(type: 0)),
      new TabTitle("要闻", new NewsPage(type: 7)),
      new TabTitle("PS", new NewsPage(type: 1)),
      new TabTitle("XBOX", new NewsPage(type: 2)),
      new TabTitle("任天堂", new NewsPage(type: 3)),
      new TabTitle("STEAM", new NewsPage(type: 4)),
      new TabTitle("深度", new NewsPage(type: 5)),
    ];
  }

  onPageChange(int index,{PageController p,TabController t}) async {
    if(p != null){
      isPageCanChanged = false;
      await topPageControl.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
      isPageCanChanged = true;
    }else{
      tabController.animateTo(index);
    }
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

}
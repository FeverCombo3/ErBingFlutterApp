import 'package:flutter/material.dart';
import 'package:flutter_project/style/Style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PullLoadWidget extends StatefulWidget{

  final IndexedWidgetBuilder itemBuilder;

  final RefreshCallback onLoadMore;

  final RefreshCallback onRefresh;

  final PullLoadWidgetControl control;

  final Key refreshKey;


  PullLoadWidget(this.itemBuilder, this.onLoadMore, this.onRefresh,
      this.control, {this.refreshKey});

  @override
  _PullLoadWidgetState createState() {
    // TODO: implement createState
    return new _PullLoadWidgetState(itemBuilder, onLoadMore, onRefresh, control, refreshKey);
  }

}

class _PullLoadWidgetState extends State<PullLoadWidget>{

  final IndexedWidgetBuilder itemBuilder;

  final RefreshCallback onLoadMore;

  final RefreshCallback onRefresh;

  final PullLoadWidgetControl control;

  final Key refreshKey;


  _PullLoadWidgetState(this.itemBuilder, this.onLoadMore, this.onRefresh,
      this.control, this.refreshKey);

  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        if(this.control.needLoadMore){
          this.onLoadMore?.call();
        }
      }
    });
    super.initState();
  }

  _getListCount(){
    if(control.needHead){
      return (control.dataList.length > 0) ? control.dataList.length + 2 : control.dataList.length + 1;
    }else{
      if(control.dataList.length == 0){
        return 1;
      }

      return (control.dataList.length > 0) ? control.dataList.length + 1 : control.dataList.length;
    }
  }

  _getItem(int index){
    if (!control.needHead && index == control.dataList.length && control.dataList.length != 0) {
      ///如果不需要头部，并且数据不为0，当index等于数据长度时，渲染加载更多Item（因为index是从0开始）
      return _buildProgressIndicator();
    } else if (control.needHead && index == _getListCount() - 1 && control.dataList.length != 0) {
      ///如果需要头部，并且数据不为0，当index等于实际渲染长度 - 1时，渲染加载更多Item（因为index是从0开始）
      return _buildProgressIndicator();
    } else if (!control.needHead && control.dataList.length == 0) {
      ///如果不需要头部，并且数据为0，渲染空页面
      return _buildEmpty();
    } else {
      ///回调外部正常渲染Item，如果这里有需要，可以直接返回相对位置的index
      return itemBuilder(context, index);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RefreshIndicator(
        key: refreshKey,
        onRefresh: onRefresh,
        child: new ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return _getItem(index);
            },
            itemCount: _getListCount(),
            controller: _scrollController,
        ),
  );
  }

  //空界面
  Widget _buildEmpty(){
    return new Container(
      height: MediaQuery.of(context).size.height - 100,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: (){},
            child: new Image(image: new AssetImage(AppIcons.DEFAULT_LOGO),width: 70.0,height: 70.0),
          ),
          Container(
            height: 10.0,
          ),
          Container(
            child: Text("目前什么都没有",style:AppConstant.normalText),
          )
        ],
      ),
    );
  }

  //上拉加载更多
  Widget _buildProgressIndicator(){
    Widget bottomWidget = (control.needLoadMore)
        ? new Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
          new SpinKitRotatingCircle(color:Theme.of(context).primaryColor),
          new Container(width: 5.0,),
          new Text("正在加载更多",
            style: TextStyle(
              color: Color(0xFF121917),
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          )
    ],)
        : new Container();
    return new Padding(
      padding: const EdgeInsets.all(20.0),
      child: new Center(
        child: bottomWidget,
      ),
    );
  }
}


class PullLoadWidgetControl{

  List dataList = new List();

  bool needLoadMore = true;

  bool needHead = false;
}
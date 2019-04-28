import 'package:flutter/material.dart';
import 'package:flutter_project/style/Style.dart';

class NewsDetailsHeaderItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 160,
      child: new Center(
        child:  new Text("我是头",style: AppConstant.largeTextBold) ,
      ),
    );
  }

}
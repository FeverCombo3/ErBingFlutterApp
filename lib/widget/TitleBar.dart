import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget{

  final String title;

  final IconData iconData;

  final VoidCallback onPressed;

  final bool needRightLocalIcon;

  final Widget rightWidget;


  TitleBar(this.title, {this.iconData, this.onPressed, this.needRightLocalIcon = false, this.rightWidget});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget widget = rightWidget;
    if(widget == null){
      widget = (needRightLocalIcon)
          ? new IconButton(
          icon: new Icon(
            iconData,
            size: 19.0,
          ),
          onPressed: onPressed)
          :new Container();
    }

    return Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
          ),
          widget
        ],
      ),
    );
  }

}
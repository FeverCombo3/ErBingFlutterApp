import 'package:flutter/material.dart';
import 'package:flutter_project/style/Style.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Drawer(
      child: new Column(
        children: <Widget>[
          new Expanded(
              child: new Container(
            color: Colors.amberAccent,
            child: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new ClipOval(
                    child: new Image(
                        image: new AssetImage(AppIcons.DEV_IMG),
                        width: 100,
                        height: 100),
                  ),
                  new Container(
                    height: 14,
                  ),
                  new Text("Created By YJQ", style: AppConstant.normalText)
                ],
              ),
            ),
          )),
          new Expanded(child: new Container())
        ],
      ),
    );
  }
}

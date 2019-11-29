import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project/redux/GlobalState.dart';
import 'package:flutter_project/style/Style.dart';
import 'package:flutter_project/utils/NavigatorUtils.dart';
import 'package:flutter_redux/flutter_redux.dart';

class WelcomePage extends StatefulWidget{
  static final String sName = "/";

  @override
  _WelcomePageState createState() => new _WelcomePageState();

}

class _WelcomePageState extends State<WelcomePage> {

  bool hadInit = false;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if(hadInit){
      return;
    }
    hadInit = true;

    new Future.delayed(const Duration(seconds: 2), () {
      NavigatorUtils.goHome2(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreBuilder<GlobalState>(
      builder: (context,store){
        return new Container(
          color: Colors.white,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(image: new AssetImage(AppIcons.DEFAULT_LOGO),width: 70.0,height: 70.0),
              Container(
                height: 10.0,
              ),
              Container(
                child: Text("二柄纯净版",style:new TextStyle(color: Colors.black87,fontSize: 20.0)),
              )
            ],
          ),
        );
      },
    );
  }
}
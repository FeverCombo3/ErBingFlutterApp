import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(new _CardWidgetState());

class DemoStatefulWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Container(
      child: new Center(
        child: new DemoStateWidget(""),
      ),
    );
  }
}

class _CardWidgetState extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: new CardWidget(),
    );
  }

}

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.grey,
      child: new Card(
        child: new FlatButton(
          onPressed: null,
          child: new Padding(
            padding: new EdgeInsets.only(
                left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Container(
                  child: new Text("HAHAHAHA",
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                      maxLines: 3,
                      textDirection: TextDirection.ltr),
                  margin: new EdgeInsets.only(top: 6, bottom: 2),
                  alignment: Alignment.topLeft,
                ),
                new Padding(padding: new EdgeInsets.all(10)),
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _getBottomItem(Icons.star, "1000"),
                    _getBottomItem(Icons.link, "1000"),
                    _getBottomItem(Icons.subject, "1000"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_getBottomItem(IconData icon, String text) {
  return new Expanded(
      flex: 1,
      child: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(
              icon,
              size: 16,
              color: Colors.grey,
            ),
            new Padding(padding: new EdgeInsets.only(left: 5)),
            new Text(text,
                style: new TextStyle(color: Colors.grey, fontSize: 15),
                maxLines: 1,
                textDirection: TextDirection.ltr)
          ],
        ),
      ));
}

class DemoStateWidget extends StatefulWidget {
  final String text;

  DemoStateWidget(this.text);

  @override
  State<StatefulWidget> createState() => new _DemoStateWidgetState(text);
}

class _DemoStateWidgetState extends State<DemoStateWidget> {
  String text;

  _DemoStateWidgetState(this.text);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        text = "数值变换";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text(text ?? "有状态", textDirection: TextDirection.ltr),
    );
  }
}

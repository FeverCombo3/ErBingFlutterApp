import 'package:flutter_project/style/Style.dart';
import 'package:flutter_project/widget/TitleBar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:flutter/material.dart';

class PhotoViewPage extends StatelessWidget {
  final String url;

  PhotoViewPage(this.url);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:Container(
        color: Colors.black87,
        child: new PhotoView(
          imageProvider: new NetworkImage(url ?? AppIcons.DEFAULT_IMG),
          loadingChild: Container(
            child: new Stack(
              children: <Widget>[
                new Center(
                    child: new Image.asset(AppIcons.DEFAULT_IMG,
                        height: 180.0, width: 180.0)),
                new Center(
                    child: new SpinKitFoldingCube(
                        color: Colors.white30, size: 60.0)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

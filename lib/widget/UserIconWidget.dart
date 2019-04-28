import 'package:flutter/material.dart';
import 'package:flutter_project/style/Style.dart';

class UserIconWidget extends StatelessWidget{
  
  final String image;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;


  UserIconWidget({this.image, this.onPressed, this.width = 30.0, this.height = 30.0, this.padding});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RawMaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: padding ?? const EdgeInsets.only(top: 4.0,right: 5.0,left: 5.0),
        constraints: const BoxConstraints(minWidth:0.0,minHeight: 0.0),
        child: new ClipOval(
          child: image == null ?
          new Image(image: new AssetImage(AppIcons.DEFAULT_LOGO),width: width,height: height):
          new FadeInImage.assetNetwork(
            placeholder: AppIcons.DEFAULT_LOGO,
            fit: BoxFit.fitWidth,
            image: image == null ? AppIcons.DEFAULT_LOGO : image,
            width: width,
            height: height,
          )
        ),
        onPressed: onPressed
    );
  }
  
}
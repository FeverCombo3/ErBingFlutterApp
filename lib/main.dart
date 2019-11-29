import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_project/page/Home.dart';
import 'package:flutter_project/page/HomePage.dart';
import 'package:flutter_project/page/WelcomePage.dart';
import 'package:flutter_project/redux/GlobalState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main(){
  runApp(new ErBingApp());
}

class ErBingApp extends StatelessWidget{

  final store = new Store<GlobalState>(
    appReducer,
    initialState: new GlobalState(
      newsList: new List(),
      boardList: new List(),
      articleList: new List()
    )
  );

  ErBingApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return new StoreProvider(
      store: store,
      child: new StoreBuilder<GlobalState>(
          builder: (context, store) {
            return new MaterialApp(
              theme: new ThemeData(
                  brightness: Brightness.light,
                  primaryColor: Colors.amberAccent),
              routes: {
                WelcomePage.sName: (context) {
                  return WelcomePage();
                },
//                HomePage.sName:(context){
//                  return new HomePage();
//                }
                Home.sName: (context) {
                  return new Home();
                }
              },
            );
          }
      ),
    );


  }

}
import 'package:flutter/material.dart';
import 'package:flutter_project/model/Article.dart';
import 'package:flutter_project/model/Board.dart';
import 'package:flutter_project/model/News.dart';
import 'package:flutter_project/redux/BoardReducer.dart';
import 'package:flutter_project/redux/ForumReducer.dart';
import 'package:flutter_project/redux/NewsReducer.dart';

class GlobalState{

  List<News> newsList = new List();

  List<Board> boardList = new List();

  List<Article> articleList = new List();

  GlobalState({this.newsList,this.boardList,this.articleList});

}

GlobalState appReducer(GlobalState state,action){
  return GlobalState(
    newsList: NewsReducer(state.newsList,action),
    boardList: BoardReducer(state.boardList,action),
    articleList: ForumReducer(state.articleList,action)
  );
}
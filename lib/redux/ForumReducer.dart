

import 'package:flutter_project/model/Article.dart';
import 'package:flutter_project/model/Board.dart';
import 'package:redux/redux.dart';

final ForumReducer = combineReducers<List<Article>>([
  TypedReducer<List<Article>, RefreshForumAction>(_refresh),
  TypedReducer<List<Article>, LoadMoreForumAction>(_loadMore)
]);

List<Article> _refresh(List<Article> list, action) {
  list.clear();
  if (action.list == null) {
    return list;
  } else {
    list.addAll(action.list);
    return list;
  }
}

List<Article> _loadMore(List<Article> list, action) {
  if (action.list != null) {
    list.addAll(action.list);
  }
  return list;
}

class RefreshForumAction {
  final List<Article> list;

  RefreshForumAction(this.list);
}

class LoadMoreForumAction {
  final List<Article> list;

  LoadMoreForumAction(this.list);
}

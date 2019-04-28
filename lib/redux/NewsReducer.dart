import 'package:flutter_project/model/News.dart';
import 'package:redux/redux.dart';

final NewsReducer = combineReducers<List<News>>([
  TypedReducer<List<News>, RefreshNewsAction>(_refresh),
  TypedReducer<List<News>, LoadMoreNewsAction>(_loadMore)
]);

List<News> _refresh(List<News> list, action) {
  list.clear();
  if (action.list == null) {
    return list;
  } else {
    list.addAll(action.list);
    return list;
  }
}

List<News> _loadMore(List<News> list, action) {
  if (action.list != null) {
    list.addAll(action.list);
  }
  return list;
}

class RefreshNewsAction {
  final List<News> list;

  RefreshNewsAction(this.list);
}

class LoadMoreNewsAction {
  final List<News> list;

  LoadMoreNewsAction(this.list);
}

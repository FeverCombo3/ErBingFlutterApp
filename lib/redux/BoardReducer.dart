import 'package:flutter_project/model/Board.dart';
import 'package:redux/redux.dart';

final BoardReducer = combineReducers<List<Board>>([
  TypedReducer<List<Board>, RefreshBoardAction>(_refresh),
  TypedReducer<List<Board>, LoadMoreBoardAction>(_loadMore)
]);

List<Board> _refresh(List<Board> list, action) {
  list.clear();
  if (action.list == null) {
    return list;
  } else {
    list.addAll(action.list);
    return list;
  }
}

List<Board> _loadMore(List<Board> list, action) {
  if (action.list != null) {
    list.addAll(action.list);
  }
  return list;
}

class RefreshBoardAction {
  final List<Board> list;

  RefreshBoardAction(this.list);
}

class LoadMoreBoardAction {
  final List<Board> list;

  LoadMoreBoardAction(this.list);
}

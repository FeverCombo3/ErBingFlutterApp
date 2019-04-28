
import 'package:flutter_project/model/Board.dart';
import 'package:flutter_project/net/Address.dart';
import 'package:flutter_project/net/Api.dart';
import 'package:flutter_project/redux/BoardReducer.dart';
import 'package:flutter_project/redux/GlobalState.dart';
import 'package:redux/redux.dart';

class BoardDao{

  static getBoardData(Store<GlobalState> store,{page =0,bool needDb = false}) async{
    String url = Address.getBoard() + Address.getPageParam("?",page);

    var res = await HttpManager.netFetch(url, null, null, null);
    if(res != null && res.result){
      List<Board> list = new List();
      var data = res.data;
      if(data == null || data.length == 0){
        return null;
      }

      var boards = data["boards"];

      for(int i=0;i<boards.length;i++){
        list.add(Board.fromJson(boards[i]));
      }

      if(page == 0){
        store.dispatch(new RefreshBoardAction(list));
      }else{
        store.dispatch(new LoadMoreBoardAction(list));
      }
      return list;
    }else{
      return null;
    }
  }
}
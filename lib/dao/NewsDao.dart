
import 'package:flutter_project/model/Comment.dart';
import 'package:flutter_project/model/News.dart';
import 'package:flutter_project/net/Address.dart';
import 'package:flutter_project/net/Api.dart';
import 'package:flutter_project/net/DaoResult.dart';
import 'package:flutter_project/redux/GlobalState.dart';
import 'package:flutter_project/redux/NewsReducer.dart';
import 'package:redux/redux.dart';

class NewsDao{

  static getNewsData(Store<GlobalState> store,tagType,{page =0,bool needDb = false}) async{
      String url = Address.getNews(tagType) + Address.getPageParam("&",page);

      var res = await HttpManager.netFetch(url, null, null, null);
      if(res != null && res.result){
        List<News> list = new List();
        var data = res.data;
        if(data == null || data.length == 0){
          return null;
        }

        var feeds = data["feeds"];

        for(int i=0;i<feeds.length;i++){
          list.add(News.fromJson(feeds[i]));
        }

        if(page == 0){
          store.dispatch(new RefreshNewsAction(list));
        }else{
          store.dispatch(new LoadMoreNewsAction(list));
        }
        return list;
      }else{
        return null;
      }
  }

  //http://api.diershoubing.com:5000/comment/hot_common_reply/v2/2/50117/?is_hot=1&pn=0&rn=20&child_limit=2&has_hot=1&platform_id=1&game_plat_id=4103&src=android&version=652
  static getNewsCommentsData(feedid,platid,{page = 0,bool needDb = false}) async{
      String url = Address.getNewsComments(feedid, platid) + Address.getPageParam("&", page);

      var res = await HttpManager.netFetch(url, null, null, null);
      if(res != null && res.result){
        List<Comment> list = new List();
        var data = res.data;
        if(data == null && data.length == 0){
          return new DataResult(list,true);
        }

        var replys = data["replys"];

        for(int i=0;i<replys.length;i++){
          list.add(Comment.fromJson(replys[i]));
        }
        return new DataResult(list, true);
      }else{
        return null;
      }

  }

}
